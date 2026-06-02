FROM eclipse-temurin:25-jdk as build

RUN apt-get update \
    && apt-get install -y curl \ 
    && curl -fsSL -o server.jar https://piston-data.mojang.com/v1/objects/97ccd4c0ed3f81bbb7bfacddd1090b0c56f9bc51/server.jar \
    && echo "eula=true" > eula.txt

RUN $JAVA_HOME/bin/jlink \
    --add-modules java.base,java.desktop,java.logging,java.management,java.naming,java.security.jgss,java.sql,java.xml,jdk.unsupported,jdk.crypto.ec,jdk.zipfs \
    --strip-debug \
    --no-man-pages \
    --no-header-files \
    --compress=zip-6 \
    --output /jre

RUN mkdir -p /rootfs/tmp && chmod 1777 /rootfs/tmp

FROM scratch
COPY --from=build /rootfs/ /
COPY --from=build eula.txt eula.txt
COPY --from=build /jre /jre
COPY --from=build /usr/lib/x86_64-linux-gnu/libc.so.6 /usr/lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libdl.so.2 /usr/lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libpthread.so.0 /usr/lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/librt.so.1 /usr/lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libm.so.6 /usr/lib/x86_64-linux-gnu/
COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/
COPY --from=build server.jar server.jar

EXPOSE 25565
ENTRYPOINT ["/jre/bin/java", "-Xms1024M", "-Xmx2048M", "-jar", "server.jar", "--nogui"]
