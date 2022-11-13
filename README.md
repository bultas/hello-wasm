## Build

```
docker build --platform wasi/wasm32 -t hello-wasm .
```

## Build manual

```
cargo build --target wasm32-wasi --release
```

```
docker build -f Dockerfile_wrapper --platform wasi/wasm32 -t hello-wasm .
```

## Run

```
docker run --rm --name=hello-wasm \
  --runtime=io.containerd.wasmedge.v1 \
  --platform=wasi/wasm32 \
  hello-wasm
```

## Links

- https://www.docker.com/blog/docker-wasm-technical-preview/
- https://nigelpoulton.com/getting-started-with-docker-and-wasm/
