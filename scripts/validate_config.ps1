Write-Host "Validando archivos de configuracion..." -ForegroundColor Cyan

# 1. Validar formato JSON
try {
    $json = Get-Content -Raw -Path "config/settings.json" | ConvertFrom-Json
    Write-Host "[OK] settings.json es valido" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Formato invalido en config/settings.json" -ForegroundColor Red
    exit 1
}

# 2. Validar formato YAML
try {
    python -c "import yaml; yaml.safe_load(open('config/formulas.yaml', encoding='utf-8'))"
    Write-Host "[OK] formulas.yaml es valido" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Formato invalido en config/formulas.yaml" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Configuraciones validadas correctamente" -ForegroundColor Green