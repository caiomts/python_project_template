export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

all: down build up

build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down --remove-orphans

test: all
	bash scripts/test.sh

format: all
	bash scripts/format.sh

docs: up
	bash scripts/preview_docs.sh
