
COMPOSE_FILE = srcs/docker-compose.yml
DATA_PATH = /home/oumaima/data


all: build up


up:
	docker compose -f $(COMPOSE_FILE) up -d


build:
	docker compose -f $(COMPOSE_FILE) build


down: 
	docker compose -f $(COMPOSE_FILE) down
	# Keep volumes intact


clean: 
	docker compose -f $(COMPOSE_FILE) down -v
	sudo rm -rf $(DATA_PATH)/db/*
	sudo rm -rf $(DATA_PATH)/wordpress/*


re: down up

.PHONY: all up build down clean re
