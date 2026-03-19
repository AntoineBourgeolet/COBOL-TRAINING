---
title: TP1 - Hello + saisie utilisateur
description: Lire une valeur au clavier et la reafficher.
---

## Objectif

Afficher un message, lire une entree utilisateur, puis reafficher la valeur.

## Entree

- Interaction console : l'utilisateur saisit `Antoine`

## Resultat attendu

```text
Entrez votre prenom :
Bonjour, Antoine !
```

## Variante

Si le prenom est vide, afficher `Bonjour, inconnu !`.

## Exemple de code

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. TP1.

ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-PRENOM PIC X(10).

PROCEDURE DIVISION.
    DISPLAY "Entrer votre prenom : ".
    ACCEPT WS-PRENOM.
    DISPLAY "Bonjour, " WS-PRENOM " !".
    STOP RUN.
```