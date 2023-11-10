[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Billing and subscriber management interface

docker-compose.yaml consists of
 + admin_nginx - accepting web requests and redirecting them to the backend
 + admin_redis - storing admin_php sessions
 + admin_php - processes a request from admin_nginx

### Configuration
 + files/nginx/site.conf - nginx host config
 + files/nginx/ssl/fullchain.pem - SSL certificat
 + files/nginx/ssl/privkey.pem - SSL key
 + files/php/php.ini - php settings for admin_php
 + files/php/www<span>.conf - php-fpm settings for admin_php

### Networks

Required networks

```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" admin_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```

### Creating a new version container

> [!IMPORTANT]
> Its requeue you have own docker registry or docker hub account

Download the files of the required version from mikbill and place them in build/files<br>
Enter build directory and run the command:
```
docker build -t USERNAME/admin:VERSION -f container.dockerfile .
docker push USERNAME/admin:VERSION
```


