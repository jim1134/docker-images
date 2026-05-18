FROM alpine-glibc:latest as build

RUN apk add curl libarchive-tools && \
    curl -sqL "https://terraria.org/api/download/pc-dedicated-server/terraria-server-1423.zip" | bsdtar -xvf -

FROM alpine-glibc:latest

WORKDIR /home/terraria

COPY --from=build /1423/Linux .
COPY serverconfig.txt .

RUN adduser -D terraria && \
    apk add bash && \
    chmod +x TerrariaServer.bin.x86_64 && \
    mkdir -p worlds && \
    chown -R terraria:terraria .

ENTRYPOINT ["bash", "-c", "./TerrariaServer.bin.x86_64 -config serverconfig.txt"]
