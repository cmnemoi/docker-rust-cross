# Remember to update the tag when updating
FROM rust:1.81-alpine3.20
LABEL org.opencontainers.image.authors="Charles Samborski <demurgos@demurgos.net>"

RUN apk add --no-cache build-base curl docker yarn

RUN mkdir -p /opt/sccache \
  && curl -L https://github.com/mozilla/sccache/releases/download/v0.8.1/sccache-v0.8.1-x86_64-unknown-linux-musl.tar.gz \
    | tar -xz --to-stdout "sccache-v0.8.1-x86_64-unknown-linux-musl/sccache" > /opt/sccache/sccache \
  && chmod +x /opt/sccache/sccache

ENV PATH=/opt/sccache:$PATH

# Prebuilt binary is fairly old; fetching from `main`
# <https://github.com/cross-rs/cross/discussions/1290>
# <https://github.com/cross-rs/cross/issues/1356>
RUN cargo install cross --git https://github.com/cross-rs/cross
#RUN mkdir -p /opt/cross \
#  && curl -L https://github.com/cross-rs/cross/releases/download/v0.2.5/cross-x86_64-unknown-linux-musl.tar.gz \
#    | tar -xz --to-stdout "cross" > /opt/cross/cross \
#  && chmod +x /opt/cross/cross
#
#ENV PATH=/opt/cross:$PATH

CMD ["/bin/sh"]
