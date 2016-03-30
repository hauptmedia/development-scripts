#!/bin/sh

echo Starting mailcatcher

docker rm mailcatcher

docker run -d \
--name mailcatcher \
-p 25:25 \
-p 8082:80 \
-e MAILCATCHER_USERNAME=mailcatcher \
-e MAILCATCHER_PASSWORD=mailcatcher \
hauptmedia/mailcatcher

ip=$(docker-machine ip default)

echo
echo "SMTP available at ${ip}:25 (routing all smtp traffic into mailcatcher mailbox)"
echo "Web-Mail available at http://${ip}:8082 (mailcatcher/mailcatcher)"

