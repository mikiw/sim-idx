import { eq } from "drizzle-orm";
import { swapExecuted } from "./db/schema/Listener"; // Adjust the import path as necessary
import { types, db, App, middlewares } from "@duneanalytics/sim-idx"; // Import schema to ensure it's registered

// ETH10/WETH pool on BASE
const poolAddress = types.Address.from(
  "0xea41bec5d27a25a772fb0162782b8365d42990e477910490b8a10a5a56280200"
);

const app = App.create();
app.use("*", middlewares.authentication);

app.get("/*", async (c) => {
  try {
    const result = await db
      .client(c)
      .select()
      .from(swapExecuted)
      .where(eq(swapExecuted.id, poolAddress))
      .limit(10);

    return Response.json({
      result: result,
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

export default app;
