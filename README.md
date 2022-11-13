## Build

```
cargo build --target wasm32-wasi --release
```

```
docker build --platform wasi/wasm32 -t hello-wasm .
```

```
docker run --rm --name=hello-wasm \
  --runtime=io.containerd.wasmedge.v1 \
  --platform=wasi/wasm32 \
  hello-wasm
```

## Install

```
rustup target add wasm32-wasi
```

```
cargo new hello-wasm
```

## Links

- https://nigelpoulton.com/getting-started-with-docker-and-wasm/
