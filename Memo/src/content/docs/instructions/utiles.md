---
title: Instructions utiles
description: Manipulation de chaines, decoupage et inspection de contenu.
---

## STRING

Concatenation.

```cobol
STRING NOM " " PRENOM INTO NOM-COMPLET.
```

Avec des delimiteurs explicites :

```cobol
STRING A-ID CSV-SEPARATOR DELIMITED BY SIZE
       A-NAME(1:A-LENGTH-NAME)
       INTO OUT-WRITING
```

## UNSTRING

Decoupage d'une chaine.

```cobol
UNSTRING NOM-COMPLET DELIMITED BY " "
   INTO NOM PRENOM.
```

Avec recuperation de longueur :

```cobol
UNSTRING F-IN-REC DELIMITED BY ";"
    INTO
        A-ID
        A-NAME COUNT IN A-LENGTH-NAME
        A-PRICE-HT
```

## INSPECT

Analyse, comptage ou remplacement.

```cobol
INSPECT CHAINE TALLYING NB-A FOR ALL "A".
```

## Delimitation utile

```cobol
DELIMITED BY SIZE
```

Cette clause est frequemment utilisee avec `STRING` pour ecrire une zone complete sans attendre un caractere separateur.