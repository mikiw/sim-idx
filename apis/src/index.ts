import { eq, desc } from "drizzle-orm";
import { swapExecuted, poolInitialized } from "./db/schema/Listener"; // Adjust the import path as necessary
import { types, db, App, middlewares } from "@duneanalytics/sim-idx"; // Import schema to ensure it's registered


const app = App.create();
app.use("*", middlewares.authentication);

app.get("/", async (c) => {
  try {
    const client = db.client(c);

    const [swaps, pools] = await Promise.all([
      client
        .select()
        .from(swapExecuted)
        .orderBy(desc(swapExecuted.blockHeight))
        .limit(100),
      client
        .select()
        .from(poolInitialized)
        .orderBy(desc(poolInitialized.blockHeight))
        .limit(100),
    ]);

    return Response.json({ swaps, pools });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

app.get("/pool", async (c) => {
  try {
    const result = await db
      .client(c)
      .select()
      .from(poolInitialized)
      .orderBy(desc(poolInitialized.blockHeight))
      .limit(100);

    return Response.json({
      result: result,
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
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
      .where(eq(poolInitialized.id, poolId))
      .orderBy(desc(poolInitialized.blockHeight));

    return Response.json({ result });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

app.get("/swaps", async (c) => {
  try {
    const result = await db
      .client(c)
      .select()
      .from(swapExecuted)
      .orderBy(desc(swapExecuted.blockHeight))
      .limit(100);

    return Response.json({ result });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
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
      .limit(100);

    return Response.json({ result });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

export default app;
