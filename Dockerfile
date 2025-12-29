# syntax=docker/dockerfile:1

# =============================================================================
# Stage 1 : Builder - Installer les dépendances dans un venv
# =============================================================================
FROM python:3.14-slim@sha256:2751cbe93751f0147bc1584be957c6dd4c5f977c3d4e0396b56456a9fd4ed137 AS builder

# Éviter les fichiers .pyc et activer le mode unbuffered
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Copier uniquement les fichiers de dépendances d'abord (cache Docker)
COPY requirements.txt .

# Créer un virtualenv et installer les dépendances
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# --require-hashes force la vérification des hash
RUN pip install --no-cache-dir --require-hashes -r requirements.txt

# =============================================================================
# Stage 2 : Production - Image minimale
# =============================================================================
FROM python:3.14-slim@sha256:2751cbe93751f0147bc1584be957c6dd4c5f977c3d4e0396b56456a9fd4ed137 AS production

# Labels OCI pour la traçabilité (utilisés par Syft pour le SBOM)
LABEL org.opencontainers.image.source="https://github.com/VOTRE_USER/secure-python-pipeline"
LABEL org.opencontainers.image.description="API Python avec supply chain sécurisée"
LABEL org.opencontainers.image.licenses="MIT"

# Créer un utilisateur non-root
RUN groupadd --gid 1000 appgroup && \
    useradd --uid 1000 --gid 1000 --shell /bin/false appuser

WORKDIR /app

# Copier le virtualenv depuis le builder
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copier le code source
COPY --chown=appuser:appgroup src/ ./src/

# Passer en utilisateur non-root
USER appuser

# Port exposé (documentation)
EXPOSE 8000

# Healthcheck intégré
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')" || exit 1

# Commande de démarrage
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
