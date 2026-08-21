Write-Host "Iniciando despliegue local..." -ForegroundColor Cyan

# 1. Actualizar desde Git
git pull origin main

# 2. Validar configuraciones
if (Test-Path "scripts\validate_config.ps1") {
    .\scripts\validate_config.ps1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] Error en validacion. Abortando despliegue." -ForegroundColor Red
        exit 1
    }
}

# 3. Instalar dependencias si existe requirements.txt
if (Test-Path "requirements.txt") {
    pip install -r requirements.txt
} else {
    Write-Host "[Aviso] No se encontro requirements.txt. Omitiendo instalacion." -ForegroundColor Yellow
}

# 4. Ejecutar pruebas unitarias si existe la carpeta tests
if (Test-Path "tests") {
    python -m pytest tests/ -v
} else {
    Write-Host "[Info] La carpeta tests/ aun no existe. Omitiendo pruebas." -ForegroundColor Yellow
}

Write-Host "[OK] Proceso local completado exitosamente." -ForegroundColor Green