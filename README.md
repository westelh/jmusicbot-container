# jmusicbot-container
![pulls](https://img.shields.io/docker/pulls/westelh/jmusicbot)


Container for runnning [jagrosh/Musicbot](https://github.com/jagrosh/MusicBot)

Available on [DokerHub](https://hub.docker.com/repository/docker/westelh/jmusicbot)

## Run🎧
Follow the [official guide](https://jmusicbot.com/setup/) to make your config file.
Application in the container reads config file from /config.txt.

### Example
Replace "your.cfg" with your config file.
`docker run -it -v "$(pwd)"/your.cfg:/config.txt westelh/jmusicbot:latest`

### Options
You can specify options using Java system properties. If you pass options, please specify default options: ``` -Dnogui=true -jar JMusicBot.jar ``` .

```bash
docker run -it -v "$(pwd)"/your.cfg:/alternate.cfg westelh/jmusicbot:latest -Dconfig=alternate.cfg -Dnogui=true -jar JMusicBot.jar
```

Detailed document is [here](https://jmusicbot.com/advanced-config).



## Build

### Simple build

``` bash
docker build -t my/image:latest --build-arg VERSION=x.x.x .
```

Dockerfile gets "VERSION" as a build-time argument to choose which version to download from [jagrosh/Musicbot](https://github.com/jagrosh/MusicBot).



### Multi architecture build

[Multi architecture build using buildx](https://docs.docker.com/desktop/multi-arch/) command is supported on Docker Desktop.

```bash
docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8 --build-arg VERSION=x.x.x -t my/image:latest .
```

 





