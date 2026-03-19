---
title: TP4 - Fichier a format fixe
description: Lire un fichier a positions fixes, valider les champs et ventiler les rejets.
---

## Objectif

Lire un fichier a largeur fixe, controler les champs et produire un fichier de valides et un fichier d'erreurs.

## Entree

Chaque ligne fait 60 caracteres avec les positions suivantes :

- `1-10` : numero contrat
- `11-40` : nom assure
- `41-48` : date effet au format `AAAAMMJJ`
- `49-55` : prime annuelle HT avec 2 decimales implicites
- `56-60` : code produit

## Resultats attendus

- `valides.csv`
- `erreurs.csv`

## Regles de validation

- numero non vide
- date valide
- prime numerique
- code produit alphabetique sur 4 a 5 caracteres