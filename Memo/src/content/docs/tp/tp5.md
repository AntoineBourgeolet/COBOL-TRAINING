---
title: TP5 - Aggregations par cle
description: Produire des totaux par produit a partir d'un fichier de contrats.
---

## Objectif

Lire `contrats.csv` et produire un report des totaux HT par code produit.

## Resultat attendu

```text
produit;nb_contrats;total_ht;moyenne_ht
AUTO;3;200.00;66.67
HABIT;1;80.00;80.00
SANTE;1;45.00;45.00
```

## Contrainte

Ne pas agreger en memoire sans ordre. Il est possible de trier d'abord l'entree puis d'agreger sequentiellement.