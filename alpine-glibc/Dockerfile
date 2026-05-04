FROM --platform=linux/386 i386/alpine:latest AS build

RUN apk add --no-cache \
    bash curl gcc make gawk bison python3 \
    linux-headers texinfo perl musl-dev

# Isolate kernel headers away from musl's /usr/include
RUN mkdir -p /kernel-headers && \
    cp -r /usr/include/linux       /kernel-headers/ && \
    cp -r /usr/include/asm-generic /kernel-headers/ && \
    cp -r /usr/include/asm         /kernel-headers/

RUN curl -sqL https://ftp.gnu.org/gnu/glibc/glibc-2.38.tar.gz | tar xzf -
RUN mv glibc-2.38 glibc
RUN mkdir -p /build

WORKDIR /build

RUN ../glibc/configure \
    --prefix=/usr \
    --with-headers=/kernel-headers \
    --enable-kernel=3.2 \
    CFLAGS="-O2 -march=i686" \
    CXXFLAGS="-O2 -march=i686" \
    libc_cv_forced_unwind=yes \
    libc_cv_c_cleanup=yes

RUN make -j$(nproc)
RUN make install DESTDIR=/output

FROM --platform=linux/386 i386/alpine:latest
COPY --from=build /output /output
