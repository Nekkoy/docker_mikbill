[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Кластер Percona XtraDB з GarBD (арбітр Galera)

Необхідні мережі:
```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" cluster_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```

У якому порядку слід запускати кластер:
   + init_cluster_docker-compose.yml - створить сам кластер, використовуючи том з node1
   + arbitrator_docker-compose.yml - Ми створюємо арбітра для управління кластером
   + Дочекайтеся завершення створення кластера
   + start_node_2_docker-compose.yml - Запускаємо другий вузол, він почне синхронізацію
   + Дочекайтеся закінчення синхронізації
   + Вимкніть init_cluster_docker-compose.yml
   + start_node_1_docker-compose.yml - Запускаємо перший вузол, він почне синхронізацію
   + Готово, тепер ви можете запустити balancer_docker-compose.yml і почати підключення до бази даних
