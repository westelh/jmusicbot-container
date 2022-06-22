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
    source: dagger.#FS
    platforms: [...string]

    _download: #DownloadRelease

    _build: docker.#Dockerfile & {
        "source": source
        "platforms": platforms
    }

    output: _build.output
}

dagger.#Plan & {
    client: {
        filesystem: "./eclipse-temurin": read: contents: dagger.#FS
        env: DOCKERHUB_TOKEN: dagger.#Secret
    }
    actions: {
        build: #Build & {
            source: client.filesystem."./eclipse-temurin".read.contents
            platforms: [
                "linux/amd64", 
            ]
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
