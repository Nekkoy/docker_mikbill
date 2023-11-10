[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Інтерфейс користувача

docker-compose.yaml складається з
  + cabinet_nginx - приймає веб-запити та перенаправляє їх на бекенд
  + cabinet_redis - зберігання сесій admin_php
  + cabinet_php - обробляє запит від admin_nginx

### Конфігурація
  + files/nginx/site.conf - конфігурація хосту nginx
  + files/nginx/ssl/fullchain.pem - SSL сертифікат
  + files/nginx/ssl/privkey.pem - ключ SSL
  + files/php/php.ini - налаштування php для cabinet_php
  + files/php/www<span>.conf - налаштування php-fpm для cabinet_php

### Мережі

Необхідні мережі

```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" cabinet_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```

### Створення контейнера нової версії

> [!ВАЖЛИВО]
> Для цого у вас потрiбен бути власний docker registry або аккаунт у docker hub

Завантажте файли потрібної версії з mikbill і розмістіть їх у build/files<br>
Увійдіть у каталог збірки та виконайте команду:
```
docker build -t USERNAME/cabinet:VERSION -f container.dockerfile .
docker push USERNAME/cabinet:VERSION
```
