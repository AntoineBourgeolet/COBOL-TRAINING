       IDENTIFICATION DIVISION.
       PROGRAM-ID. TP4.
      * AUTHOR : Antoine
      * DATE : 19032026

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.
           SELECT F-IN ASSIGN TO "assets/contrats_fix.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT F-OUT-V ASSIGN TO "output/validates.csv"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT F-OUT-E ASSIGN TO "output/erreurs.csv"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD F-IN.
       01 F-IN-REC.
           05 CONTRAT              PIC X(10).
           05 NOM                  PIC X(30).
           05 DATE-E.
               10 DATE-E-ANNEE     PIC 9(4).
               10 DATE-E-MOIS      PIC 9(2).
               10 DATE-E-JOUR      PIC 9(2).
           05 PRIME                PIC X(7).
           05 CODE-P               PIC X(5).

       FD F-OUT-V.
       01 F-OUT-V-REC              PIC X(256).
       FD F-OUT-E.
       01 F-OUT-E-REC              PIC X(256).

       WORKING-STORAGE SECTION.
       
       01 EOF-FLAG                 PIC X       VALUE "N".
           88 EOF                              VALUE "Y".
           88 NOT-EOF                          VALUE "N".

       01 VALIDE-FLAG              PIC X       VALUE "Y".
           88 VALIDE                           VALUE "Y".
           88 NOT-VALIDE                       VALUE "N".

       
       01 IS-LEAP-YEAR                PIC X       VALUE "Y".
           88 LEAP-YEAR                            VALUE "Y".
           88 NOT-LEAP-YEAR                       VALUE "N".

       01 CSV-SEPARATOR            PIC X(1)    VALUE ";".

       01 CSV-WRITING              PIC X(256).

       01 PRIME-ED                 PIC Z(9)9.99.

       01 MAX-JOUR                 PIC 9(2).

       PROCEDURE DIVISION.
           OPEN INPUT F-IN.
           OPEN OUTPUT F-OUT-V.
           OPEN OUTPUT F-OUT-E.
           
           PERFORM UNTIL EOF 
               READ F-IN AT END SET EOF TO TRUE
                   NOT AT END
                       PERFORM INIT-CONTROL
                       PERFORM CONTROL-CONTRAT-VIDE
                       PERFORM CONTROL-DATE
                       PERFORM CONTROL-PRIME-NUM
                       PERFORM CONTROL-CODE
                       IF VALIDE-FLAG IS EQUAL TO "Y"
                           PERFORM WRITE-CSV-VALIDE
                       ELSE
                           PERFORM WRITE-CSV-ERROR
                       END-IF
               END-READ
           END-PERFORM.
           
           CLOSE F-IN.
           CLOSE F-OUT-E.
           CLOSE F-OUT-V.
           STOP RUN.

           INIT-CONTROL.
               SET VALIDE TO TRUE.
               MOVE 31 TO MAX-JOUR.
           EXIT.

           CONTROL-CONTRAT-VIDE.
           IF FUNCTION LENGTH(FUNCTION TRIM(CONTRAT)) = 0
               SET NOT-VALIDE TO TRUE
           END-IF.
           EXIT.
           CONTROL-DATE.
           IF DATE-E-ANNEE < 0000 OR DATE-E-ANNEE > 3000
               SET NOT-VALIDE TO TRUE
               EXIT PARAGRAPH
           END-IF.
           
           IF DATE-E-MOIS < 01 OR DATE-E-MOIS > 12
               SET NOT-VALIDE TO TRUE
               EXIT PARAGRAPH
           END-IF.

           
           IF FUNCTION MOD(DATE-E-ANNEE 400) = 0
               SET LEAP-YEAR TO TRUE
           ELSE
               IF FUNCTION MOD(DATE-E-ANNEE 100) = 0
                   SET NOT-LEAP-YEAR TO TRUE
               ELSE
                   IF FUNCTION MOD(DATE-E-ANNEE 4) = 0
                       SET LEAP-YEAR TO TRUE
                   ELSE
                       SET NOT-LEAP-YEAR TO TRUE
                   END-IF
               END-IF
           END-IF.

           EVALUATE DATE-E-MOIS
              WHEN 1
              WHEN 3
              WHEN 5
              WHEN 7
              WHEN 8
              WHEN 10
              WHEN 12
                   MOVE 31 TO MAX-JOUR
              WHEN 4
              WHEN 6
              WHEN 9
              WHEN 11
                   MOVE 30 TO MAX-JOUR
              WHEN 2
               IF LEAP-YEAR
                   MOVE 29 TO MAX-JOUR
               ELSE
                   MOVE 28 TO MAX-JOUR
               END-IF
           END-EVALUATE
           IF DATE-E-JOUR < 01 OR DATE-E-JOUR > MAX-JOUR
               SET NOT-VALIDE TO TRUE
           END-IF.
           EXIT.

           CONTROL-PRIME-NUM.
           IF PRIME IS NOT NUMERIC
               SET NOT-VALIDE TO TRUE
           END-IF.
           EXIT.
           
           CONTROL-CODE.
           PERFORM CONTROL-CODE-SIZE.
           PERFORM CONTROL-CODE-ALPHA.
           EXIT.

           CONTROL-CODE-SIZE.
           IF FUNCTION LENGTH(FUNCTION TRIM(CODE-P)) < 4 
                SET NOT-VALIDE TO TRUE
           END-IF.
           EXIT.

           CONTROL-CODE-ALPHA.
           IF CODE-P IS NOT ALPHABETIC
               SET NOT-VALIDE TO TRUE
           END-IF.
           EXIT.

           WRITE-CSV-VALIDE.
               PERFORM CSV-STRING-WRITING
               MOVE CSV-WRITING TO F-OUT-V-REC.
               WRITE F-OUT-V-REC.
           EXIT.

           WRITE-CSV-ERROR.
               MOVE F-IN-REC TO F-OUT-E-REC.
               WRITE F-OUT-E-REC.
           EXIT.

           CSV-STRING-WRITING.
               MOVE FUNCTION NUMVAL-C(PRIME) TO PRIME-ED.
               MOVE SPACE TO CSV-WRITING.
               STRING CONTRAT                          DELIMITED BY SIZE
                   CSV-SEPARATOR                       DELIMITED BY SIZE
                   FUNCTION TRIM(NOM)                  DELIMITED BY SIZE
                   CSV-SEPARATOR                       DELIMITED BY SIZE
                   DATE-E                              DELIMITED BY SIZE
                   CSV-SEPARATOR                       DELIMITED BY SIZE
                   FUNCTION TRIM(PRIME-ED LEADING)     DELIMITED BY SIZE
                   CSV-SEPARATOR                       DELIMITED BY SIZE
                   CODE-P                              DELIMITED BY SIZE
                   INTO CSV-WRITING.
           EXIT.
           