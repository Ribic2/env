COMPOSE_FILES = \
  -f ./docker-compose.yaml \
  -f ./services/keycloak/docker-compose.yml \
  -f ./services/nextcloud/docker-compose.yml \

start:
	docker network inspect mailcow-network >/dev/null 2>&1 || \
	  docker network create \
	    --driver=bridge \
	    --subnet=172.22.1.0/24 \
	    --opt com.docker.network.bridge.name=br-mailcow \
	    mailcow-network

	docker network inspect shared_net >/dev/null 2>&1 || \
	  docker network create shared_net

	docker network inspect discourse_network >/dev/null 2>&1 || \
	  docker network create discourse_network

	docker compose $(COMPOSE_FILES) up -d --build
#	sudo ./services/discourse/launcher rebuild app


stop:
	docker compose $(COMPOSE_FILES) down -v

restart: stop start

validate:
	docker compose $(COMPOSE_FILES) config
