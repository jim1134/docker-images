FROM steamcmd-alpine:latest

COPY --chown=steam:steam init.sh .

USER steam

RUN chmod +x init.sh

ENTRYPOINT ["./init.sh"]
