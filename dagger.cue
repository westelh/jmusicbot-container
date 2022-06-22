package jmusicbot

import(
    "dagger.io/dagger"
    "dagger.io/dagger/core"
    "universe.dagger.io/docker"
)

version: "0.3.8"

#DownloadRelease: core.#HTTPFetch & {
    source: "https://github.com/jagrosh/MusicBot/releases/download/\(version)/JMusicBot-\(version).jar"
    dest: "./JMusicBot.jar"
}

#Build: docker.#Dockerfile & {
    buildArg: {
        VERSION: version
    }
}

dagger.#Plan & {
    client: filesystem: ".": read: contents: dagger.#FS
    actions: {
        build: #Build & {
            source: client.filesystem.".".read.contents
        }
    }
}
