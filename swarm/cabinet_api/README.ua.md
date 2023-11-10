[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Cabinet API для створення власного абонентського інтерфейсу/телеграм-бота

docker-compose.yaml складається з
  + cabinetapi_nginx - приймає веб-запити та перенаправляє їх на бекенд
  + cabinetapi_php - обробляє запит від cabinetapi_nginx

### Конфігурація
  + files/nginx/site.conf - конфігурація хосту nginx
  + files/nginx/ssl/fullchain.pem - SSL сертифікат
  + files/nginx/ssl/privkey.pem - ключ SSL

### Мережі

Необхідні мережі

```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" cabinetapi_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```

### Створення контейнера нової версії

> [!IMPORTANT]
> Для цого у вас потрiбен бути власний docker registry або аккаунт у docker hub

Завантажте файли потрібної версії з mikbill і розмістіть їх у build/files
Увійдіть у каталог збірки та виконайте команду:

```
docker build -t USERNAME/cabinet_api:VERSION -f container.dockerfile.
docker push USERNAME/cabinet_api:VERSION
```
