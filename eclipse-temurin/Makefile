VERSION := 0.3.8

JMusicBot.jar: 
	curl "https://github.com/jagrosh/MusicBot/releases/download/$(VERSION)/JMusicBot-$(VERSION).jar" -o $@

.PHONY: build
build: JMusicBot.jar
	docker build -t westelh/jmusicbot:$(VERSION) -t westelh/jmusicbot:latest .

.PHONY: push
push: build
	docker push westelh/jmusicbot:$(VERSION) 
	docker push westelh/jmusicbot:latest

.PHONY: clean
clean:
	rm JMusicBot.jar
