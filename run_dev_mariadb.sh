#!/bin/sh

CONTAINER_NAME=dev-mariadb

docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

docker run -d \
-e TIMEZONE=Europe/Berlin \
-e MYSQL_ROOT_PASSWORD=root \
-p 3306:3306 \
-v /Users/julian/Projects/dev-mariadb:/var/lib/mysql \
--name $CONTAINER_NAME \
hauptmedia/mariadb:10.1

if [ $? != 0 ]; then
	exit 1
fi

ip=127.0.0.1
bold=$(tput bold)
normal=$(tput sgr0)

echo

echo
echo "MySQL Service available at (User: root / Password: root) "
echo ${bold} =\> ${ip}:3306${normal}

echo
