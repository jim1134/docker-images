#!/bin/bash
set -euo pipefail

chmod +x steamcmd.sh && ./steamcmd.sh +quit

./steamcmd.sh \
  +force_install_dir "/home/steam/config/gamefiles" \
  +login anonymous \
  +app_update 1690800 validate \
  +quit

cd /home/steam/config/gamefiles

SERVERGAMEPORT="7777"
SERVERMESSAGINGPORT="8888"
AUTOSAVENUM="5"
MAXOBJECTS="2162688"
MAXTICKRATE="30"
SERVERSTREAMING="0"
TIMEOUT="30"
MAXPLAYERS="4"
DISABLESEASONALEVENTS="-DisableSeasonalEvents"
MULTIHOME="::"

ini_args=(
  "-ini:Engine:[/Script/FactoryGame.FGSaveSession]:mNumRotatingAutosaves=$AUTOSAVENUM"
  "-ini:Engine:[/Script/Engine.GarbageCollectionSettings]:gc.MaxObjectsInEditor=$MAXOBJECTS"
  "-ini:Engine:[/Script/OnlineSubsystemUtils.IpNetDriver]:LanServerMaxTickRate=$MAXTICKRATE"
  "-ini:Engine:[/Script/OnlineSubsystemUtils.IpNetDriver]:NetServerMaxTickRate=$MAXTICKRATE"
  "-ini:Engine:[/Script/OnlineSubsystemUtils.IpNetDriver]:ConnectionTimeout=$TIMEOUT"
  "-ini:Engine:[/Script/OnlineSubsystemUtils.IpNetDriver]:InitialConnectTimeout=$TIMEOUT"
  "-ini:Engine:[ConsoleVariables]:wp.Runtime.EnableServerStreaming=$SERVERSTREAMING"
  "-ini:Game:[/Script/Engine.GameSession]:ConnectionTimeout=$TIMEOUT"
  "-ini:Game:[/Script/Engine.GameSession]:InitialConnectTimeout=$TIMEOUT"
  "-ini:Game:[/Script/Engine.GameSession]:MaxPlayers=$MAXPLAYERS"
  "-ini:GameUserSettings:[/Script/Engine.GameSession]:MaxPlayers=$MAXPLAYERS"
  "$DISABLESEASONALEVENTS"
  "$MULTIHOME"
)

args=$(printf '%q ' "${ini_args[@]}" "$@")

chmod +x FactoryServer.sh && ./FactoryServer.sh \
  -Port="$SERVERGAMEPORT" \
  -ReliablePort="$SERVERMESSAGINGPORT" \
  -ExternalReliablePort="$SERVERMESSAGINGPORT" \
  "$args" 

wait
