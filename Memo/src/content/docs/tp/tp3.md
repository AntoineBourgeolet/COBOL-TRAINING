---
title: TP3 - Lecture CSV et calcul TTC
description: Lire un CSV article, calculer la TVA et reconstituer un fichier de sortie.
---

## Objectif

Lire `articles.csv`, calculer TVA et TTC pour chaque ligne, puis reecrire `sortie.csv`.

## Entrees

- Fichier `articles.csv`
- Taux TVA : `0.20`

## Resultat attendu

Un fichier `sortie.csv` contenant pour chaque article :

- l'identifiant
- le libelle
- le prix HT
- la TVA calculee
- le prix TTC

## Contraintes

- Ignorer les lignes vides
- Ignorer les commentaires commencant par `#`
- Cumuler les totaux HT, TVA et TTC

## Techniques mobilisees

- `READ`
- `UNSTRING`
- `STRING`
- `FUNCTION NUMVAL`
- edition de zones numeriques