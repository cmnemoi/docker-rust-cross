#!/usr/bin/env bash

set -e

# extract our tools version. credit @0xdeafbeef.
tools="apple"
version="19"

# export our toolchain versions
envvar_suffix="${CROSS_TARGET//-/_}"
upper_suffix=$(echo ${envvar_suffix} | tr '[:lower:]' '[:upper:]')
tools_prefix="${CROSS_TARGET}${version}"

echo AR_${envvar_suffix}="${tools_prefix}"-ar >> /darwin.env
echo CC_${envvar_suffix}="${tools_prefix}"-clang >> /darwin.env
echo CXX_${envvar_suffix}="${tools_prefix}"-clang++ >> /darwin.env
echo CARGO_TARGET_${upper_suffix}_LINKER="${tools_prefix}"-clang >> /darwin.env
