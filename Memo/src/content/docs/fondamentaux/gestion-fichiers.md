---
title: Gestion des fichiers
description: Declaration et manipulation des fichiers sequentiels en COBOL.
---

## Environment setup

```cobol
ENVIRONMENT DIVISION.
   INPUT-OUTPUT SECTION.
   FILE-CONTROL.
       SELECT F-ARTICLES ASSIGN TO "articles.csv"
           ORGANIZATION IS LINE SEQUENTIAL.
```

## Declaration dans la FILE SECTION

```cobol
FD F-ARTICLES.
01 F-ARTICLES-REC.
   05 ARTICLE-ID PIC X(10).
   05 ARTICLE-NAME PIC X(10).
   05 ARTICLE-PRICE PIC 9(2)V99.
```

## Instructions principales

```cobol
OPEN INPUT CLIENTS.
READ CLIENTS AT END MOVE "OUI" TO FIN.
WRITE FIC-CLIENT.
CLOSE CLIENTS.
```

## Points a retenir

- Le `SELECT` relie un nom logique COBOL a un fichier physique.
- `LINE SEQUENTIAL` est adapte a des fichiers texte ligne par ligne.
- Les zones du `FD` representent le format d'un enregistrement.