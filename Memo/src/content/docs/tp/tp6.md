---
title: TP6 - Tri puis fusion
description: Trier deux fichiers puis les fusionner par code client.
---

## Objectif

1. Trier les fichiers d'entree par code client.
2. Fusionner les informations dans un fichier unique.

## Entrees

- `clients.csv`
- `comptes.csv`

## Resultat attendu

```text
C001;DUPONT JEAN;0.00
C002;MARTIN ANNE;150.00
C003;NGUYEN LAN;20.50
```

## Contrainte

Appliquer une lecture synchrone de type merge join. Si un client n'a pas de compte, sortir `0.00`.