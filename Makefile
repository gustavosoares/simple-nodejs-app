
DIR := ${CURDIR}

#if make is typed with no further arguments, then show a list of available targets
default:
	@awk -F\: '/^[a-z_]+:/ && !/default/ {printf "- %-20s %s\n", $$1, $$2}' Makefile

help:
	@echo ""
	@echo "To be written..."

clean: stop
	docker rm simple-nodejs-app

build_container:
	docker build -t simple-nodejs-app:latest .

run:
	docker run --name simple-nodejs-app -d -p 30000:3000 simple-nodejs-app:latest

start:
	docker start simple-nodejs-app

stop:
	docker stop simple-nodejs-app
