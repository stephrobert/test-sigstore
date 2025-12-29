# Guide de contribution

Merci de votre intérêt pour ce projet !

## Prérequis

- Python 3.11+
- Docker 24+
- Git

## Installation locale

```bash
git clone https://github.com/VOTRE_USER/secure-python-pipeline.git
cd secure-python-pipeline
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt -r requirements-dev.txt
```

## Lancer les tests

```bash
pytest
ruff check src/ tests/
bandit -r src/
```

## Processus de contribution

1. Forkez le projet
2. Créez une branche (`git checkout -b feature/ma-feature`)
3. Commitez vos changements (`git commit -m 'feat: ajoute ma feature'`)
4. Poussez la branche (`git push origin feature/ma-feature`)
5. Ouvrez une Pull Request

## Conventions

- **Commits** : suivez [Conventional Commits](https://conventionalcommits.org)
- **Code** : formaté avec Ruff
- **Tests** : couverture minimale 80%

## Code de conduite

Ce projet suit le [Contributor Covenant](https://www.contributor-covenant.org/).
Soyez respectueux et inclusif.
