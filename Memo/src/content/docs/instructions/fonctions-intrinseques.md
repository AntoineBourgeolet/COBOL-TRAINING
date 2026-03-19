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
- `FUNCTION TRIM(x)` : suppression d'espaces en debut et ou fin de zone
- `FUNCTION UPPER-CASE(x)`
- `FUNCTION LOWER-CASE(x)`
- `FUNCTION REVERSE(x)`

## Detail de FUNCTION TRIM

`FUNCTION TRIM` sert a retirer les espaces parasites d'une zone alphanumerique.

En COBOL, beaucoup de zones `PIC X(n)` sont completees avec des espaces. Cette fonction est donc tres utile :

- pour tester si une ligne est vide
- pour construire un CSV propre
- pour afficher une valeur sans padding

## Formes possibles

```cobol
FUNCTION TRIM(MA-ZONE)
FUNCTION TRIM(MA-ZONE LEADING)
FUNCTION TRIM(MA-ZONE TRAILING)
```

## TRIM sans option

`FUNCTION TRIM(MA-ZONE)` retire les espaces en debut et en fin.

```cobol
MOVE "   AUTO   " TO WS-CODE.
DISPLAY "[" FUNCTION TRIM(WS-CODE) "]".
```

Resultat :

```text
[AUTO]
```

## TRIM LEADING

`LEADING` retire uniquement les espaces au debut de la zone.

```cobol
MOVE "   AUTO   " TO WS-CODE.
DISPLAY "[" FUNCTION TRIM(WS-CODE LEADING) "]".
```

Resultat :

```text
[AUTO   ]
```

Usage courant : supprimer les blancs a gauche d'une zone numerique editee.

## TRIM TRAILING

`TRAILING` retire uniquement les espaces a la fin.

```cobol
MOVE "   AUTO   " TO WS-CODE.
DISPLAY "[" FUNCTION TRIM(WS-CODE TRAILING) "]".
```

Resultat :

```text
[   AUTO]
```

Usage courant : nettoyer les zones `PIC X(n)` remplies d'espaces a droite.

## Cas typique avec un CSV

Quand on utilise `STRING`, `TRIM` evite d'ecrire des blancs inutiles dans le fichier de sortie.

```cobol
STRING A-ID                                  DELIMITED BY SIZE
       CSV-SEPARATOR                         DELIMITED BY SIZE
       FUNCTION TRIM(A-NAME)                 DELIMITED BY SIZE
       CSV-SEPARATOR                         DELIMITED BY SIZE
       FUNCTION TRIM(A-PRICE-HT-ED LEADING)  DELIMITED BY SIZE
       INTO OUT-WRITING
```

Dans cet exemple :

- `FUNCTION TRIM(A-NAME)` nettoie le libelle
- `FUNCTION TRIM(A-PRICE-HT-ED LEADING)` retire les espaces de gauche d'une zone editee comme `PIC Z(9).99`

## Cas typique avec un test de ligne vide

```cobol
IF FUNCTION LENGTH(FUNCTION TRIM(F-IN-REC)) > 0
    DISPLAY "LIGNE NON VIDE"
END-IF.
```

Ici, `TRIM` retire les blancs avant de mesurer la longueur. Une ligne ne contenant que des espaces sera donc consideree comme vide.

## Date / heure

- `FUNCTION CURRENT-DATE`

## Exemple simple

```cobol
IF FUNCTION LENGTH(FUNCTION TRIM(F-IN-REC)) > 0
    DISPLAY FUNCTION UPPER-CASE(WS-NOM)
END-IF.
```