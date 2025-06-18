#!/bin/bash

# указываем в переменной путь к директории для сохранения бэкапа

BACKUP_DIR="/home/konstantin_3/backup"

# Создание директории для бэкапа

mkdir -p "$BACKUP_DIR"


# Получение списка баз данных

DBS=$(sudo mysql -u root -e "SHOW DATABASES;")

# создание полного бэкапа каждой базы

for DB in $DBS; do
    echo "$DB"
    BACKUP_FILE="$BACKUP_DIR/${DB}_$(date +'%Y%m%d_%H%M%S').sql"

    sudo mysqldump -u root --databases "$DB" > "$BACKUP_FILE"

done
    

# Получение позиции бинарного лога

echo "Получение позиции бинарного лога..."
BINLOG_POS=$(sudo mysql -u root -e "SHOW MASTER STATUS;" | awk 'NR==2 {print $1, $2}')
echo "Позиция лога: $BINLOG_POS"

echo "Бэкап завершен успешно!"
