---
title: Structure du programme
description: Rappel des divisions COBOL et de leur role.
---

Un programme COBOL est structure en divisions. Cette separation rend le code lisible et stable sur des traitements batch ou fichiers.

## Identification Division

- Definit le nom du programme
- Porte les informations generales

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. NOMDUPROGRAMME.
```

## Environment Division

- INPUT-OUTPUT SECTION
``` cobol
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT F-IN ASSIGN TO "assets/articles.csv"
        ORGANIZATION IS LINE SEQUENTIAL.
    SELECT F-OUT ASSIGN TO "output/sortie.csv"
        ORGANIZATION IS LINE SEQUENTIAL.
```
- Declare notamment les fichiers dans `INPUT-OUTPUT SECTION`



## Data Division

- Declare les donnees du programme
- Contient notamment :
  - `FILE SECTION`
  ``` cobol
    FILE SECTION.
    FD F-IN.
    01 F-IN-REC PIC X(256).
    FD F-OUT.
    01 F-OUT-REC PIC X(256).
  ```
  - `WORKING-STORAGE SECTION`
  - `LOCAL-STORAGE SECTION`
  - `LINKAGE SECTION`

## Procedure Division

- Contient les instructions executables
- Peut etre organisee en paragraphes et sections

## Vue minimale

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DEMO.

ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NOM PIC X(10).

PROCEDURE DIVISION.
    DISPLAY "BONJOUR".
    STOP RUN.
```