FROM steamcmd-alpine:latest

COPY init.sh .

RUN chown -R steam:steam .

RUN chmod +x init.sh
USER steam
ENTRYPOINT ["./init.sh"]
