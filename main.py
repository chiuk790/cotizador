from fastapi import FastAPI
from core.config import settings

app = FastAPI(
    title="Cotizador App API",
    version="1.0.0",
    debug=settings.debug
)

@app.get("/")
def read_root():
    return {
        "status": "online",
        "app": "Cotizador App API",
        "environment": "production" if not settings.debug else "development"
    }

@app.get("/health")
def health_check():
    return {"status": "ok"}