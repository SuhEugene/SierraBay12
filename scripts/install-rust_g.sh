#!/usr/bin/env bash
set -euo pipefail

# Install dependencies
sudo dpkg --add-architecture i386
sudo apt update || true
sudo apt remove -y libssl1.1:amd64 || true
sudo apt install libgcc-s1:i386
sudo apt install -o APT::Immediate-Configure=false libc6:i386
wget http://ftp.de.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u4_i386.deb
sudo dpkg -i libssl1.1_1.1.1n-0+deb11u4_i386.deb

# Download rust_g
mkdir -p ~/.byond/bin
wget -O ~/.byond/bin/librust_g.so "https://github.com/ss220-space/rust-g-tg/releases/download/2.0.0-ss220/librust_g.so"
chmod +x ~/.byond/bin/librust_g.so
ldd ~/.byond/bin/librust_g.so
