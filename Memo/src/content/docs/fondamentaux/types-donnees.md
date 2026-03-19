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