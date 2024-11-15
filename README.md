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

# Bugs commun:
Par defaut les ports en dessous de 1024 necessite des privileges superieur :
```shell
Error response from daemon: driver failed programming external connectivity on endpoint cadvisor (ac77633a8a49e579f23141f4f2f661c6bcfb0b49d048c72d34152ec8b566f371): failed to bind port 0.0.0.0:8080/tcp: Error starting userland proxy: listen tcp4 0.0.0.0:8080: bind: address already in use
make: *** [Makefile:8: up] Error 1
```

La solution (la plus simple mais pas la meilleure):
```shell
echo "net.ipv4.ip_unprivileged_port_start=80" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```
