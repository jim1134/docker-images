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

From this directory:

```bash
docker compose up -d
```

To stop the server:

```bash
docker compose down
```