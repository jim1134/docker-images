FROM alpine-glibc:latest as build

ARG VERSION=1456

RUN apk add curl libarchive-tools && \
    curl -sqL "https://terraria.org/api/download/pc-dedicated-server/terraria-server-${VERSION}.zip" | bsdtar -xvf - && \
    mv "/${VERSION}/Linux" /terraria

FROM alpine-glibc:latest

WORKDIR /home/terraria

RUN apk add --no-cache bash && \
    adduser -D -h /home/terraria terraria

COPY --from=build "/terraria" .
COPY --chown=terraria:terraria serverconfig.txt .

RUN chmod +x TerrariaServer.bin.x86_64 && \
    mkdir -p worlds

USER terraria

EXPOSE 7777

ENTRYPOINT ["bash", "-c", "./TerrariaServer.bin.x86_64 -config serverconfig.txt"]
