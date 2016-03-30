#!/bin/sh

CONTAINER_NAME=dev-pma

docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

docker run -d \
--name $CONTAINER_NAME \
--link dev-mariadb:mysql \
-e TIMEZONE=Europe/Berlin \
-e SERVER_1_HOST=mysql \
-p 8001:80 \
hauptmedia/phpmyadmin

if [ $? != 0 ]; then
	exit 1
fi

ip=$(docker-machine ip default)
bold=$(tput bold)
normal=$(tput sgr0)

echo

echo
echo "PhpMyAdmin service available at " 
echo ${bold} =\> http://${ip}:8001${normal}

echo
