       IDENTIFICATION DIVISION.
       PROGRAM-ID. TP3.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT F-IN ASSIGN TO "assets/articles.csv"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT F-OUT ASSIGN TO "output/sortie.csv"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD F-IN.
       01 F-IN-REC PIC X(256).
       FD F-OUT.
       01 F-OUT-REC PIC X(256).
 
       LOCAL-STORAGE SECTION.
       01 A-ID                      PIC X(4).
       01 A-NAME                    PIC X(40).
       01 A-LENGTH-NAME             PIC 9(4).
       01 A-PRICE-HT                PIC 9(9)V99.
       01 A-PRICE-HT-ALPHA          PIC X(30).
       01 A-PRICE-HT-ED             PIC Z(9).99.
       01 WS-TAUX-TVA               PIC 9(2)V99     VALUE 0.20.
       01 WS-COST-TVA               PIC 9(9)V99.
       01 WS-A-PRI-TTC              PIC 9(9)V99.
       01 WS-COST-TVA-ED            PIC Z(9)9.99.
       01 WS-A-PRI-TTC-ED           PIC Z(9).99.
       01 WS-T-PRI-HT               PIC 9(9)V99.
       01 WS-T-PRI-TTC              PIC 9(9)V99.
       01 WS-T-COST-TVA             PIC 9(9)V99.
       01 WS-T-PRI-HT-ED            PIC Z(9).99.
       01 WS-T-PRI-TTC-ED           PIC Z(9).99.
       01 WS-T-COST-TVA-ED          PIC Z(9)9.99.
       
       01 EOF-FLAG                  PIC X           VALUE "N".
        88 EOF                      VALUE "Y".
        88 NOT-EOF                  VALUE "N".
       01 OUT-WRITING               PIC X(256).
       01 CSV-SEPARATOR             PIC X(1)        VALUE ";".
      
       PROCEDURE DIVISION.
           OPEN INPUT F-IN.
           OPEN OUTPUT F-OUT.
           PERFORM UNTIL EOF
            READ F-IN
             AT END
              SET EOF TO TRUE
             NOT AT END 
              IF FUNCTION LENGTH(FUNCTION TRIM(F-IN-REC)) >  0
               IF F-IN-REC(1:1) = "#"
                DISPLAY "COMMENTAIRE"
               ELSE
                PERFORM CALCULATE-TVA
               END-IF
              END-IF
            END-READ
           END-PERFORM.
           MOVE WS-T-COST-TVA TO WS-T-COST-TVA-ED.
           MOVE WS-T-PRI-HT TO WS-T-PRI-HT-ED.
           MOVE WS-T-PRI-TTC TO WS-T-PRI-TTC-ED.

           MOVE "------------------------------" TO F-OUT-REC.
           MOVE SPACES TO OUT-WRITING
           WRITE F-OUT-REC.
           STRING "TOTAL"                              DELIMITED BY SIZE
               CSV-SEPARATOR                           DELIMITED BY SIZE
               "---"                                   DELIMITED BY SIZE
               CSV-SEPARATOR                           DELIMITED BY SIZE 
               FUNCTION TRIM(WS-T-PRI-HT-ED LEADING)   DELIMITED BY SIZE
               CSV-SEPARATOR                           DELIMITED BY SIZE 
               FUNCTION TRIM(WS-T-COST-TVA-ED LEADING) DELIMITED BY SIZE
               CSV-SEPARATOR                           DELIMITED BY SIZE 
               FUNCTION TRIM(WS-T-PRI-TTC-ED LEADING)  DELIMITED BY SIZE
              INTO OUT-WRITING.
           
           MOVE OUT-WRITING TO F-OUT-REC.
           WRITE F-OUT-REC.
           
           CLOSE F-IN.
           CLOSE F-OUT.
           STOP RUN.
          

          CALCULATE-TVA.
           UNSTRING F-IN-REC DELIMITED BY ";" 
                INTO 
                 A-ID 
                 A-NAME COUNT IN A-LENGTH-NAME
                 A-PRICE-HT-ALPHA.
               
               MOVE FUNCTION NUMVAL(A-PRICE-HT-ALPHA) TO A-PRICE-HT.
               COMPUTE WS-COST-TVA ROUNDED = A-PRICE-HT * WS-TAUX-TVA.
               COMPUTE WS-A-PRI-TTC ROUNDED = A-PRICE-HT + WS-COST-TVA.
 
               MOVE WS-A-PRI-TTC     TO WS-A-PRI-TTC-ED.
               MOVE WS-COST-TVA      TO WS-COST-TVA-ED.
               MOVE A-PRICE-HT       TO A-PRICE-HT-ED .
               MOVE SPACES TO OUT-WRITING.
               STRING A-ID                             DELIMITED BY SIZE
                CSV-SEPARATOR                          DELIMITED BY SIZE
                A-NAME(1:A-LENGTH-NAME)                DELIMITED BY SIZE
                CSV-SEPARATOR                          DELIMITED BY SIZE 
                FUNCTION TRIM(A-PRICE-HT-ED LEADING)   DELIMITED BY SIZE
                CSV-SEPARATOR                          DELIMITED BY SIZE 
                FUNCTION TRIM(WS-COST-TVA-ED LEADING)  DELIMITED BY SIZE
                CSV-SEPARATOR                          DELIMITED BY SIZE 
                FUNCTION TRIM(WS-A-PRI-TTC-ED LEADING) DELIMITED BY SIZE
               INTO OUT-WRITING.
                
               COMPUTE WS-T-PRI-HT = WS-T-PRI-HT + A-PRICE-HT.
               COMPUTE WS-T-PRI-TTC = WS-T-PRI-TTC + WS-A-PRI-TTC.
               COMPUTE WS-T-COST-TVA = WS-T-COST-TVA + WS-COST-TVA.
 
               MOVE OUT-WRITING TO F-OUT-REC.
               WRITE F-OUT-REC.
               EXIT.
               