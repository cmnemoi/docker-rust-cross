# Docker image for Rust cross compilation

This is my custom image for Rust cross compilation.

```
# pacman -S docker-buildx
git submodule update --init --recursive
./generate.sh
./host/publish.sh
```

Images:
- `rust-cross-host`: Host image
- `rust-cross-guest-x86_64-pc-windows-gnu`: Guest image for `x86_64-pc-windows-gnu`
