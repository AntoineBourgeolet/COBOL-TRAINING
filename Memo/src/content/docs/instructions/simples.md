---
title: Instructions simples
description: Rappel des instructions COBOL les plus utilisees.
---

## MOVE

Affectation de valeur.

```cobol
MOVE 10 TO COMPTE.
MOVE "ABC" TO CODE.
```

## COMPUTE

Calculs arithmetiques.

```cobol
COMPUTE TOTAL = PRIX * QUANTITE.
```

## ADD / SUBTRACT / MULTIPLY / DIVIDE

Operations simples.

```cobol
ADD 1 TO COMPTE.
SUBTRACT 5 FROM STOCK.
MULTIPLY A BY B.
DIVIDE TOTAL BY N GIVING MOYENNE.
```

## IF / ELSE / END-IF

Comparateurs possibles dans un `IF` :

- `=` : egal a
- `>` : strictement superieur a
- `<` : strictement inferieur a
- `>=` : superieur ou egal a
- `<=` : inferieur ou egal a
- `<>` : different de

Formes COBOL equivalentes souvent rencontrees :

- `IS EQUAL TO`
- `IS GREATER THAN`
- `IS LESS THAN`
- `IS GREATER THAN OR EQUAL TO`
- `IS LESS THAN OR EQUAL TO`
- `IS NOT EQUAL TO`

```cobol
IF AGE > 18
    MOVE "MAJEUR" TO STATUT
ELSE
    MOVE "MINEUR" TO STATUT
END-IF.
```

Exemples :

```cobol
IF WS-MONTANT = 0
    DISPLAY "MONTANT NUL"
END-IF.

IF WS-AGE >= 18
    MOVE "MAJEUR" TO WS-STATUT
END-IF.

IF WS-CODE <> "AUTO"
    DISPLAY "CODE DIFFERENT"
END-IF.

IF WS-NOTE IS LESS THAN 10
    DISPLAY "INSUFFISANT"
END-IF.
```

## EVALUATE

Equivalent d'un switch.

```cobol
EVALUATE CODE
   WHEN 1 DISPLAY "UN"
   WHEN 2 DISPLAY "DEUX"
   WHEN OTHER DISPLAY "AUTRE"
END-EVALUATE.
```

## PERFORM

### Boucle simple

```cobol
PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
    DISPLAY I
END-PERFORM.
```

### Lecture sur fichier

```cobol
01 EOF-FLAG PIC X VALUE "N".
   88 EOF VALUE "Y".
   88 NOT-EOF VALUE "N".

PERFORM UNTIL EOF
    READ F-IN
        AT END
            SET EOF TO TRUE
        NOT AT END
            DISPLAY F-IN-REC
    END-READ
END-PERFORM.
```

### Appel de paragraphe

```cobol
PERFORM TRAITEMENT-DATA.
```

### Definition d'un paragraphe

```cobol
CALCULATE-TVA.
    EXIT.
```