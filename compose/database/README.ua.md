[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Кластер Percona XtraDB з GarBD (арбітр Galera)

Required network:
```
docker network create -d bridge --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```