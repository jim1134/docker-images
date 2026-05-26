# terraria-server Dedicated Server

An Alpine Linux–based Docker image for running a [Terraria](https://terraria.org/) dedicated server.

## Prerequisites

This image builds on one sibling image that must be available locally before you start:

| Image            | Location              |
| ---------------- | --------------------- |
| `alpine-glibc`   | `../alpine-glibc`     |

Build it first:

```bash
docker build -t alpine-glibc ../alpine-glibc
```

## Configuration
| Parameter | Default | Function |
|---|---|---|
| `WORLDNAME` | `world` | Set the world name |
| `WORLDPATH` | `/server/worlds` | Set the directory for world files |
| `WORLD` | `/server/worlds/world.wld` | Set the world file path |
| `AUTOCREATE` | `1` | Automatically create a world if it does not exist |
| `SEED` | `AwesomeSeed` | Set the world generation seed |
| `PORT` | `7777` | Set the server port |
| `MAXPLAYERS` | `8` | Set the maximum number of players |
| `DIFFICULTY` | `0` | Set the world difficulty |
| `LANGUAGE` | `en-US` | Set the server language |
| `STEAM` | `1` | Enable Steam networking |
| `SECURE` | `1` | Enable secure mode |
| `CONFIG` | *(unset)* | Set the server configuration file |
| `PASSWORD` | *(unset)* | Set a password required to join the server |
| `MOTD` | *(unset)* | Set the message of the day displayed to players |
| `BANLIST` | *(unset)* | Set the path to the server ban list |
| `NOUPNP` | *(unset)* | Disable automatic UPnP port forwarding |
| `LOBBY` | *(unset)* | Set the Steam lobby visibility |
| `IP` | *(unset)* | Bind the server to a specific IP address |
| `FORCEPRIORITY` | *(unset)* | Force the process priority level |
| `DISABLEANNOUNCEMENTBOX` | *(unset)* | Disable announcement boxes in-game |
| `ANNOUNCEMENTBOXRANGE` | *(unset)* | Set the range for announcement boxes |

## Quick Start

From this directory, build the server image:

```bash
docker build -t terraria-server .
```

Create the volume directory as a non-root user on the host if you do not want the host directory to be made as root, then start the server:

Replace the variables up to preference. All options can be found [here](https://terraria.wiki.gg/wiki/Server#Server_config_file)

```bash
mkdir -p ./terraria-server
docker run -d -it \
  -p 7777:7777 \
  -v ./terraria-server:/home/terraria/worlds \
  --user 1000:1000 \
  -e WORLDNAME=world \
  -e WORLDPATH=/server/worlds \
  -e WORLD=/server/worlds/world.wld \
  -e AUTOCREATE=1 \
  -e SEED=AwesomeSeed \
  -e PORT=7777 \
  -e MAXPLAYERS=8 \
  -e DIFFICULTY=0 \
  -e LANGUAGE=en-US \
  -e STEAM=1 \
  -e SECURE=1 \
terraria-server
```

Or, using Docker Compose:

```bash
docker compose up -d
```

To stop the server:

```bash
docker compose down
```

