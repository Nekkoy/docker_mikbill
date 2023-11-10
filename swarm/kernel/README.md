[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Module for processing authorization and accounting requests

docker-compose.yaml consists of
 + freeradius_nginx - accepting BRAS requests and redirecting them to the radius_server
 + radius_server - process freeradius_nginx request and create new request to mikbill_kernel
 + mikbill_kernel - processes a request from radius_server

### Configuration
 + files/nginx.conf - nginx config for accepting auth/acct requests for radius
 + files/sql.conf - radius sql configuration file

### Networks

Required networks

```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" freeradius_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" kernel_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```
