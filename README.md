# Cotizador App 🚀

Sistema multiplataforma para gestión y cotización de servicios de manufactura personalizada.

---

## 🏗️ Estructura del Proyecto

* **`/frontend`**: Aplicación móvil y web desarrollada en **Flutter** (Mobile-First).
* **`/backend`**: API REST construida con **FastAPI** y base de datos **PostgreSQL**.
* **`/config`**: Archivos de configuración dinámicos (`formulas.yaml`, `settings.json`).
* **`/core`**: Motores de cálculo y cargadores de configuración en Python.
* **`/scripts`**: Automatización de validaciones y despliegue (`deploy.ps1`, `validate_config.ps1`).
* **`/tests`**: Pruebas unitarias y de integración desarrolladas con **Pytest**.
* **`/docs`**: Documentación técnica de arquitectura y reglas del negocio.
* **`/.github/workflows`**: Automatización de integración y despliegue continuo (CI/CD).

---

## 🛠️ Configuración e Instalación Local

### Requisitos Previos
* Python 3.10+
* PowerShell (Windows) o Bash (Linux/macOS)
* Git

### Pasos de Instalación
1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/chiuk790/cotizador.git](https://github.com/chiuk790/cotizador.git)
   cd cotizador