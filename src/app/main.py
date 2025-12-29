"""API de démonstration pour pipeline sécurisé."""

from fastapi import FastAPI

app = FastAPI(
    title="Secure Python Pipeline Demo",
    version="1.0.0",
    description="Application de démonstration avec supply chain sécurisée",
)


@app.get("/")
async def root() -> dict[str, str]:
    """Endpoint racine."""
    return {"message": "Hello, Secure World!"}


@app.get("/health")
async def health() -> dict[str, str]:
    """Endpoint de santé pour les probes Kubernetes."""
    return {"status": "healthy"}
