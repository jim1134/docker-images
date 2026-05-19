# Satisfactory Dedicated Server

An Alpine Linux–based Docker image for running a [Satisfactory](https://www.satisfactorygame.com/) dedicated server using steamcmd.

## Prerequisites

This image builds on two sibling images that must be available locally before you start:

| Image            | Location              |
| ---------------- | --------------------- |
| `alpine-glibc`   | `../alpine-glibc`     |
| `steamcmd-alpine`| `../steamcmd-alpine`  |

Build them in this order (the second depends on the first):

```bash
docker build -t alpine-glibc ../alpine-glibc
docker build -t steamcmd-alpine ../steamcmd-alpine
```

## Quick Start

From this directory, build the server image:

```bash
docker build -t satisfactory-server .
```

Create the volume directory as a non-root user  on the host if you don't want it to be created as root, then start the server:

```bash
mkdir -p ./satisfactory-server
docker run -d -it \
  --name satisfactory-server \
  --hostname satisfactory-server \
  -p 7777:7777/tcp \
  -p 7777:7777/udp \
  -p 8888:8888/tcp \
  -v ./satisfactory-server:/home/steam/config \
  --user 1000:1000 \
  --restart unless-stopped \
  satisfactory-server
```

Or, using Docker Compose:

```bash
docker compose up -d
```

To stop the server:

```bash
docker compose down
```
