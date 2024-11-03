# 42_Inception
Ce projet a pour but d'approfondir vos connaissances en vous faisant utiliser Docker. Vous allez virtualiser plusieurs images Docker en les créant dans votre nouvelle machine virtuelle personnelle.

Run sont image sans docker-compose:

Build l'image:
    -> docker build -t mon_image .
        - "-t mon_image"
            Assigne un nom / un tag
        - "."
            Specifie le repertoire ou est le Dockerfile

Lancer le conteneur a partir de l'image:
    -> docker run -d -p 443:443 --name mon_docker mon_image
        - "-wd"
            flag pour executer en arriere plan
        - "-p 443:443"
            mappe les ports 443 host vers 443 du container
        - "--name mon_docker"
            nom du container/docker
        - "mon_image"
            nom de l'image qu'on a build juste avant
        
Lister les conteneurs actifs:
    -> docker ps

Acceder aux logs du contenur:
    -> docker logs mon_conteneur

Acceder aux conteneur en bash:
    -> docker exec -it mon_conteneur bash
        (nginx -t direct dans le docker pour voir les problemes de conf)

Arreter le conteneur
    -> docker stop mon_conteneur

Supprimer le conteneur:
    -> docker rm mon_conteneur


