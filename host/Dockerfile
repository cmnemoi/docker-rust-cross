FROM archlinux:latest
MAINTAINER Charles Samborski <demurgos@demurgos.net>

RUN pacman -Syu --quiet --noconfirm --noprogressbar \
  && pacman -S --quiet --noconfirm --noprogressbar \
    docker \
  && pacman -Scc --quiet --noconfirm

RUN curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs > ./rustup-init.sh \
  && chmod +x ./rustup-init.sh \
  && ./rustup-init.sh -y --profile minimal --default-toolchain stable --component rust-std \
  && rm ./rustup-init.sh

ENV PATH=/root/.cargo/bin:$PATH

RUN rustup target add \
    x86_64-apple-darwin \
    x86_64-pc-windows-gnu \
    x86_64-unknown-linux-gnu

CMD ["/bin/sh"]
