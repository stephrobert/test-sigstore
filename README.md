# Secure Python Pipeline

[![CI](https://github.com/VOTRE_USER/secure-python-pipeline/actions/workflows/ci.yml/badge.svg)](https://github.com/VOTRE_USER/secure-python-pipeline/actions/workflows/ci.yml)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/VOTRE_USER/secure-python-pipeline/badge)](https://scorecard.dev/viewer/?uri=github.com/VOTRE_USER/secure-python-pipeline)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/XXXXX/badge)](https://www.bestpractices.dev/projects/XXXXX)

API Python de démonstration avec pipeline CI/CD hautement sécurisé.

## 🔒 Sécurité

Ce projet implémente les bonnes pratiques de supply chain security :

| Protection | Outil | Status |
|------------|-------|--------|
| Attestation SLSA L3 | GitHub Attestations | ✅ |
| Signature d'image | Cosign (Sigstore) | ✅ |
| SBOM | Syft (SPDX + CycloneDX) | ✅ |
| Scan vulnérabilités | Trivy, pip-audit | ✅ |
| Analyse statique | Bandit, Ruff | ✅ |
| Dépendances épinglées | Hash pinning | ✅ |

### Vérifier l'image

```bash
# Vérifier la signature Cosign
cosign verify \
  --certificate-identity-regexp="https://github.com/VOTRE_USER/secure-python-pipeline" \
  --certificate-oidc-issuer="https://token.actions.githubusercontent.com" \
  ghcr.io/VOTRE_USER/secure-python-pipeline:latest

# Vérifier l'attestation SLSA
gh attestation verify oci://ghcr.io/VOTRE_USER/secure-python-pipeline:latest \
  --owner VOTRE_USER
```

## 🚀 Démarrage rapide

### Prérequis

- Python 3.11+
- Docker 24+

### Installation locale

```bash
git clone
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Lancer l'application

```bash
uvicorn app.main:app --reload
```

L'API est disponible sur http://localhost:8000

### Avec Docker

```bash
docker pull ghcr.io/VOTRE_USER/secure-python-pipeline:latest
docker run -p 8000:8000 ghcr.io/VOTRE_USER/secure-python-pipeline:latest
```

## 📚 API

| Endpoint | Méthode | Description |
|----------|---------|-------------|
| `/` | GET | Message de bienvenue |
| `/health` | GET | Health check pour Kubernetes |

## 🧪 Tests

```bash
# Installer les dépendances de dev
pip install -r requirements-dev.txt

# Lancer les tests
pytest

# Linting
ruff check src/ tests/

# Analyse de sécurité
bandit -r src/
```

## 📝 Licence

[MIT](LICENSE)

## 🤝 Contribuer

Voir [CONTRIBUTING.md](CONTRIBUTING.md)

## 🔐 Signaler une vulnérabilité

Voir [SECURITY.md](SECURITY.md)
