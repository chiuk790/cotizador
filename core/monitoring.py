from datetime import datetime
import logging
import os

# Asegurar que exista un directorio para los logs si se escribe en archivo
LOG_DIR = os.getenv("LOG_DIR", "logs")
if not os.path.exists(LOG_DIR):
  os.makedirs(LOG_DIR, exist_ok=True)

log_filename = os.path.join(
    LOG_DIR, f"app_{datetime.now().strftime('%Y_%m_%d')}.log"
)

# Configuración global de logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - [%(levelname)s] - %(message)s",
    handlers=[
        logging.FileHandler(log_filename, encoding="utf-8"),
        logging.StreamHandler(),
    ],
)

logger = logging.getLogger("cotizador_app")


def log_request(request_data: dict, response_data: dict):
  """Registra información detallada de peticiones y respuestas."""
  logger.info(f"Request: {request_data} | Response: {response_data}")


def log_error(error_message: str, error_type: str = "ERROR"):
  """Registra eventos de excepción o fallos en el sistema."""
  logger.error(f"{error_type}: {error_message}")


def log_calculation(
    technique: str, params: dict, result_total: float, execution_time_ms: float
):
  """Registra la ejecución de cotizaciones para auditoría."""
  logger.info(
      f"CALCULATION [{technique.upper()}] - Params: {params} | Total:"
      f" ${result_total:.2f} | Time: {execution_time_ms:.2f}ms"
  )