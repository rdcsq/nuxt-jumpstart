FROM oven/bun:1 AS base
WORKDIR /app

# install deps
FROM base AS install
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

# build
FROM base AS build
COPY --from=install /app/node_modules node_modules
COPY . .
RUN bun install --frozen-lockfile
RUN bun run build --preset=bun

# copy build to final image
FROM base AS release
COPY --from=build /app/.output .
CMD ["bun", "--bun", "run", "server/index.mjs"]