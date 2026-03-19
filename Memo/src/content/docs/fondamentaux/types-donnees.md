---
title: Types de donnees
description: Formats PIC, niveaux hierarchiques et clauses utiles.
---

## Exemple de declaration

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NOM PIC X(10).
```

## Niveaux hierarchiques

- `01` : structure principale
- `05`, `10`, etc. : sous-elements

## Types courants

| Format PIC | Signification | Exemple |
| --- | --- | --- |
| `PIC X(n)` | Alphanumerique | `PIC X(256)` |
| `PIC 9(n)` | Numerique entier non signe | `PIC 9(9)` |
| `PIC 9(n)V9(m)` | Numerique decimal a virgule implicite | `PIC 9(9)V99` |
| `PIC A(n)` | Alphabetique | `PIC A(20)` |
| `PIC S9(n)` | Numerique signe | `PIC S9(7)` |
| `PIC S9(n)V9(m)` | Decimal signe | `PIC S9(5)V99` |
| `PIC Z(m).nn` | Numerique edite | `PIC Z(9).99` |
| `PIC Z( )9.nn` | Edite avec zero force avant la decimale | `PIC Z(9)9.99` |
| `PIC 9(n) COMP` | Binaire | `PIC 9(4) COMP` |
| `PIC 9(n) COMP-3` | Packed decimal | `PIC 9(7) COMP-3` |
| `PIC X(n) OCCURS m` | Tableau | `PIC X(10) OCCURS 5` |
| `PIC 9(n) VALUE` | Valeur par defaut numerique | `PIC 9(3) VALUE 100` |
| `PIC X(n) VALUE` | Valeur par defaut alpha | `PIC X(5) VALUE "TEST"` |

## Clauses utiles

- `VALUE` : valeur initiale
- `REDEFINES` : partage de memoire
- `OCCURS` : tableau
- `COMP`, `COMP-3` : formats binaires ou packed

## Dates

COBOL n'a pas de type date natif. Une date est toujours stockee dans une zone numerique ou alphanumerique et manipulee manuellement ou via `FUNCTION CURRENT-DATE`.

### Formats courants

| Format PIC | Usage | Exemple de valeur |
| --- | --- | --- |
| `PIC 9(8)` | Date entiere `AAAAMMJJ` | `20250319` |
| `PIC 9(4)` | Annee seule | `2025` |
| `PIC 9(2)` | Mois ou jour seul | `03` |
| `PIC X(10)` | Date formatee lisible | `2025-03-19` |

### Declaration typique

```cobol
01 WS-DATE.
   05 WS-ANNEE  PIC 9(4).
   05 WS-MOIS   PIC 9(2).
   05 WS-JOUR   PIC 9(2).
```

Permet d'acceder aux sous-parties independamment :

```cobol
MOVE WS-ANNEE TO ...
```

### Recuperer la date du jour

`FUNCTION CURRENT-DATE` retourne une chaine de 21 caracteres :

```
AAAAMMJJHHMMSSJJSSSSSS+HHMM
positions 1-8 : date
positions 9-14 : heure
positions 15-16 : centieme de seconde
positions 17-21 : decalage UTC
```

```cobol
01 WS-DATE-COURANTE PIC X(21).
01 WS-AAAA          PIC 9(4).
01 WS-MM            PIC 9(2).
01 WS-JJ            PIC 9(2).

MOVE FUNCTION CURRENT-DATE TO WS-DATE-COURANTE.
MOVE WS-DATE-COURANTE(1:4)  TO WS-AAAA.
MOVE WS-DATE-COURANTE(5:2)  TO WS-MM.
MOVE WS-DATE-COURANTE(7:2)  TO WS-JJ.
```

### Comparaison de dates

En stockant au format `AAAAMMJJ` dans une zone `PIC 9(8)`, la comparaison arithmetique est directement correcte :

```cobol
IF WS-DATE-EFFET > WS-DATE-LIMITE
    DISPLAY "DATE DEPASSEE"
END-IF.
```

### Calcul d'echeance en mois

COBOL ne calcule pas nativement les mois. L'approche courante est de decomposer et recomposer :

```cobol
01 WS-MOIS-TOTAL PIC 9(6).

COMPUTE WS-MOIS-TOTAL = (WS-ANNEE * 12) + WS-MOIS + WS-DUREE-MOIS.
COMPUTE WS-ANNEE-ECH  = WS-MOIS-TOTAL / 12.
COMPUTE WS-MOIS-ECH   = FUNCTION MOD(WS-MOIS-TOTAL, 12).
IF WS-MOIS-ECH = 0
    MOVE 12 TO WS-MOIS-ECH
    SUBTRACT 1 FROM WS-ANNEE-ECH
END-IF.
```