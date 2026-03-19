---
title: TP7 - Controles metier et journalisation
description: Valider des sinistres, alimenter un report et journaliser les anomalies.
---

## Objectif

Parcourir `sinistres.csv`, appliquer des controles metier et produire :

- un report des lignes valides
- un journal des anomalies

## Regles

- date valide calendrier
- montant superieur ou egal a zero
- statut dans `OUVERT` ou `CLOTURE`

## Resultats attendus

- `report.csv`
- `anomalies.log`