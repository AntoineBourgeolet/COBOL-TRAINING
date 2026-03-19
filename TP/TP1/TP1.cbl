       IDENTIFICATION DIVISION.
           PROGRAM-ID. TP1.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PRENOM PIC X(10).
       PROCEDURE DIVISION.
           DISPLAY "Entrer votre prenom : "
           ACCEPT WS-PRENOM.
           DISPLAY "Bonjour, " WS-PRENOM " !".
           STOP RUN.
