#!/usr/bin/env oil
var SCRIPT_DIR = $(cd "$_this_dir" { pwd })

cd $SCRIPT_DIR {
  var tag = $(cat ../tag.txt)
  docker run -it "demurgos/rust-cross-builder:${tag}"
}
