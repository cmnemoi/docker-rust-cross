#!/usr/bin/env oil
var SCRIPT_DIR = $(cd "$_this_dir" { pwd })

const targets = [
  {
    name: "x86_64-unknown-linux-gnu",
    image: "x86_64-unknown-linux-gnu"
  },
  {
    name: "x86_64-pc-windows-gnu",
    image: "x86_64-pc-windows-gnu"
  },
  {
    name: "x86_64-apple-darwin",
    image: "x86_64-apple-darwin-cross"
  }
]

for target in (targets) {
  var name = target->name
  var image = target->image
  echo "generating $name"
  cd $SCRIPT_DIR {
    cd cross {
      if (name === "x86_64-apple-darwin") {
        cargo build-docker-image "${image}" --tag local --engine docker --build-arg "MACOS_SDK_URL=https://github.com/joseluisq/macosx-sdks/releases/download/11.1/MacOSX11.1.sdk.tar.xz"
      } else {
        cargo build-docker-image "${image}" --tag local --engine docker
      }
    }
    mkdir -p "guest-${name}"
    cd "guest-${name}" {
      cat >build.sh <<< """
      #!/usr/bin/env oil
      var SCRIPT_DIR = \$(cd "\$_this_dir" { pwd })

      cd \$SCRIPT_DIR {
        var tag = \$(cat ../tag.txt)
        docker build --tag="demurgos/rust-cross-guest-${name}:\${tag}" .
      }
      """
      cat >publish.sh <<< """
      #!/usr/bin/env oil
      var SCRIPT_DIR = \$(cd "\$_this_dir" { pwd })

      cd \$SCRIPT_DIR {
        ./build.sh
        var tag = \$(cat ../tag.txt)
        docker push "demurgos/rust-cross-guest-${name}:\${tag}"
      }
      """
      cat >Dockerfile <<< """
      FROM ghcr.io/cross-rs/${image}:local
      MAINTAINER Charles Samborski <demurgos@demurgos.net>
      CMD ["/bin/sh"]
      """
      echo "*" >.dockerignore
      chmod +x build.sh
      chmod +x publish.sh
    }
  }
}
