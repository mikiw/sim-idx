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
      .limit(200);

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
      .limit(200);

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

export default app;
