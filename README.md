# jmusicbot-container
Container for runnning [jagrosh/Musicbot](https://github.com/jagrosh/MusicBot)

Available on [DokerHub](https://hub.docker.com/repository/docker/westelh/jmusicbot)



## Usage

Application in the container reads config file from /config.txt. There are some ways to pass configurations created on host machine.



### Use Bind Mount

You can simply bind the config file.

```bash
docker run -d --rm -v "$(pwd)"/config.txt:/config.txt westelh/jmusicbot:latest
```



### Use configs

You need docker swarm enabled to use [configs](https://docs.docker.com/engine/swarm/configs/).

``` bash
docker config create mbot-conf myconfig.txt
docker service create --config source=mbot-conf,target=/config.txt westelh/jmusicbot:latest
```



### Options

You can specify options using Java system properties.  Custom options override image default arguments for jar executable, so you have to provide ``` -Dnogui=true -jar JMusicBot.jar ``` manually.

```bash
docker run -d --rm westelh/jmusicbot:latest -Dnogui=true -Dconfig=alternate.cfg -jar JMusicBot.jar
```

Detailed document is [here](https://jmusicbot.com/advanced-config).



## Build

### Simple build

``` bash
docker build -t my/image:latest --build-arg VERSION=0.3.5 .
```

Dockerfile gets "VERSION" as a build-time argument to choose which version to download from [jagrosh/Musicbot](https://github.com/jagrosh/MusicBot).



### Multi architecture build

Multi architecture build using buildx command is [supported on Docker Desktop](https://docs.docker.com/desktop/multi-arch/).

```bash
docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8 --build-arg VERSION=x.x.x -t my/image:latest .
```

 





