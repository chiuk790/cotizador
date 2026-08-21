#!/bin/bash
# Script de backup automático de PostgreSQL para entornos Linux

set -e

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="${BACKUP_PATH:-/backups}"
DB_NAME="${POSTGRES_DB:-cotizador_db}"
DB_USER="${POSTGRES_USER:-cotizador_user}"
DB_HOST="${POSTGRES_HOST:-localhost}"

# Crear directorio de respaldos si no existe
mkdir -p "$BACKUP_DIR"

# Ejecutar respaldo
echo "Iniciando respaldo de $DB_NAME..."
pg_dump -h "$DB_HOST" -U "$DB_USER" "$DB_NAME" > "$BACKUP_DIR/backup_$DATE.sql"

# Limpiar respaldos con más de 30 días
find "$BACKUP_DIR" -name "backup_*.sql" -mtime +30 -delete

echo "✅ Backup completado: $BACKUP_DIR/backup_$DATE.sql"