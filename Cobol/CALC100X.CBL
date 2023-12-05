       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. CALC100X.
      *
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
      *
       DATA DIVISION.
      *
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
      *
       77  END-OF-SESSION-SWITCH       PIC X       VALUE "Y".
       77  SALES-AMOUNT                PIC 9(5)V99.
       77  TAX-AMOUNT                  PIC Z,ZZZ.99.
      *
       PROCEDURE DIVISION.
      *
       000-CALCULATE-SALES-TAX.
      *
           PERFORM 100-CALCULATE-ONE-SALES-TAX
               UNTIL END-OF-SESSION-SWITCH = Y.
           DISPLAY "END OF SESSION.".
           STOP RUN.
      *
       100-CALCULATE-ONE-SALES-TAX.
      *
           DISPLAY "-----------------------------------------------".
           DISPLAY "TO END PROGRAM, ENTER 0.".
           DISPLAY "TO CALCULATE SALES TAX, ENTER THE SALES AMOUNT.".
           ACCEPT SALES-AMOUNT.
           IF SALES-AMOUNT = ZERO
               MOVE "Y" TO END-OF-SESSION-SWITCH.
           ELSE
               COMPUTE SALES-TAX ROUNDED =
                   SALES-AMOUNT * .0785
               DISPLAY "SALES TAX = " SALES-TAX.
