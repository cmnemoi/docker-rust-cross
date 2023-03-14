# Docker image for Rust cross compilation

This is my custom image for Rust cross compilation.

```
# pacman -S docker-buildx
git submodule update --init --recursive
./generate.sh
./host/publish.sh
./guest-x86_64-apple-darwin/publish.sh
./guest-x86_64-pc-windows-gnu/publish.sh
./guest-x86_64-unknown-linux-gnu/publish.sh
```

Images:
- `rust-cross-host`: Host image
- `rust-cross-guest-x86_64-apple-darwin`: Guest image for `x86_64-apple-darwin`
- `rust-cross-guest-x86_64-pc-windows-gnu`: Guest image for `x86_64-pc-windows-gnu`
- `rust-cross-guest-x86_64-unknown-linux-gnu`: Guest image for `x86_64-unknown-linux-gnu`
