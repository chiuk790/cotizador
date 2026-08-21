Write-Host "Validando archivos de configuracion..." -ForegroundColor Cyan

# Validar formato JSON
try {
    $json = Get-Content -Raw -Path "config/settings.json" | ConvertFrom-Json
    Write-Host "✔ settings.json OK" -ForegroundColor Green
} catch {
    Write-Host "❌ Error en formato de settings.json" -ForegroundColor Red
    exit 1
}

# Validar formato YAML
try {
    python -c "import yaml; yaml.safe_load(open('config/formulas.yaml'))"
    Write-Host "✔ formulas.yaml OK" -ForegroundColor Green
} catch {
    Write-Host "❌ Error en formato de formulas.yaml" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Configuraciones validadas correctamente" -ForegroundColor Green