VERSION := 0.3.8
PLATFORMS := linux/amd64,linux/arm/v7,linux/arm/v8,linux/ppc64le,linux/s390x,windows/amd64

JMusicBot.jar: 
	curl "https://github.com/jagrosh/MusicBot/releases/download/$(VERSION)/JMusicBot-$(VERSION).jar" -o $@

.PHONY: build
build: JMusicBot.jar
	docker build -t westelh/jmusicbot:distroless-$(VERSION) -t westelh/jmusicbot:distroless-latest .

.PHONY: push
push: build
	docker push westelh/jmusicbot:distroless-$(VERSION) 
	docker push westelh/jmusicbot:distroless-latest

.PHONY: multi
multi: JMusicBot.jar
	docker buildx build --platform $(PLATFORMS) -t westelh/jmusicbot:distroless-$(VERSION) -t westelh/jmusicbot:distroless-latest --push .

.PHONY: clean
clean:
	rm JMusicBot.jar
