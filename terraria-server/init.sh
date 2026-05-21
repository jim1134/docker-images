#!/bin/bash
set -euo pipefail

./TerrariaServer.bin.x86_64 \
  -world "$WORLD" \
  -worldname "$WORLDNAME" \
  -worldpath "$WORLDPATH" \
  -autocreate "$AUTOCREATE" \
  -seed "$SEED" \
  -port "$PORT" \
  -players "$MAXPLAYERS" \
  -difficulty "$DIFFICULTY" \
  -language "$LANGUAGE" \
  ${STEAM:+-steam} \
  ${SECURE:+-secure}
