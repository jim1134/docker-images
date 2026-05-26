FROM steamcmd-alpine:latest

ENV AUTOSAVENUM="5" \
    DISABLESEASONALEVENTS="false" \
    MAXOBJECTS="2162688" \
    MAXPLAYERS="4" \
    MAXTICKRATE="30" \
    MULTIHOME="::" \
    PORT="7777" \
    RELIABLEPORT="8888" \
    TIMEOUT="30"

COPY --chown=steam:steam init.sh .

USER steam

RUN chmod +x init.sh

ENTRYPOINT ["./init.sh"]
