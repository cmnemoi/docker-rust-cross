FROM rust:1.68.0-alpine3.17
MAINTAINER Charles Samborski <demurgos@demurgos.net>

RUN apk add --no-cache curl \
  && mkdir -p /opt/sccache \
  && curl -L https://github.com/mozilla/sccache/releases/download/v0.3.3/sccache-v0.3.3-x86_64-unknown-linux-musl.tar.gz \
    | tar -xz --to-stdout "sccache-v0.3.3-x86_64-unknown-linux-musl/sccache" > /opt/sccache/sccache \
  && chmod +x /opt/sccache/sccache \
  && apk del --purge curl

ENV PATH=/opt/sccache:$PATH

RUN apk add --no-cache curl docker \
  && mkdir -p /opt/cross \
  && curl -L https://github.com/cross-rs/cross/releases/download/v0.2.5/cross-x86_64-unknown-linux-musl.tar.gz \
    | tar -xz --to-stdout "cross" > /opt/cross/cross \
  && chmod +x /opt/cross/cross \
  && apk del --purge curl

ENV PATH=/opt/cross:$PATH

RUN rustup target add x86_64-unknown-linux-gnu x86_64-pc-windows-gnu

CMD ["/bin/sh"]
