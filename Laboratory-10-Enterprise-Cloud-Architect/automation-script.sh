#!/bin/bash
# Automated MySQL backup for the WordPress stack
BACKUP_DIR="$HOME/lab10/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILE="$BACKUP_DIR/wordpress_$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"

docker exec lab10-mysql sh -c 'mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" wordpress' > "$FILE"

if [ $? -eq 0 ]; then
    echo "$(date): Backup successful -> $FILE" >> "$BACKUP_DIR/backup.log"
else
    echo "$(date): Backup FAILED" >> "$BACKUP_DIR/backup.log"
fi

# Delete backups older than 7 days
find "$BACKUP_DIR" -name "wordpress_*.sql" -mtime +7 -delete
