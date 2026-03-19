---
title: TP2 - Calcul TVA simple
description: Lire un montant HT, calculer TVA et TTC, puis afficher le resultat.
---

## Objectif

Lire un montant HT, calculer une TVA a 20 % et afficher le TTC.

## Entrees

- Saisie : `123.45`
- Taux TVA fixe : `0.20`

## Resultat attendu

```text
Prix HT : 123.45
TVA (20%) : 24.69
Prix TTC : 148.14
```

## Variante

Si l'entree n'est pas numerique, afficher `Montant invalide`.

## Exemple de code

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. TP2.

ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-PRIX-HT PIC 9(9)V99.
01 WS-TAUX-TVA PIC 9(2)V99 VALUE 0.20.
01 WS-COUT-TVA PIC 9(9)V99.
01 WS-PRIX-TVA PIC 9(9)V99.
01 WS-IMP PIC X(30).

PROCEDURE DIVISION.
    DISPLAY "PRIX HT : " WITH NO ADVANCING.
    ACCEPT WS-IMP.
    MOVE FUNCTION NUMVAL(WS-IMP) TO WS-PRIX-HT.
    COMPUTE WS-COUT-TVA ROUNDED = WS-PRIX-HT * WS-TAUX-TVA.
    DISPLAY "TVA (20%) : " WS-COUT-TVA.
    COMPUTE WS-PRIX-TVA ROUNDED = WS-PRIX-HT + WS-COUT-TVA.
    DISPLAY "PRIX TTC : " WS-PRIX-TVA.
    STOP RUN.
```