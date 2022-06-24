
.PHONY: build
.PHONY: push 
.PHONY: multi 
.PHONY: clean

build:
	make -C distroless/ build
	make -C eclipse-temurin/ build

push:
	make -C distroless/ push
	make -C eclipse-temurin/ push

multi:
	make -C distroless/ multi 
	make -C eclipse-temurin/ multi

clean:
	make -C distroless/ clean
	make -C eclipse-temurin/ clean


