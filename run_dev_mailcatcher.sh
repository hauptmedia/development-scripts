#!/bin/sh

docker stop mailcatcher 2>/dev/null
docker rm mailcatcher 2>/dev/null

docker run -d \
--name mailcatcher \
-p 25:25 \
-p 8082:80 \
-e MAILCATCHER_USERNAME=mailcatcher \
-e MAILCATCHER_PASSWORD=mailcatcher \
hauptmedia/mailcatcher

if [ $? != 0 ]; then
	exit 1
fi

ip=$(docker-machine ip default)
bold=$(tput bold)
normal=$(tput sgr0)

echo

echo "SMTP service which routes all incoming mails to the mailcatcher mailbox is available at "
echo  ${bold} =\> ${ip}:25${normal}

echo
echo "Web-Mail is available at (User: mailcatcher / Password: mailcatcher) "
echo ${bold} =\> http://${ip}:8082${normal}

echo
