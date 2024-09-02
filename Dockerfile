FROM oven/bun:1 AS base
WORKDIR /app

# build
FROM base AS install
RUN mkdir -p /temp/dev
COPY package.json bun.lockb /temp/dev/
RUN cd /temp/dev && bun install --frozen-lockfile && bun run build

# copy build to final image
FROM base AS release
COPY --from=install /temp/dev/.output .
CMD ["bun", "--bun", "run", "server/index.mjs"]