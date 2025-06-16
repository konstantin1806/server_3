#! /bin/bash

#для выполнения скриптов перейти под пользователя root

#копирование конфигурационных фйлов для настройки порта apache

source="/home/konstantin_3"
target="/etc/apache2/"
file="ports.conf"

source_file="${source}/${file}"

cp -v "$source_file" "$target"


#копирование конфигурационных фйлов для настройки virtualhost apache

source="/home/konstantin_3"
target="/etc/apache2/sites-enabled/"
file="000-default.conf"

source_file="${source}/${file}"

cp -v "$source_file" "$target"


#правка тестовой страницы для проверки работы

source="/home/konstantin_3"
target="/var/www/html"
file="index.html"

source_file="${source}/${file}"

cp -v "$source_file" "$target"


#перезапуск apache

systemctl reload apache2
