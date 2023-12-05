       IDENTIFICATION DIVISION.

       PROGRAM-ID. INQ1000.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT INVMAST  ASSIGN TO "c:\data\cobol\invmast.dat"
                           ORGANIZATION IS INDEXED
                           ACCESS IS RANDOM
                           RECORD KEY IS IM-ITEM-NO.

       DATA DIVISION.

       FILE SECTION.

       FD  INVMAST.

       01  INVENTORY-MASTER-RECORD.

            05  IM-ITEM-NO              PIC X(5).
            05  IM-DESCRIPTIVE-DATA.
                10  IM-ITEM-DESC        PIC X(40).
                10  IM-UNIT-COST        PIC 999V99.
                10  IM-UNIT-PRICE       PIC 999V99.
            05  IM-INVENTORY-DATA.
                10  IM-REORDER-POINT    PIC S9(5).
                10  IM-ON-HAND          PIC S9(5).
                10  IM-ON-ORDER         PIC S9(5).

       WORKING-STORAGE SECTION.

       78  BLACK           VALUE 0.
       78  WHITE           VALUE 7.
       78  BRIGHT-WHITE    VALUE 15.

       01  SWITCHES.

           05  END-OF-INQUIRIES-SWITCH     PIC X   VALUE "N".
               88  END-OF-INQUIRIES                VALUE "Y".
           05  VALID-ENTRY-SWITCH          PIC X   VALUE "N".
               88  VALID-ENTRY                     VALUE "Y".
           05  ITEM-FOUND-SWITCH           PIC X   VALUE "Y".
               88  ITEM-FOUND                      VALUE "Y".
           05  NEXT-ITEM-SWITCH            PIC X   VALUE "Y".
               88  NEXT-ITEM                       VALUE "Y".

       01  SCREEN-DISPLAY-FIELDS.

           05  ERROR-MESSAGE       PIC X(80)   VALUE SPACE.
           05  UNIT-COST           PIC ZZZ.ZZ.
           05  UNIT-PRICE          PIC ZZZ.ZZ.
           05  REORDER-POINT       PIC ZZ,ZZZ.
           05  ON-HAND             PIC ZZ,ZZZ.
           05  ON-ORDER            PIC ZZ,ZZZ.

       PROCEDURE DIVISION.

       000-PROCESS-INVENTRY-INQUIRIES.

           OPEN INPUT INVMAST.
           PERFORM 100-PROCESS-INVENTORY-INQUIRY
               UNTIL END-OF-INQUIRIES.
           CLOSE INVMAST.
           STOP RUN.

       100-PROCESS-INVENTORY-INQUIRY.

           PERFORM 110-DISPLAY-HEADING-LINES.
           MOVE "N" TO VALID-ENTRY-SWITCH.
           MOVE SPACE TO IM-ITEM-NO.
           PERFORM 120-GET-ITEM-NUMBER
               UNTIL VALID-ENTRY.
           IF NOT END-OF-INQUIRIES
               PERFORM 180-DISPLAY-ITEM-DATA
               MOVE "N" TO VALID-ENTRY-SWITCH
               PERFORM 190-GET-NEXT-ITEM
                   UNTIL VALID-ENTRY.

       110-DISPLAY-HEADING-LINES.

           DISPLAY "Inventory inquiry" AT LINE 1 COLUMN 1
               WITH BLANK SCREEN
               FOREGROUND-COLOR BLACK
               BACKGROUND-COLOR WHITE.
           DISPLAY "Type an item number. Then press Enter."
               AT LINE 3 COLUMN 1.

       120-GET-ITEM-NUMBER.

           MOVE "Y" TO VALID-ENTRY-SWITCH.
           PERFORM 130-ACCEPT-ITEM-NUMBER.
           PERFORM 140-EDIT-ITEM-NUMBER.
           IF NOT VALID-ENTRY
               PERFORM 160-DISPLAY-ERROR-MESSAGE
           ELSE
               PERFORM 170-DISPLAY-BLANK-LINE.

       130-ACCEPT-ITEM-NUMBER.

           DISPLAY "Item number. . . . . " AT LINE 5 COLUMN 1.
           DISPLAY "Enter 99999 to end." AT LINE 24 COLUMN 1.
           ACCEPT IM-ITEM-NO AT LINE 5 COLUMN 22
               WITH PROMPT.

       140-EDIT-ITEM-NUMBER.

           IF IM-ITEM-NO = "99999"
               MOVE "Y" TO END-OF-INQUIRIES-SWITCH
           ELSE IF IM-ITEM-NO = SPACE
               MOVE "N" TO VALID-ENTRY-SWITCH
               MOVE "An item number is required." TO ERROR-MESSAGE
           ELSE
               MOVE "Y" TO ITEM-FOUND-SWITCH
               PERFORM 150-READ-INVENTORY-RECORD
               IF NOT ITEM-FOUND
                   MOVE "N" TO VALID-ENTRY-SWITCH
                   MOVE "Inventory record not found."
                       TO ERROR-MESSAGE.

       150-READ-INVENTORY-RECORD.

           READ INVMAST
               INVALID KEY
                   MOVE "N" TO ITEM-FOUND-SWITCH.

       160-DISPLAY-ERROR-MESSAGE.

           DISPLAY ERROR-MESSAGE AT LINE 23 COLUMN 1
               WITH FOREGROUND-COLOR BRIGHT-WHITE BEEP.

       170-DISPLAY-BLANK-LINE.

           DISPLAY SPACES AT LINE 23 COLUMN 1.

       180-DISPLAY-ITEM-DATA.

           MOVE IM-UNIT-COST TO UNIT-COST.
           MOVE IM-UNIT-PRICE TO UNIT-PRICE.
           MOVE IM-REORDER-POINT TO REORDER-POINT.
           MOVE IM-ON-HAND TO ON-HAND.
           MOVE IM-ON-ORDER TO ON-ORDER.
           DISPLAY "Description:"   LINE 7  COLUMN 1.
           DISPLAY IM-ITEM-DESC     LINE 7  COLUMN 22.
           DISPLAY "Unit cost:"     LINE 8  COLUMN 1.
           DISPLAY UNIT-COST        LINE 8  COLUMN 22.
           DISPLAY "Unit price:"    LINE 9  COLUMN 1.
           DISPLAY UNIT-PRICE       LINE 9  COLUMN 22.
           DISPLAY "Reorder point:" LINE 10 COLUMN 1.
           DISPLAY REORDER-POINT    LINE 10 COLUMN 22.
           DISPLAY "On hand:"       LINE 11 COLUMN 1.
           DISPLAY ON-HAND          LINE 11 COLUMN 22.
           DISPLAY "On order:"      LINE 12 COLUMN 1.
           DISPLAY ON-ORDER         LINE 12 COLUMN 22.

       190-GET-NEXT-ITEM.

           MOVE "Y" TO VALID-ENTRY-SWITCH.
           PERFORM 200-ACCEPT-NEXT-ITEM.
           PERFORM 210-EDIT-NEXT-ITEM.
           IF NOT VALID-ENTRY
               PERFORM 160-DISPLAY-ERROR-MESSAGE
           ELSE
               PERFORM 170-DISPLAY-BLANK-LINE.

       200-ACCEPT-NEXT-ITEM.

           DISPLAY "Do you want to display another item?"
               LINE 24 COLUMN 1.
           ACCEPT NEXT-ITEM-SWITCH AT LINE 24 COLUMN 38
               WITH FOREGROUND-COLOR BRIGHT-WHITE UPPER.

       210-EDIT-NEXT-ITEM.

           IF NOT NEXT-ITEM
               IF NEXT-ITEM-SWITCH = "N"
                   MOVE "Y" TO END-OF-INQUIRIES-SWITCH
               ELSE
                   MOVE "N" TO VALID-ENTRY-SWITCH
                   MOVE "You must enter 'Y' or 'N'" TO ERROR-MESSAGE.

