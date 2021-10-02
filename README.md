# jmusicbot-container
Container for runnning [jagrosh/Musicbot](https://github.com/jagrosh/MusicBot)

Available on [DokerHub](https://hub.docker.com/repository/docker/westelh/jmusicbot)



## Usage

```docker run -d --rm westelh/jmusicbot:latest```



You can specify options using Java system properties.  Custom options override image default arguments for jar executable, so you have to provide ``` -Dnogui=true -jar JMusicBot.jar ``` manually.



Example

```bash
docker run -d --rm westelh/jmusicbot:latest -Dnogui=true -Dconfig=alternate.cfg -jar JMusicBot.jar
```

Detailed document is [here](https://jmusicbot.com/advanced-config)
