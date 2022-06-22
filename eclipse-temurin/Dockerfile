<<<<<<< Updated upstream
FROM eclipse-temurin:17-focal
COPY ./JMusicBot.jar /
ENTRYPOINT ["java", "-Dnogui=true", "-jar", "JMusicBot.jar"]
=======
FROM eclipse-temurin:17
ARG JARFILE
COPY $JARFILE /
ENTRYPOINT ["java"]
CMD ["-Dnogui=true", "-jar", "JMusicBot.jar"]
>>>>>>> Stashed changes
