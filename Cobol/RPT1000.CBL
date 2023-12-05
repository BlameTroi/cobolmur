       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. RPT1000.
      *
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
      *
       FILE-CONTROL.
      *
           SELECT CUSTMAST ASSIGN TO "C:\COBOL\DATA\CUSTMAST.DAT".
           SELECT SALESRPT ASSIGN TO "C:\COBOL\DATA\SALESRPT.PRN".
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
       FD  SALESRPT.
      *
       01  PRINT-AREA      PIC X(132).
      *
       WORKING-STORAGE SECTION.
      *
       01  SWITCHES.
           05  CUSTMAST-EOF-SWITCH     PIC X    VALUE "N".
      *
       01  PRINT-FIELDS.
           05  PAGE-COUNT      PIC S9(3)   VALUE ZERO.
           05  LINES-ON-PAGE   PIC S9(3)   VALUE +55.
           05  LINE-COUNT      PIC S9(3)   VALUE +99.
           05  SPACE-CONTROL   PIC S9.
      *
       01  TOTAL-FIELDS.
           05  GRAND-TOTAL-THIS-YTD   PIC S9(7)V99   VALUE ZERO.
           05  GRAND-TOTAL-LAST-YTD   PIC S9(7)V99   VALUE ZERO.
      *
       01  CURRENT-DATE-AND-TIME.
           05  CD-YEAR         PIC 9999.
           05  CD-MONTH        PIC 99.
           05  CD-DAY          PIC 99.
           05  CD-HOURS        PIC 99.
           05  CD-MINUTES      PIC 99.
           05  FILLER          PIC X(9).
      *
       01  HEADING-LINE-1.
           05  FILLER          PIC X(7)    VALUE "DATE:  ".
           05  HL1-MONTH       PIC 9(2).
           05  FILLER          PIC X(1)    VALUE "/".
           05  HL1-DAY         PIC 9(2).
           05  FILLER          PIC X(1)    VALUE "/".
           05  HL1-YEAR        PIC 9(4).
           05  FILLER          PIC X(11)   VALUE SPACE.
           05  FILLER          PIC X(20)   VALUE "YEAR-TO-DATE SALES R".
           05  FILLER          PIC X(20)   VALUE "EPORT               ".
           05  FILLER          PIC X(8)    VALUE "  PAGE: ".
           05  Hl1-PAGE-NUMBER PIC ZZZ9.
           05  FILLER          PIC X(52)   VALUE SPACE.
      *
       01  HEADING-LINE-2.
           05  FILLER          PIC X(7)    VALUE "TIME:  ".
           05  HL2-HOURS       PIC 9(2).
           05  FILLER          PIC X(1)    VALUE ":".
           05  HL2-MINUTES     PIC 9(2).
           05  FILLER          PIC X(58)   VALUE SPACE.
           05  FILLER          PIC X(10)   VALUE "RPT1000".
           05  FILLER          PIC X(52)   VALUE SPACE.
      *
       01  HEADING-LINE-3.
           05  FILLER      PIC X(20)   VALUE "CUST                ".
           05  FILLER      PIC X(20)   VALUE "            SALES   ".
           05  FILLER      PIC X(20)   VALUE "      SALES         ".
           05  FILLER      PIC X(72)   VALUE SPACE.
      *
       01  HEADING-LINE-4.
           05  FILLER      PIC X(20)   VALUE "NUM    CUSTOMER NAME".
           05  FILLER      PIC X(20)   VALUE "           THIS YTD ".
           05  FILLER      PIC X(20)   VALUE "     LAST YTD       ".
           05  FILLER      PIC X(72)   VALUE SPACE.
      *
       01  CUSTOMER-LINE.
           05  CL-CUSTOMER-NUMBER  PIC 9(5).
           05  FILLER              PIC X(2)     VALUE SPACE.
           05  CL-CUSTOMER-NAME    PIC X(20).
           05  FILLER              PIC X(3)     VALUE SPACE.
           05  CL-SALES-THIS-YTD   PIC ZZ,ZZ9.99-.
           05  FILLER              PIC X(4)     VALUE SPACE.
           05  CL-SALES-LAST-YTD   PIC ZZ,ZZ9.99-.
           05  FILLER              PIC X(78)    VALUE SPACE.
      *
       01  GRAND-TOTAL-LINE.
           05  FILLER              PIC X(27)    VALUE SPACE.
           05  GTL-SALES-THIS-YTD  PIC Z,ZZZ,ZZ9.99-.
           05  FILLER              PIC X(1)     VALUE SPACE.
           05  GTL-SALES-LAST-YTD  PIC Z,ZZZ,ZZ9.99-.
           05  FILLER              PIC X(78)    VALUE SPACE.
      *
       PROCEDURE DIVISION.
      *
       000-PREPARE-SALES-REPORT.
      *
           OPEN INPUT  CUSTMAST
                OUTPUT SALESRPT.
           PERFORM 100-FORMAT-REPORT-HEADING.
           PERFORM 200-PREPARE-SALES-LINES
               UNTIL CUSTMAST-EOF-SWITCH = "Y".
           PERFORM 300-PRINT-GRAND-TOTALS.
           CLOSE CUSTMAST
                 SALESRPT.
           STOP RUN.
      *
       100-FORMAT-REPORT-HEADING.
      *
           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE CD-MONTH   TO HL1-MONTH.
           MOVE CD-DAY     TO HL1-DAY.
           MOVE CD-YEAR    TO HL1-YEAR.
           MOVE CD-HOURS   TO HL2-HOURS.
           MOVE CD-MINUTES TO HL2-MINUTES.
      *
       200-PREPARE-SALES-LINES.
      *
           PERFORM 210-READ-CUSTOMER-RECORD.
           IF CUSTMAST-EOF-SWITCH = "N"
               PERFORM 220-PRINT-CUSTOMER-LINE.
      *
       210-READ-CUSTOMER-RECORD.
      *
           READ CUSTMAST
               AT END
                   MOVE "Y" TO CUSTMAST-EOF-SWITCH.
      *
       220-PRINT-CUSTOMER-LINE.
      *
           IF LINE-COUNT >= LINES-ON-PAGE
               PERFORM 230-PRINT-HEADING-LINES.
           MOVE CM-CUSTOMER-NUMBER  TO CL-CUSTOMER-NUMBER.
           MOVE CM-CUSTOMER-NAME    TO CL-CUSTOMER-NAME.
           MOVE CM-SALES-THIS-YTD   TO CL-SALES-THIS-YTD.
           MOVE CM-SALES-LAST-YTD   TO CL-SALES-LAST-YTD.
           MOVE CUSTOMER-LINE TO PRINT-AREA.
           WRITE PRINT-AREA AFTER ADVANCING SPACE-CONTROL LINES.
           ADD 1 TO LINE-COUNT.
           ADD CM-SALES-THIS-YTD TO GRAND-TOTAL-THIS-YTD.
           ADD CM-SALES-LAST-YTD TO GRAND-TOTAL-LAST-YTD.
           MOVE 1 TO SPACE-CONTROL.
      *
       230-PRINT-HEADING-LINES.
      *
           ADD 1 TO PAGE-COUNT.
           MOVE PAGE-COUNT     TO HL1-PAGE-NUMBER.
           MOVE HEADING-LINE-1 TO PRINT-AREA.
           WRITE PRINT-AREA AFTER ADVANCING PAGE.
           MOVE HEADING-LINE-2 TO PRINT-AREA.
           WRITE PRINT-AREA AFTER ADVANCING 1 LINES.
           MOVE HEADING-LINE-3 TO PRINT-AREA.
           WRITE PRINT-AREA AFTER ADVANCING 2 LINES.
           MOVE HEADING-LINE-4 TO PRINT-AREA.
           WRITE PRINT-AREA AFTER ADVANCING 1 LINES.
           MOVE ZERO TO LINE-COUNT.
           MOVE 2 TO SPACE-CONTROL.
      *
       300-PRINT-GRAND-TOTALS.
      *
           MOVE GRAND-TOTAL-THIS-YTD TO GTL-SALES-THIS-YTD.
           MOVE GRAND-TOTAL-LAST-YTD TO GTL-SALES-LAST-YTD.
           MOVE GRAND-TOTAL-LINE     TO PRINT-AREA.
           WRITE PRINT-AREA AFTER ADVANCING 2 LINES.
