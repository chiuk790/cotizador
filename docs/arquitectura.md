# Arquitectura del Sistema

## Componentes Principales

1. **Frontend (Flutter):** Interfaz multiplataforma para la captura de datos y visualización de cotizaciones.
2. **Backend (FastAPI + PostgreSQL):** API REST encargada de la autenticación, lógica de cotización y persistencia de datos.
3. **Base de Datos:** Almacenamiento relacional para clientes, cotizaciones generadas e historial de versiones.
4. **Pipeline CI/CD:** Automatización de pruebas, validación de configuraciones y despliegues con GitHub Actions.

## Reglas Matemáticas Versionadas

* **`formulas.yaml`:** Definición de costos base, factores de ajuste y fórmulas por tipo de producto.
* **`settings.json`:** Parámetros dinámicos del negocio, tales como márgenes de ganancia, tasas de impuestos e impuestos/umbrales.

## Flujo de Despliegue

1. **Integración Continua:** Cambios en la rama `main` disparan los tests automatizados (`pytest`) y la validación de configuraciones.
2. **Despliegue a Staging:** Si las validaciones pasan exitosamente, el pipeline de CD despliega automáticamente al entorno de pruebas.
3. **Paso a Producción:** Aprobación manual requerida para autorizar el despliegue final al servidor de producción.