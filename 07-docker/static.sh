#!/bin/bash
docker run -d --name static -p 8081:80 apache-image
docker exec -d static rm /var/www/html/index.php
docker cp index.html static:/var/www/html