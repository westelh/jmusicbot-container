package jmusicbot

import(
    "dagger.io/dagger"
    "universe.dagger.io/docker"
    "westelh.github.io/jmusicbot/common"
)

version: "0.3.8"

dagger.#Plan & {
    client: {
        filesystem: "./eclipse-temurin": read: contents: dagger.#FS
        env: DOCKERHUB_TOKEN: dagger.#Secret
    }
    actions: {

        build: common.#Build & {
            version: "0.3.8"
            source: client.filesystem."./eclipse-temurin".read.contents
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
