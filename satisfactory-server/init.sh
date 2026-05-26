#!/bin/bash
set -euo pipefail

chmod +x steamcmd.sh

./steamcmd.sh \
  +force_install_dir "config/gamefiles" \
  +login anonymous \
  +app_update 1690800 validate \
  +quit

args=(
  "-Port=$PORT"
  "-ReliablePort=$RELIABLEPORT"
  "-ExternalReliablePort=$RELIABLEPORT"
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
  "${DISABLESEASONALEVENTS:+-DisableSeasonalEvents}"
  "${MULTIHOME:+-multihome=$MULTIHOME}"
)

cd config/gamefiles

chmod +x FactoryServer.sh

./FactoryServer.sh "${args[@]}" "$@"

wait
