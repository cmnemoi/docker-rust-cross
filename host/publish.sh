#!/usr/bin/env oil
var SCRIPT_DIR = $(cd "$_this_dir" { pwd })

cd $SCRIPT_DIR {
  ./build.sh
  var tag = $(cat ../tag.txt)
  docker push "demurgos/rust-cross-host:${tag}"
}
