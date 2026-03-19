---
title: Compilation
description: Commandes de compilation COBOL de base avec GnuCOBOL.
---

## Compilation simple

```bash
cobc -x monprogramme.cob
```

## Compilation avec warnings

```bash
cobc -x -Wall monprogramme.cob
```

## Fin de programme

```cobol
STOP RUN.
```