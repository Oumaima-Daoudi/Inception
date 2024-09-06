

all: build up

up:
	docker-compose -f srcs/docker-compose.yml up -d


build:
	docker compose -f srcs/docker-compose.yml build

down: 
	docker compose -f srcs/docker-compose.yml down -v
	sudo rm -rf /home/oumaima/data/db/*

re: down up