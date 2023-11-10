[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Percona XtraDB Cluster with GarBD (Galera Arbitrator)

Required networks:
```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" cluster_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```

In what order should you start the cluster:
  + init_cluster_docker-compose.yml - will create the cluster itself using volume from node1
  + arbitrator_docker-compose.yml - We raise an arbiter to control the cluster
  + Wait for the cluster creation to complete
  + start_node_2_docker-compose.yml - We launch the second node, it will start synchronizing
  + Wait until the synchronization ends
  + Turn off init_cluster_docker-compose.yml
  + start_node_1_docker-compose.yml - We launch the first node, it will start synchronizing
  + Done, now you can run balancer_docker-compose.yml and start connection to database

