[![pulls](https://img.shields.io/docker/pulls/westelh/jmusicbot)](https://hub.docker.com/repository/docker/westelh/jmusicbot)

# jmusicbot-container

Multi architecture container for runnning [jagrosh/Musicbot](https://github.com/jagrosh/MusicBot)

Supports Raspberry Pi and Windows!

[Available on DokerHub!](https://hub.docker.com/repository/docker/westelh/jmusicbot)

## Run
You need a config file for the bot 📑

First, follow the [official guide](https://jmusicbot.com/setup/) to make your config file.

### Example
Replace "$(pwd)/your.cfg" with the path to your config file. **Application in the container reads config file from /config.txt.**

`docker run -it -v "$(pwd)"/your.cfg:/config.txt westelh/jmusicbot:latest`

### Options
You can specify options using Java system properties.

```bash
docker run -it -v "$(pwd)"/your.cfg:/alternate.cfg westelh/jmusicbot:latest -Dconfig=alternate.cfg
```

Detailed document is [here](https://jmusicbot.com/advanced-config).
 





