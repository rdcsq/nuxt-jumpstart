import type { Config } from "drizzle-kit";

export default {
    dialect: "postgresql",
    dbCredentials: {
        url: process.env.DATABASE_URL!,
    },
    schema: "data/db/schema/_schema.ts",
} satisfies Config;