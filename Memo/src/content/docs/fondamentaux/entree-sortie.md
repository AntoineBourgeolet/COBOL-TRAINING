---
title: Entree / sortie
description: Instructions simples de dialogue console.
---

## DISPLAY

Affichage console.

```cobol
DISPLAY "Bonjour".
```

## ACCEPT

Lecture clavier.

```cobol
ACCEPT NOM-UTILISATEUR.
```

## Cas d'usage courant

```cobol
DISPLAY "Entrer votre prenom : " WITH NO ADVANCING.
ACCEPT WS-PRENOM.
DISPLAY "Bonjour, " WS-PRENOM " !".
```