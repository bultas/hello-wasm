FROM --platform=$BUILDPLATFORM rust:1.64 AS buildbase
WORKDIR /src
RUN <<EOT bash
    set -ex
    apt-get update
    apt-get install -y \
        git \
        clang
    rustup target add wasm32-wasi
EOT

FROM buildbase AS build
COPY Cargo.toml .
COPY src ./src

# RUN --mount=type=cache,target=/usr/local/cargo/git/db \
#     --mount=type=cache,target=/usr/local/cargo/registry/cache \
#     --mount=type=cache,target=/usr/local/cargo/registry/index \
#     cargo build --target wasm32-wasi --release

RUN cargo build --target wasm32-wasi --release

## docker build --progress=plain
# RUN echo $(ls -1 /src/target)


FROM scratch
COPY --link --from=build /src/target/wasm32-wasi/release/hello-wasm.wasm /hello-wasm.wasm
ENTRYPOINT [ "hello-wasm.wasm" ]

