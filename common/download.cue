package common
 
import(
    "dagger.io/dagger/core"
)

#DownloadRelease: {
    version: string
    dest: string | "/"
    source: "https://github.com/jagrosh/MusicBot/releases/download/\(version)/JMusicBot-\(version).jar"

    _fetch: core.#HTTPFetch & {
        "source": source
        "dest": dest
    }

    output: _fetch.output
}
