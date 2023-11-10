[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Интерфейс биллинга и управления абонентами

docker-compose.yaml состоит из
   + admin_nginx — прием веб-запросов и перенаправление их на бэкенд
   + admin_redis — хранение сессий admin_php
   + admin_php — обрабатывает запрос от admin_nginx

### Конфигурация
   + files/nginx/site.conf — конфигурация хоста nginx
   + files/nginx/ssl/fullchain.pem — SSL-сертификат
   + files/nginx/ssl/privkey.pem — ключ SSL
   + files/php/php.ini — настройки php для admin_php
   + files/php/www<span>.conf — настройки php-fpm для admin_php

### Сети

Требуемые сети

```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" admin_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```

### Создание контейнера новой версии

> [!IMPORTANT]
> Требуется, чтобы у вас был собственный docker registry или учетная запись в docker hub.

Загрузите файлы нужной версии с mikbill и поместите их в build/files<br>
Войдите в каталог сборки и выполните команду:
```
docker build -t USERNAME/admin:VERSION -f container.dockerfile .
docker push USERNAME/admin:VERSION
```
