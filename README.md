# 42_Inception
Ce projet a pour but d'approfondir vos connaissances en vous faisant utiliser Docker. Vous allez virtualiser plusieurs images Docker en les créant dans votre nouvelle machine virtuelle personnelle.


Config Nginx:
`https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms`
`https://www.digitalocean.com/community/tutorials/understanding-and-implementing-fastcgi-proxying-in-nginx`

# Installation Docker :

Dl le script d'installation:
```shell
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
dockerd-rootless-setuptool.sh install
```

# Commandes Importantes :
Run son image sans docker compose:

Build l'image:
```shell
docker build -t mon_image .
```
- "-t mon_image"
    Assigne un nom / un tag
- "."
    Specifie le repertoire ou est le Dockerfile

Lancer le conteneur a partir de l'image:
```shell
docker run -d -p 443:443 --name mon_docker mon_image
```
- "-d"
    flag pour executer en arriere plan
- "-p 443:443"
    mappe les ports 443 host vers 443 du container
- "--name mon_docker"
    nom du container/docker
- "mon_image"
    nom de l'image qu'on a build juste avant

Lister les conteneurs actifs:
```shell
docker ps
```

Acceder aux logs du contenur:
```shell
docker logs mon_conteneur
```

Acceder aux conteneur en bash:
```shell
docker exec -it mon_conteneur bash
```
(nginx -t direct dans le docker pour voir les problemes de conf)

Arreter le conteneur
```shell
docker stop mon_conteneur
```
Supprimer le conteneur:
```shell
docker rm mon_conteneur
```

# Bonus
Test redis:
```shell
docker exec -it redis redis-cli
PING
SET test_key "hello"
GET test_key
INFO
```