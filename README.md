```
rustup target add wasm32-wasi
```

```
cargo new hello-wasm
```

```
cargo build --target wasm32-wasi --release
```

```
docker build --platform wasi/wasm32 -t hello-wasm .
```

### Links

- https://nigelpoulton.com/getting-started-with-docker-and-wasm/