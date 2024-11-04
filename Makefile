all : up

up : 
	@make  ~/data/wordpress
	@make  ~/data/mariadb
	@docker compose -f ./srcs/docker-compose.yml up --build -d

down : 
	@docker compose -f ./srcs/docker-compose.yml down

clear : #Todo rm -rf les fichier des volumes
	@docker compose -f ./srcs/docker-compose.yml rm
	@rm -rf ~/data

stop : 
	@docker compose -f ./srcs/docker-compose.yml stop

start : 
	@docker compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps
