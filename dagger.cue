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
    client: {
        filesystem: ".": read: contents: dagger.#FS
        env: DOCKERHUB_TOKEN: dagger.#Secret
    }
    actions: {
        build: #Build & {
            source: client.filesystem.".".read.contents
        }

        push: docker.#Push & {
            dest: "westelh/jmusicbot:latest"
            auth: {
                username: "westelh"
                secret: client.env.DOCKERHUB_TOKEN
            }
            image: build.output
        }
    }
}
