FROM alpine-glibc:latest

WORKDIR /home/steam

RUN adduser -D steam && \
    apk add bash curl && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \
    chown -R steam:steam /home/steam
