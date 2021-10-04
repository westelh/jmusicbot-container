FROM ubuntu:focal as download
ARG VERSION
RUN apt-get update && apt-get install -y wget
RUN wget --no-check-certificate -O JMusicBot.jar  https://github.com/jagrosh/MusicBot/releases/download/${VERSION}/JMusicBot-${VERSION}.jar

FROM eclipse-temurin:17-focal
LABEL version=${VERSION}
COPY --from=download /JMusicBot.jar /
ENV CONFIG=config.txt
ENTRYPOINT ["java"]
CMD ["-Dnogui=true", "-jar", "JMusicBot.jar"]
