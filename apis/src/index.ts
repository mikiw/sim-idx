import { eq, desc, sql } from "drizzle-orm";
import { swapExecuted, poolInitialized } from "./db/schema/Listener"; // Adjust the import path as necessary
import { types, db, App, middlewares } from "@duneanalytics/sim-idx"; // Import schema to ensure it's registered


const app = App.create();
app.use("*", middlewares.authentication);

function errorPayload(e: unknown) {
  const err = e as any;
  return {
    error: err?.message ?? String(e),
    cause: err?.cause?.message ?? err?.cause ?? null,
    stack: err?.stack ?? null,
  };
}

const toHex = (val: unknown): string => {
  if (val instanceof Uint8Array) {
    return "0x" + Array.from(val).map((b) => b.toString(16).padStart(2, "0")).join("");
  }
  const s = String(val);
  return s.startsWith("0x") ? s : s;
};

const fetchLatestBlockHeights = async (client: any): Promise<Map<string, number>> => {
  const res = await client.execute(sql`
    SELECT id, MAX(block_height) AS max_block_height
    FROM swap_executed
    GROUP BY id;
  `);

  const rows: any[] = (res as any)?.rows ?? (Array.isArray(res) ? res : []);
  const map = new Map<string, number>();
  for (const r of rows) {
    const poolIdHex = toHex((r as any).id);
    const maxBh = Number((r as any).max_block_height ?? (r as any).maxBlockHeight ?? 0);
    if (!Number.isNaN(maxBh)) map.set(poolIdHex, maxBh);
  }
  return map;
};

const detectAndEmitNewSwaps = async (
  client: any,
  lastSeen: Map<string, number>,
  send: (data: unknown) => Promise<void>
): Promise<void> => {
  const latest = await fetchLatestBlockHeights(client);
  for (const [poolId, maxBh] of latest) {
    const prev = lastSeen.get(poolId) ?? -1;
    if (maxBh > prev) {
      await send({ type: "swap", poolId, blockHeight: maxBh });
      lastSeen.set(poolId, maxBh);
    }
  }
};

// Server-Sent Events handler
const sseHandler = (clinet: any): Response => {
  const interval = 5_000;
  const req = clinet.req.raw as Request;
  const { readable, writable } = new TransformStream();
  const writer = writable.getWriter();
  const encoder = new TextEncoder();

  const send = (data: unknown) => {
    const payload = `data: ${JSON.stringify(data)}\n\n`;
    return writer.write(encoder.encode(payload));
  };

  let closed = false;
  const onAbort = () => {
    closed = true;
    try { writer.close(); } catch {}
  };
  req.signal.addEventListener("abort", onAbort);

  (async () => {
    // last seen block heights
    const initBlockMap = new Map<string, number>();

    try {
      const client = db.client(clinet);

      await send({ type: "ready", interval });

      try {
        const seed = await fetchLatestBlockHeights(client);
        seed.forEach((v, k) => initBlockMap.set(k, v));
      } catch (err) {
        await send({ type: "warn", message: "Failed to seed lastSeen; starting fresh", error: (err as any)?.message ?? String(err) });
      }

      while (!closed) {
        try {
          await detectAndEmitNewSwaps(client, initBlockMap, send);
          await send({ type: "ping", ts: Date.now() });
        } catch (loopErr) {
          await send({ type: "error", message: (loopErr as any)?.message ?? String(loopErr) });
        }

        await new Promise<void>((r) => setTimeout(r, interval));
      }
    } catch {
    } finally {
      try { writer.close(); } catch {}
    }
  })();

  return new Response(readable, {
    headers: {
      "Content-Type": "text/event-stream; charset=utf-8",
      "Cache-Control": "no-cache, no-transform",
      "Access-Control-Allow-Origin": "*",
    },
  });
};

app.get("/ws", (c) => sseHandler(c));

app.get("/", async (c) => {
  try {
    const client = db.client(c);

    const [swaps, pools] = await Promise.all([
      client
        .select()
        .from(swapExecuted)
        .orderBy(desc(swapExecuted.blockHeight))
        .limit(5),
      client
        .select()
        .from(poolInitialized)
        .orderBy(desc(poolInitialized.blockHeight))
        .limit(5),
    ]);

    return Response.json({ testSwaps: swaps, testPools: pools });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json(errorPayload(e), { status: 500 });
  }
});

app.get("/pool", async (c) => {
  try {
    const result = await db
      .client(c)
      .select()
      .from(poolInitialized)
      .orderBy(desc(poolInitialized.blockHeight))
      .limit(1000);

    return Response.json({
      result: result,
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json(errorPayload(e), { status: 500 });
  }
});

app.get("/pool/:poolId", async (c) => {
  try {
    const poolIdHex = c.req.param("poolId");
    if (!poolIdHex || !/^0x[0-9a-fA-F]+$/.test(poolIdHex)) {
      return Response.json(
        { error: "Invalid or missing poolId" },
        { status: 400 }
      );
    }

    const poolId = types.Bytes.from(poolIdHex);

    const result = await db
      .client(c)
      .select()
      .from(poolInitialized)
      .where(eq(poolInitialized.id, poolId));

    return Response.json({ result });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json(errorPayload(e), { status: 500 });
  }
});

app.get("/swaps/:poolId", async (c) => {
  try {
    const poolIdHex = c.req.param("poolId");
    if (!poolIdHex || !/^0x[0-9a-fA-F]+$/.test(poolIdHex)) {
      return Response.json(
        { error: "Invalid or missing poolId" },
        { status: 400 }
      );
    }

    const poolId = types.Bytes.from(poolIdHex);

    const result = await db
      .client(c)
      .select()
      .from(swapExecuted)
      .where(eq(swapExecuted.id, poolId))
      .orderBy(desc(swapExecuted.blockHeight))
      .limit(1000);

    return Response.json({ result });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json(errorPayload(e), { status: 500 });
  }
});

app.get("/debug", async (c) => {
  try {
    const client = db.client(c);

    const tables = await client.execute(sql`
      select table_schema, table_name
      from information_schema.tables
      where table_name in ('swap_executed','pool_initialized')
      order by table_schema, table_name;
    `);

    const swapCols = await client.execute(sql`
      select column_name, data_type
      from information_schema.columns
      where table_name = 'swap_executed'
      order by ordinal_position;
    `);

    const poolCols = await client.execute(sql`
      select column_name, data_type
      from information_schema.columns
      where table_name = 'pool_initialized'
      order by ordinal_position;
    `);

    return Response.json({ tables, swapCols, poolCols });
  } catch (e) {
    return Response.json(errorPayload(e), { status: 500 });
  }
});


app.get("/block-heights", async (c) => {
  try {
    const client = db.client(c);
    const map = await fetchLatestBlockHeights(client);

    const result = Array.from(map.entries()).map(([poolId, blockHeight]) => ({
      poolId,
      blockHeight,
    }));

    return Response.json({ result });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json(errorPayload(e), { status: 500 });
  }
});

export default app;
