FROM alpine-glibc:latest as build

ARG VERSION=1456

RUN apk add curl libarchive-tools && \
    curl -sqL "https://terraria.org/api/download/pc-dedicated-server/terraria-server-${VERSION}.zip" | bsdtar -xvf - && \
    mv "/${VERSION}/Linux" /terraria

FROM alpine-glibc:latest

ENV CONFIG="" \
    WORLD="/server/worlds/world.wld" \
    WORLDNAME="world" \
    WORLDPATH="/server/worlds" \
    SEED="AwesomeSeed" \
    PORT="7777" \
    MAXPLAYERS="8" \
    AUTOCREATE="1" \
    DIFFICULTY="0" \
    SECURE="1" \
    STEAM="1" \
    LANGUAGE="ENTRYPOINTn-US" \
    PASSWORD="" \
    MOTD="" \
    BANLIST="" \
    NOUPNP="" \
    LOBBY="" \
    IP="" \
    FORCEPRIORITY="" \
    DISABLEANNOUNCEMENTBOX="" \
    ANNOUNCEMENTBOXRANGE=""

WORKDIR /home/terraria

RUN apk add --no-cache bash && \
    adduser -D -h /home/terraria terraria

COPY --from=build "/terraria" .
COPY --chown=terraria:terraria init.sh .

RUN chmod +x TerrariaServer.bin.x86_64 init.sh && \
    mkdir -p worlds

USER terraria

EXPOSE 7777

ENTRYPOINT ["./init.sh"]
