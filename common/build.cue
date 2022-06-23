package common

import(
    "dagger.io/dagger"
    "dagger.io/dagger/core"
    "universe.dagger.io/docker"    
)

#Build: {
    version: string
    source: dagger.#FS

    _download: #DownloadRelease & {
        "version": version
        dest: "/JMusicBot.jar"
    }

    _clone: core.#Copy & {
        input: _download.output
        contents: source
        dest: "/"
    }

    _dockerfile: docker.#Dockerfile & {
        source: _clone.output
    }

    output: _dockerfile.output

}

