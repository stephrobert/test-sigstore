# Politique de sécurité

## Versions supportées

| Version | Supportée |
| ------- | --------- |
| 1.x     | ✅        |
| < 1.0   | ❌        |

## Signaler une vulnérabilité

**Ne créez PAS d'issue publique pour les vulnérabilités de sécurité.**

Utilisez plutôt le [signalement privé GitHub](../../security/advisories/new)
ou envoyez un email à : `security@votre-domaine.com`

### Informations à inclure

- Description de la vulnérabilité
- Étapes pour reproduire
- Version affectée
- Impact potentiel

### Délai de réponse

- Accusé de réception : 48h
- Première évaluation : 7 jours
- Correctif (selon sévérité) : 30-90 jours

## Pratiques de sécurité

Ce projet applique :

- Analyse statique (Bandit, Ruff)
- Audit des dépendances (pip-audit)
- Signature des images (Cosign/Sigstore)
- Attestation SLSA L3
- Scan de vulnérabilités (Trivy)
