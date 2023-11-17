#!/usr/bin/env bash
set -euo pipefail

mkdir -p ~/.byond/bin
wget -O ~/.byond/bin/librust_g.so "https://github.com/${RUST_G_REPO}/releases/download/${RUST_G_VERSION}/librust_g.so"
chmod +x ~/.byond/bin/librust_g.so
ldd ~/.byond/bin/librust_g.so
