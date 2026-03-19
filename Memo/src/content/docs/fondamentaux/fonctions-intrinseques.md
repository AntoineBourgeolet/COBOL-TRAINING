---
title: Fonctions intrinseques
description: Fonctions natives utiles pour les calculs, chaines et dates.
---

## Numeriques

- `FUNCTION ABS(x)` : valeur absolue
- `FUNCTION SQRT(x)` : racine carree
- `FUNCTION INTEGER(x)` : partie entiere
- `FUNCTION RANDOM` : nombre pseudo-aleatoire

## Chaines

- `FUNCTION LENGTH(x)` : longueur
- `FUNCTION UPPER-CASE(x)`
- `FUNCTION LOWER-CASE(x)`
- `FUNCTION REVERSE(x)`

## Date / heure

- `FUNCTION CURRENT-DATE`

## Exemple simple

```cobol
IF FUNCTION LENGTH(FUNCTION TRIM(F-IN-REC)) > 0
    DISPLAY FUNCTION UPPER-CASE(WS-NOM)
END-IF.
```