FROM steamcmd-alpine:latest

COPY init.sh .

RUN mkdir -p config/gamefiles && \
    chown -R steam:steam .

RUN chmod +x /home/steam/init.sh
USER steam
ENTRYPOINT ["/home/steam/init.sh"]
