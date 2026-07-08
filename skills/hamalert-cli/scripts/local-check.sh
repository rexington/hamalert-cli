#!/bin/sh
set -eu

if command -v hamalert-cli >/dev/null 2>&1; then
  echo "hamalert-cli: $(command -v hamalert-cli)"
  hamalert-cli --help >/dev/null
  echo "invoke: hamalert-cli"
  exit 0
fi

if [ -f Cargo.toml ]; then
  cargo run -- --help >/dev/null
  echo "hamalert-cli binary not found"
  echo "invoke: cargo run --"
  exit 0
fi

echo "hamalert-cli binary not found and no Cargo.toml is present" >&2
exit 1
