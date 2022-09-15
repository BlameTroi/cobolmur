       IDENTIFICATION DIVISION.

       PROGRAM-ID. MNT1000.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       SPECIAL-NAMES.

           CURSOR IS CURSOR-POSITION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT INVMAST  ASSIGN TO "c:\cobol\invmast.dat"
                           ORGANIZATION IS INDEXED
                           ACCESS IS RANDOM
                           RECORD KEY IS IR-ITEM-NO.

       DATA DIVISION.

       FILE SECTION.

       FD  INVMAST.

       01  INVENTORY-RECORD.

           05  IR-ITEM-NO      PIC X(5).
           05  FILLER          PIC X(65).

       WORKING-STORAGE SECTION.

       01  CURSOR-POSITION.

           05  CURSOR-LINE     PIC 99.
           05  CURSOR-COLUMN   PIC 99.

       01  SWITCHES.

           05  END-OF-PROGRAM-SWITCH       PIC X   VALUE "N".
               88  END-OF-PROGRAM                  VALUE "Y".
           05  VALID-ENTRY-SWITCH          PIC X   VALUE "N".
               88  VALID-ENTRY                     VALUE "Y".
           05  ITEM-FOUND-SWITCH           PIC X   VALUE "Y".
               88  ITEM-FOUND                      VALUE "Y".
           05  SAVE-CHANGES-SWITCH         PIC X   VALUE "Y".
               88  SAVE-CHANGES                    VALUE "Y" "y".

       01  DATE-FIELDS.

           05  CURRENT-DATE-AND-TIME.
               10  CURRENT-YEAR        PIC 9999.
               10  CURRENT-MONTH       PIC 99.
               10  CURRENT-DAY         PIC 99.
               10  FILLER              PIC X(13).
           05  FORMATTED-DATE          PIC 9(8).
           05  FORMATTED-DATE-R    REDEFINES FORMATTED-DATE.
               10  FORMATTED-MONTH     PIC 99.
               10  FORMATTED-DAY       PIC 99.
               10  FORMATTED-YEAR      PIC 9999.

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

       01  SCREEN-HEADING-LINE.

           05  SHL-PROGRAM-NAME    PIC X(50).
           05  FILLER              PIC X(14)   VALUE SPACE.
           05  FILLER              PIC X(6)    VALUE "Date: ".
           05  SHL-DATE            PIC 99/99/9999.

       01  SCREEN-DISPLAY-FIELDS.

           05  ERROR-MESSAGE       PIC X(80)   VALUE SPACE.

       01  ATTRIBUTE-CONTROL-FIELDS.

           05  ITEM-NUMBER-CONTROL     PIC X(9).
           05  ITEM-DESC-CONTROL       PIC X(9).
           05  UNIT-COST-CONTROL       PIC X(9).
           05  UNIT-PRICE-CONTROL      PIC X(9).
           05  REORDER-POINT-CONTROL   PIC X(9).
           05  SAVE-CHANGES-CONTROL    PIC X(9).

       01  SCREEN-COLORS.

           05  BLUE        PIC S9(4)   VALUE 1.
           05  GREEN       PIC S9(4)   VALUE 2.
           05  RED         PIC S9(4)   VALUE 4.
           05  WHITE       PIC S9(4)   VALUE 7.

       SCREEN SECTION.

       01  ITEM-NUMBER-SCREEN.

           05  BLANK SCREEN
               BACKGROUND-COLOR WHITE
               FOREGROUND-COLOR BLUE.
           05  LINE 1  COLUMN 1  PIC X(80)   FROM SCREEN-HEADING-LINE.
           05  LINE 3  COLUMN 1  VALUE "Type an item number. Then press
      -        "Enter.".
           05  LINE 5  COLUMN 1  VALUE "Item number. . . . . ".
           05  LINE 5  COLUMN 22 PIC X(5)    USING IM-ITEM-NO
               FOREGROUND-COLOR GREEN
               CONTROL ITEM-NUMBER-CONTROL.
           05  LINE 23 COLUMN 1  PIC X(80)   FROM ERROR-MESSAGE
               FOREGROUND-COLOR RED.
           05  LINE 24 COLUMN 1  VALUE "Enter 99999 to end.".

       01  ITEM-DATA-SCREEN.

           05  LINE 3  COLUMN 1  VALUE "Enter the changes to the custome
      -        "r data. Then press enter.".
           05  LINE 5  COLUMN 22 PIC X(5)    FROM IM-ITEM-NO.
           05  LINE 7  COLUMN 1  VALUE "Description: ".
           05  LINE 7  COLUMN 22 PIC X(40)   USING IM-ITEM-DESC
               FOREGROUND-COLOR GREEN
               CONTROL ITEM-DESC-CONTROL AUTO.
           05  LINE 8  COLUMN 1  VALUE "Unit cost: ".
           05  LINE 8  COLUMN 22 PIC ZZZ.ZZ  USING IM-UNIT-COST
               FOREGROUND-COLOR GREEN
               CONTROL UNIT-COST-CONTROL AUTO.
           05  LINE 9  COLUMN 1  VALUE "Unit price: ".
           05  LINE 9  COLUMN 22 PIC ZZZ.ZZ  USING IM-UNIT-PRICE
               FOREGROUND-COLOR GREEN
               CONTROL UNIT-PRICE-CONTROL AUTO.
           05  LINE 10 COLUMN 1  VALUE "Reorder point: ".
           05  LINE 10 COLUMN 22 PIC ZZ,ZZZ  USING IM-REORDER-POINT
               FOREGROUND-COLOR GREEN
               CONTROL REORDER-POINT-CONTROL AUTO.
           05  LINE 11 COLUMN 1  VALUE "On hand: ".
           05  LINE 11 COLUMN 22 PIC ZZ,ZZZ  USING IM-ON-HAND
               FOREGROUND-COLOR GREEN AUTO.
           05  LINE 12 COLUMN 1  VALUE "On order: ".
           05  LINE 12 COLUMN 22 PIC ZZ,ZZZ  USING IM-ON-ORDER
               FOREGROUND-COLOR GREEN AUTO.
           05  LINE 23 COLUMN 1  PIC X(80)   FROM ERROR-MESSAGE
               FOREGROUND-COLOR RED.
           05  LINE 24 COLUMN 1  VALUE "Save changes?"
               BLANK LINE.
           05  LINE 24 COLUMN 15 PIC X       USING SAVE-CHANGES-SWITCH
               FOREGROUND-COLOR GREEN
               CONTROL SAVE-CHANGES-CONTROL.

       PROCEDURE DIVISION.

       000-MAINTAIN-INVENTORY-RECORDS.

           OPEN I-O INVMAST.
           PERFORM 100-FORMAT-SCREEN-HEADING.
           PERFORM 200-MAINTAIN-INVENTORY-RECORD
               UNTIL END-OF-PROGRAM.
           CLOSE INVMAST.
           STOP RUN.

       100-FORMAT-SCREEN-HEADING.

           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE CURRENT-YEAR   TO FORMATTED-YEAR.
           MOVE CURRENT-MONTH  TO FORMATTED-MONTH.
           MOVE CURRENT-DAY    TO FORMATTED-DAY.
           MOVE FORMATTED-DATE TO SHL-DATE.
           MOVE "Inventory maintenance" TO SHL-PROGRAM-NAME.

       200-MAINTAIN-INVENTORY-RECORD.

           MOVE "N" TO VALID-ENTRY-SWITCH.
           MOVE SPACE TO IM-ITEM-NO
                         ITEM-NUMBER-CONTROL.
           PERFORM 210-GET-ITEM-NUMBER
               UNTIL VALID-ENTRY.
           IF NOT END-OF-PROGRAM
               MOVE SPACE TO ATTRIBUTE-CONTROL-FIELDS
               MOVE "Y" TO SAVE-CHANGES-SWITCH
               MOVE "N" TO VALID-ENTRY-SWITCH
               PERFORM 260-GET-ITEM-DATA
                   UNTIL VALID-ENTRY
               IF SAVE-CHANGES
                   PERFORM 300-REWRITE-INVENTORY-RECORD.

       210-GET-ITEM-NUMBER.

           MOVE "Y" TO VALID-ENTRY-SWITCH.
           PERFORM 220-DISPLAY-ITEM-NUMBER-SCREEN.
           PERFORM 230-ACCEPT-ITEM-NUMBER-SCREEN.
           PERFORM 240-EDIT-ITEM-NUMBER.

       220-DISPLAY-ITEM-NUMBER-SCREEN.

           DISPLAY ITEM-NUMBER-SCREEN.

       230-ACCEPT-ITEM-NUMBER-SCREEN.

           ACCEPT ITEM-NUMBER-SCREEN.

       240-EDIT-ITEM-NUMBER.

           MOVE SPACE TO ERROR-MESSAGE.
           IF IM-ITEM-NO = "99999"
               MOVE "Y" TO END-OF-PROGRAM-SWITCH
           ELSE IF IM-ITEM-NO = SPACE
               MOVE "N" TO VALID-ENTRY-SWITCH
               MOVE "An item number is required." TO ERROR-MESSAGE
               MOVE "HIGHLIGHT" TO ITEM-NUMBER-CONTROL
           ELSE
               MOVE "Y" TO ITEM-FOUND-SWITCH
               MOVE IM-ITEM-NO TO IR-ITEM-NO
               PERFORM 250-READ-INVENTORY-RECORD
               IF NOT ITEM-FOUND
                   MOVE "N" TO VALID-ENTRY-SWITCH
                   MOVE "Inventory record not found." TO ERROR-MESSAGE
                   MOVE "HIGHLIGHT" TO ITEM-NUMBER-CONTROL.

       250-READ-INVENTORY-RECORD.

           READ INVMAST INTO INVENTORY-MASTER-RECORD
               INVALID KEY
                   MOVE "N" TO ITEM-FOUND-SWITCH.

       260-GET-ITEM-DATA.

           MOVE "Y" TO VALID-ENTRY-SWITCH.
           PERFORM 270-DISPLAY-ITEM-DATA-SCREEN.
           PERFORM 280-ACCEPT-ITEM-DATA-SCREEN.
           PERFORM 290-EDIT-ITEM-DATA.

       270-DISPLAY-ITEM-DATA-SCREEN.

           DISPLAY ITEM-DATA-SCREEN.

       280-ACCEPT-ITEM-DATA-SCREEN.

           ACCEPT ITEM-DATA-SCREEN.

       290-EDIT-ITEM-DATA.

           MOVE SPACE TO ERROR-MESSAGE.
           IF NOT SAVE-CHANGES
               IF SAVE-CHANGES-SWITCH NOT = "N" AND NOT = "n"
                   MOVE "You must enter 'Y' or 'N'" TO ERROR-MESSAGE
                   MOVE 24 TO CURSOR-LINE
                   MOVE 15 TO CURSOR-COLUMN
                   MOVE "HIGHLIGHT" TO SAVE-CHANGES-CONTROL
               END-IF
           ELSE
               IF IM-REORDER-POINT NOT > 0
                   MOVE "Reorder point must be greater than zero."
                       TO ERROR-MESSAGE
                   MOVE 10 TO CURSOR-LINE
                   MOVE 22 TO CURSOR-COLUMN
                   MOVE "HIGHLIGHT" TO REORDER-POINT-CONTROL
               END-IF
               IF IM-UNIT-PRICE NOT > 0
                   MOVE "Unit price must be greater than zero."
                       TO ERROR-MESSAGE
                   MOVE 9  TO CURSOR-LINE
                   MOVE 22 TO CURSOR-COLUMN
                   MOVE "HIGHLIGHT" TO UNIT-PRICE-CONTROL
               ELSE
                   IF IM-UNIT-PRICE NOT > IM-UNIT-COST
                       MOVE "Unit price must be greater than unit cost."
                           TO ERROR-MESSAGE
                       MOVE 9  TO CURSOR-LINE
                       MOVE 22 TO CURSOR-COLUMN
                       MOVE "HIGHLIGHT" TO UNIT-PRICE-CONTROL
                   END-IF
               END-IF
               IF IM-UNIT-COST NOT > 0
                   MOVE "Unit cost must be greater than zero."
                       TO ERROR-MESSAGE
                   MOVE 8  TO CURSOR-LINE
                   MOVE 22 TO CURSOR-COLUMN
                   MOVE "HIGHLIGHT" TO UNIT-COST-CONTROL
               END-IF
               IF IM-ITEM-DESC = SPACE
                   MOVE "Item description required." TO ERROR-MESSAGE
                   MOVE 7  TO CURSOR-LINE
                   MOVE 22 TO CURSOR-COLUMN
                   MOVE "HIGHLIGHT" TO ITEM-DESC-CONTROL
               END-IF
           END-IF.
           IF ERROR-MESSAGE NOT = SPACE
               MOVE "N" TO VALID-ENTRY-SWITCH.

       300-REWRITE-INVENTORY-RECORD.

           REWRITE INVENTORY-RECORD FROM INVENTORY-MASTER-RECORD
               INVALID KEY
                   DISPLAY "Invalid REWRITE on item number "
                       IR-ITEM-NO.

