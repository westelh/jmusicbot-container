FROM debian:latest as download
RUN apt update
RUN apt install -y curl
RUN curl -OL https://github.com/jagrosh/MusicBot/releases/download/0.3.4/JMusicBot-0.3.4.jar

FROM gcr.io/distroless/java:11
COPY --from=download /JMusicBot-0.3.4.jar /
ENV nogui=true
ENTRYPOINT ["java", "-jar", "-Dnogui=true"]
CMD ["JMusicBot-0.3.4.jar"]
