FROM debian:stable-slim AS build

RUN apt update && \
    apt install -y libgcc-s1 lib32gcc-s1

FROM alpine:latest
COPY --from=build /lib/ld-linux.so.2 /lib/ld-linux.so.2
COPY --from=build /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
COPY --from=build /lib32 /lib32
COPY --from=build /lib64 /lib64
COPY --from=build /usr/lib /usr/lib
COPY --from=build /usr/lib64 /usr/lib64
