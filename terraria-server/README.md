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

