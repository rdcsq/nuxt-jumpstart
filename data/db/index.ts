import type { PostgresJsDatabase } from "drizzle-orm/postgres-js";
import * as schema from "./schema/_schema";

export type Database = PostgresJsDatabase<typeof schema>;
