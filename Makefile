
DIR := ${CURDIR}

# Host-side address of the k3d registry (see k8s-playground/k3d.yaml).
# Pods pull the same image as playground-registry:5050/$(IMAGE):$(TAG).
REGISTRY ?= localhost:5050
IMAGE    := simple-nodejs-app
TAG      ?= latest

#if make is typed with no further arguments, then show a list of available targets
default:
	@awk -F\: '/^[a-z_]+:/ && !/default/ {printf "- %-20s %s\n", $$1, $$2}' Makefile

help:
	@echo ""
	@echo "To be written..."

clean: stop
	docker rm $(IMAGE)

build_container:
	docker build -t $(IMAGE):$(TAG) .

push: build_container
	docker tag $(IMAGE):$(TAG) $(REGISTRY)/$(IMAGE):$(TAG)
	docker push $(REGISTRY)/$(IMAGE):$(TAG)

run:
	docker run --name $(IMAGE) -d -p 3000:3000 $(IMAGE):$(TAG)

start:
	docker start $(IMAGE)

stop:
	docker stop $(IMAGE)
