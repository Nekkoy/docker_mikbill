[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Модуль обробки запитів на авторизацію та облік

docker-compose.yaml складається з
  + radius_server - обробити запит BRAS і створити новий запит до mikbill_kernel
  + mikbill_kernel - обробляє запит від radius_server

### Конфігурація
  + files/sql.conf - файл конфігурації radius для пiдключення до бази

### Мережі

Необхідні мережі

```
docker network create -d bridge --attachable -o com.docker.network.bridge.enable_ip_masquerade=false kernel_network
docker network create -d bridge --attachable -o com.docker.network.bridge.enable_ip_masquerade=false database_network
```
