# Remember to update the tag when updating
FROM rust:1.75.0-alpine3.19
MAINTAINER Charles Samborski <demurgos@demurgos.net>

RUN apk add --no-cache build-base curl docker yarn

RUN mkdir -p /opt/sccache \
  && curl -L https://github.com/mozilla/sccache/releases/download/v0.7.4/sccache-v0.7.4-x86_64-unknown-linux-musl.tar.gz \
    | tar -xz --to-stdout "sccache-v0.7.4-x86_64-unknown-linux-musl/sccache" > /opt/sccache/sccache \
  && chmod +x /opt/sccache/sccache

ENV PATH=/opt/sccache:$PATH

# Prebuilt binary is fairly old; fetching from `main`
RUN cargo install cross --git https://github.com/cross-rs/cross
#RUN mkdir -p /opt/cross \
#  && curl -L https://github.com/cross-rs/cross/releases/download/v0.2.5/cross-x86_64-unknown-linux-musl.tar.gz \
#    | tar -xz --to-stdout "cross" > /opt/cross/cross \
#  && chmod +x /opt/cross/cross
#
#ENV PATH=/opt/cross:$PATH

CMD ["/bin/sh"]
