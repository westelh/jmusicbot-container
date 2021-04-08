FROM centos:centos7
WORKDIR /app/
RUN curl -OL https://github.com/jagrosh/MusicBot/releases/download/0.3.4/JMusicBot-0.3.4.jar
RUN yum install -y java-1.8.0-openjdk
CMD ["java", "-Dnogui=true", "-jar", "JMusicBot-0.3.4.jar"]
