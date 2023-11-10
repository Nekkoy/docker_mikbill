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
 + files/php/www.conf - php-fpm settings for admin_php

### Networks

Required networks

```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" admin_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```
