import { eq } from "drizzle-orm";
import { swapExecuted } from "./db/schema/Listener"; // Adjust the import path as necessary
import { types, db, App, middlewares } from "@duneanalytics/sim-idx"; // Import schema to ensure it's registered


const app = App.create();
app.use("*", middlewares.authentication);

app.get("/", async (c) => {
  try {
    const result = await db
      .client(c)
      .select()
      .from(swapExecuted)
      .limit(20);

    return Response.json({
      result: result,
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

app.get("/filtered/:poolId", async (c) => {
  try {
    const poolIdHex = c.req.param("poolId");
    if (!poolIdHex || !/^0x[0-9a-fA-F]+$/.test(poolIdHex)) {
      return Response.json(
        { error: "Invalid or missing poolId" },
        { status: 400 }
      );
    }

    const poolId = types.Bytes.from(poolIdHex);
    console.log(poolId);

    const result = await db
      .client(c)
      .select()
      .from(swapExecuted)
      .where(eq(swapExecuted.id, poolId))
      .limit(20);

    return Response.json({ result });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

export default app;
