       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. IND4000.
      *
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
      *
       FILE-CONTROL.
      *
           SELECT CUSTMAST ASSIGN TO "C:\COBOL\DATA\CUSTMSTI.DAT"
                           ORGANIZATION IS INDEXED
                           ACCESS IS RANDOM
                           RECORD KEY IS CM-CUSTOMER-NUMBER
                           ALTERNATE RECORD KEY IS CM-BRANCH-NUMBER
                               WITH DUPLICATES.
      *
       DATA DIVISION.
      *
       FILE SECTION.
      *
       FD  CUSTMAST.
      *
       01  CUSTOMER-MASTER-RECORD.
           05  CM-BRANCH-NUMBER        PIC 9(2).
           05  CM-SALESREP-NUMBER      PIC 9(2).
           05  CM-CUSTOMER-NUMBER      PIC 9(5).
           05  CM-CUSTOMER-NAME        PIC X(20).
           05  CM-SALES-THIS-YTD       PIC S9(5)V9(2).
           05  CM-SALES-LAST-YTD       PIC S9(5)V9(2).
      *
       WORKING-STORAGE SECTION.
      *
       01  SWITCHES.
           05  END-OF-SESSION-SWITCH   PIC X   VALUE "N".
               88  END-OF-SESSION              VALUE "Y".
      *
       01  USER-ENTRIES.
           05  CUSTOMER-NUMBER         PIC 9(5).
      *
       01  WORK-FIELDS.
           05  EDITED-YTD-SALES        PIC ZZ,ZZZ.99-.
      *
       PROCEDURE DIVISION.
      *
       000-DISPLAY-CUSTOMER-RECORDS.
      *
           OPEN INPUT CUSTMAST.
           PERFORM 100-DISPLAY-CUSTOMER-RECORD
               UNTIL END-OF-SESSION.
           CLOSE CUSTMAST.
           STOP RUN.
      *
       100-DISPLAY-CUSTOMER-RECORD.
      *
           PERFORM 110-GET-USER-ENTRY.
      *
       110-GET-USER-ENTRY.
      *
           DISPLAY "Enter a customer number.".
           DISPLAY "Or, enter 99999 to end the program.".
           DISPLAY "-----------------------------------------".
           ACCEPT CUSTOMER-NUMBER.
           IF CUSTOMER-NUMBER = 99999
               MOVE "Y" TO END-OF-SESSION-SWITCH.
      *
       120-READ-CUSTOMER-RECORD.
      *
      *
       130-DISPLAY-CUSTOMER-DATA.
      *
           MOVE CM-SALES-THIS-YTD TO EDITED-YTD-SALES.
           DISPLAY "Number  Name                    YTD Sales".
           DISPLAY CM-CUSTOMER-NUMBER "   " CM-CUSTOMER-NAME
                   "    " EDITED-YTD-SALES.
           DISPLAY "-----------------------------------------".
