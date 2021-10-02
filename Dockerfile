FROM centos:centos7 as download
ARG VERSION
RUN curl -L https://github.com/jagrosh/MusicBot/releases/download/${VERSION}/JMusicBot-${VERSION}.jar -o JMusicBot.jar

FROM gcr.io/distroless/java:11
LABEL version=${VERSION}
COPY --from=download /JMusicBot.jar /
ENV CONFIG=config.txt
ENTRYPOINT ["java", "-jar", "-Dnogui=true", "-Dconfig=${CONFIG}"]
CMD ["JMusicBot.jar"]
