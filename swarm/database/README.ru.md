[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Кластер Percona XtraDB с GarBD (Galera Arbitrator)

В каком порядке запускать кластер:
   + init_cluster_docker-compose.yml — создаст сам кластер, используя том из node1
   + arbitator_docker-compose.yml — Поднимаем арбитра для управления кластером
   + Дождитесь завершения создания кластера
   + start_node_2_docker-compose.yml — Запускаем вторую ноду, она начнет синхронизироваться
   + Подождите, пока закончится синхронизация
   + Отключите init_cluster_docker-compose.yml.
   + start_node_1_docker-compose.yml — Запускаем первую ноду, она начнет синхронизироваться
   + Готово, теперь можно запустить Balancer_docker-compose.yml и начать подключение к базе данных
