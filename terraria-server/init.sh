#!/bin/bash
set -euo pipefail

args=(
  ${CONFIG:+-config "$CONFIG"}
  ${WORLD:+-world "$WORLD"}
  ${WORLDNAME:+-worldname "$WORLDNAME"}
  ${WORLDPATH:+-worldpath "$WORLDPATH"}
  ${AUTOCREATE:+-autocreate "$AUTOCREATE"}
  ${SEED:+-seed "$SEED"}
  ${PORT:+-port "$PORT"}
  ${MAXPLAYERS:+-players "$MAXPLAYERS"}
  ${DIFFICULTY:+-difficulty "$DIFFICULTY"}
  ${LANGUAGE:+-language "$LANGUAGE"}
  ${PASSWORD:+-password "$PASSWORD"}
  ${MOTD:+-motd "$MOTD"}
  ${BANLIST:+-banlist "$BANLIST"}
  ${SECURE:+-secure "$SECURE"}
  ${NOUPNP:+-noupnp "$NOUPNP"}
  ${LOBBY:+-lobby "$LOBBY"}
  ${IP:+-ip "$IP"}
  ${FORCEPRIORITY:+-forcepriority "$FORCEPRIORITY"}
  ${DISABLEANNOUNCEMENTBOX:+-disableannouncementbox "$DISABLEANNOUNCEMENTBOX"}
  ${ANNOUNCEMENTBOXRANGE:+-announcementboxrange "$ANNOUNCEMENTBOXRANGE"}
  ${STEAM:+-steam}
)

./TerrariaServer.bin.x86_64 "${args[@]}"
