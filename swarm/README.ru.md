[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Это решение было использовано на двух физиологических серверах, комбинированных в один cluster via docker swarm<br>
5 nodes включенных в проект
   + mb-admin
   + mb-auth
   + mb-database
   + mb-lk
   + mb-payments

The mikbill product has been divided into modules

# List of Modules

### [Лицензия](license/README.md)
Каталог, в котором необходимо разместить файлы лицензий

### [База данных](database/README.md)
Кластер Percona XtraDB с GarBD (Galera Arbitrator)

### [Администратор](admin/README.md)
Модуль включает в себя интерфейс сотрудника для управления биллингом и абонентами.

### [Кабинет](кабинет/README.md)
Модуль включает в себя абонентский интерфейс

### [API кабинета](cabinet_api/README.md)
Модуль включает в себя API для создания собственного абонентского интерфейса/бота Telegram.

### [Платежи](платежи/README.md)
Модуль приема платежей

### [Ядро](kernel/README.md)
Модуль обработки авторизационных и учетных запросов

### [Exec](exec/README.md)
Модуль для выполнения задач CRON и выполнения команд/скриптов
