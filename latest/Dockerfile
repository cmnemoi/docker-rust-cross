FROM alpine:3.17.2
MAINTAINER Charles Samborski <demurgos@demurgos.net>

RUN apk add --no-cache curl \
  && curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs > ./rustup-init.sh \
  && chmod +x ./rustup-init.sh \
  && ./rustup-init.sh -y --profile minimal --default-toolchain stable \
  && rm ./rustup-init.sh \
  && apk del --purge curl

ENV PATH=/root/.cargo/bin:$PATH

RUN apk add --no-cache build-base openssl-dev \
  && rustup target add wasm32-unknown-unknown \
  && cargo install sccache \
  && cargo install cross --git https://github.com/cross-rs/cross

RUN rm -rf "~/.cargo/registry/cache/" "~/.cargo/registry/index/" "~/.cargo/git/db/"

CMD ["/bin/sh"]
