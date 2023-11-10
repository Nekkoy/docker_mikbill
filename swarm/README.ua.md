[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Це рішення використовувалося на двох фізичних серверах, об’єднаних в один кластер через docker swarm<br>
У проекті брали участь 5 вузлів
   + mb-admin
   + mb-auth
   + mb-database
   + mb-lk
   + mb-payments

Продукт mikbill був розділений на модулі

# Список модулів

### [Ліцензія](license/README.md)
Каталог, куди потрібно розмістити файли ліцензії

### [База даних](database/README.md)
Кластер Percona XtraDB з GarBD (арбітр Galera)

### [Адміністратор](admin/README.md)
Модуль містить інтерфейс співробітника для управління білінгом і абонентами

### [Cabinet](cabinet/README.md)
Модуль містить абонентський інтерфейс

### [API Cabinet](cabinet_api/README.md)
Модуль містить API для створення власного абонентського інтерфейсу/телеграм-бота

### [Платежі](payments/README.md)
Модуль для прийому платежів

### [Ядро](kernel/README.md)
Модуль обробки запитів на авторизацію та облік

### [Exec](exec/README.md)
Модуль для виконання завдань CRON і виконання команд/скриптів
