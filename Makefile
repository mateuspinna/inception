COMPOSE_PATH = ./src/docker-compose.yml

all: up

up:
	@docker compose -f $(COMPOSE_PATH) up -d --build

down: stop
	@docker compose -f $(COMPOSE_PATH) down

stop:
	@docker compose -f $(COMPOSE_PATH) stop

clean: down

fclean: clean

re: fclean  all

.PHONY: up down stop clean fclean re
