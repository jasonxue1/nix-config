#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $(basename "$0") <packageName>" >&2
  exit 1
fi

package_name=$1

docker run --rm \
  -v "$(pwd)":/workdir \
  -w /workdir \
  nixos/nix \
  nix-build -A "$package_name" \
  --option substituters https://mirrors.ustc.edu.cn/nix-channels/store
