#!/usr/bin/env bash
# Exit on error
set -e
# Absolute path to directory containing this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Echo
set -x
cd "${SCRIPT_DIR}" && docker build --tag="demurgos/rust-cross:2023.0" .
