FROM alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

LABEL org.opencontainers.image.authors="Daydream developers"
LABEL org.opencontainers.image.url="https://github.com/DayDream-Minecraft/server"
LABEL org.opencontainers.image.vendor="Daydream"
LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
LABEL org.opencontainers.image.description="A Minecraft server in a container"

ARG SERVER_JAR=paper-1.21.4-230.jar
ARG MEMORY="4G"

RUN apk update && apk add openjdk21-jre socat curl

COPY ./server /server
WORKDIR /server

VOLUME /server/cache
VOLUME /server/world
VOLUME /server/world_nether
VOLUME /server/world_the_end

EXPOSE 4204 25565

ENV SERVER_JAR=${SERVER_JAR}
ENV MEMORY=${MEMORY}
ENTRYPOINT [ "./entrypoint.sh" ]

HEALTHCHECK --interval=1m --timeout=30s --start-period=20s --retries=3 CMD [ "/server/healthcheck.sh" ]
