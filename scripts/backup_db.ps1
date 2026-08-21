# Script de backup automático de PostgreSQL para Windows
$ErrorActionPreference = "Stop"

$date = Get-Date -Format "yyyyMMdd_HHmmss"
$backupDir = "E:\APP\cotizador_app\backups"
$dbName = "cotizador_db"
$dbUser = "cotizador_user"
$dbHost = "localhost"

if (-not (Test-Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
}

$backupFile = Join-Path $backupDir "backup_$date.sql"

Write-Host "Iniciando respaldo de PostgreSQL..." -ForegroundColor Cyan

# Ejecutar pg_dump
& pg_dump -h $dbHost -U $dbUser $dbName > $backupFile

# Eliminar respaldos antiguos de más de 30 días
Get-ChildItem -Path $backupDir -Filter "backup_*.sql" | 
    Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | 
    Remove-Item -Force

Write-Host "✅ Respaldo completado en: $backupFile" -ForegroundColor Green