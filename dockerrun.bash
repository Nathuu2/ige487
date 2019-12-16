#!/bin/bash
# Make sure that
#   1 - Have Docker Desktop For Windows installed and that 
#   2 - You are connected to Docker Hub

echo ''
echo '=========== STARTING initialisation ==========='
echo 'MAKE SURE that you have downloaded and installed Docker Desktop For Windows'
echo 'MAKE SURE that you are connected to Docker Hub!'
echo '==============================================='

# This runs a docker, but it also clears the database before running the docker (so it is useful if you want to delete all tables and create them again)
docker rm $(docker ps -f name="ige487-pg-docker-image-marcdupuis-jonathancg" -q) -f
docker rm $(docker ps -a -f name="ige487-pg-docker-image-marcdupuis-jonathancg" -q) -f
docker rm $(docker ps -a -f name="ige487-pg-docker-instance-marcdupuis-jonathancg" -q) -f

docker volume rm ige487-pg-docker-volume-marcdupuis-jonathancg
docker volume create ige487-pg-docker-volume-marcdupuis-jonathancg
docker build -t ige487-pg-docker-instance-marcdupuis-jonathancg .
docker run --rm --name ige487-pg-docker-instance-marcdupuis-jonathancg -p 5430:5432 -v ige487-pg-docker-volume-marcdupuis-jonathancg:/var/lib/postgresql/data ige487-pg-docker-instance-marcdupuis-jonathancg

echo ''
echo '=========== FINISHED initialisation ==========='
echo 'Run the docker using this command: bash dockerrun.bash'
echo '==============================================='
