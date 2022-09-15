000100 IDENTIFICATION DIVISION.                                                 
000200*                                                                         
000300 PROGRAM-ID.  IND2000.
000400*                                                                         
000500 ENVIRONMENT DIVISION.                                                    
000600*                                                                         
000700 INPUT-OUTPUT SECTION.                                                    
000800*                                                                         
000900 FILE-CONTROL.                                                            
001000*
           SELECT MNTTRAN  ASSIGN TO "c:\cobol\data\mnttran.dat".
           SELECT INVMAST  ASSIGN TO "c:\cobol\data\invmasti.dat"
                           ORGANIZATION IS INDEXED
                           ACCESS IS RANDOM
                           RECORD KEY IS IR-ITEM-NO.
001400     SELECT ERRTRAN  ASSIGN TO "c:\cobol\data\errtran.dat"
                           FILE STATUS IS ERRTRAN-FILE-STATUS.
001600*                                                                         
001700 DATA DIVISION.                                                           
001800*                                                                         
001900 FILE SECTION.                                                            
002000*                                                                         
002100 FD  MNTTRAN.
002400*                                                                         
002500 01  TRANSACTION-RECORD      PIC X(61).
002600*                                                                         
002700 FD  INVMAST.
003000*                                                                         
003100 01  INVENTORY-RECORD-AREA.
           05  IR-ITEM-NO          PIC X(5).
           05  FILLER              PIC X(65).
003200*                                                                         
003900 FD  ERRTRAN.
004200*                                                                         
004300 01  ERROR-TRANSACTION       PIC X(61).
004400*                                                                         
004500 WORKING-STORAGE SECTION.                                                 
004600*                                                                         
004700 01  SWITCHES.                                                            
004900     05  TRANSACTION-EOF-SWITCH  PIC X   VALUE "N".
005000         88  TRANSACTION-EOF             VALUE "Y".
           05  MASTER-FOUND-SWITCH     PIC X   VALUE "Y".
               88  MASTER-FOUND                VALUE "Y".
005300*
       01  FILE-STATUS-FIELDS.
           05  ERRTRAN-FILE-STATUS     PIC XX.
               88  ERRTRAN-SUCCESSFUL          VALUE "00".
      *
006100 01  MAINTENANCE-TRANSACTION.
           05  MT-TRANSACTION-CODE     PIC X.
               88  DELETE-RECORD               VALUE "1".
               88  ADD-RECORD                  VALUE "2".
               88  CHANGE-RECORD               VALUE "3".
           05  MT-MASTER-DATA.
006300         10  MT-ITEM-NO          PIC X(5).
               10  MT-ITEM-DESC        PIC X(40).
               10  MT-UNIT-COST        PIC S9(3)V99.
               10  MT-UNIT-PRICE       PIC S9(3)V99.
               10  MT-REORDER-POINT    PIC S9(5).
006700*                                                                         
006100 01  INVENTORY-MASTER-RECORD.
006300     05  IM-ITEM-NO              PIC X(5).
           05  IM-DESCRIPTIVE-DATA.
               10  IM-ITEM-DESC        PIC X(40).
               10  IM-UNIT-COST        PIC S9(3)V99.
               10  IM-UNIT-PRICE       PIC S9(3)V99.
           05  IM-INVENTORY-DATA.
               10  IM-REORDER-POINT    PIC S9(5).
               10  IM-ON-HAND          PIC S9(5).
               10  IM-ON-ORDER         PIC S9(5).
006700*
008100 PROCEDURE DIVISION.                                                      
008200*                                                                         
008300 000-MAINTAIN-INVENTORY-FILE.
008400*                                                                         
008500     OPEN INPUT  MNTTRAN
008600          I-O    INVMAST
008800          OUTPUT ERRTRAN.
009000     PERFORM 300-MAINTAIN-INVENTORY-RECORD
009100         UNTIL TRANSACTION-EOF.
009200     CLOSE MNTTRAN
009300           INVMAST
                 ERRTRAN.
009700     STOP RUN.                                                            
009800*                                                                         
009900 300-MAINTAIN-INVENTORY-RECORD.
010000*                                                                         
           PERFORM 310-READ-INVENTORY-TRANSACTION.
           IF NOT TRANSACTION-EOF
               PERFORM 320-READ-INVENTORY-MASTER
               IF DELETE-RECORD
                   IF MASTER-FOUND
                       PERFORM 330-DELETE-INVENTORY-RECORD
                   ELSE
                       PERFORM 380-WRITE-ERROR-TRANSACTION
               ELSE IF ADD-RECORD
                   IF MASTER-FOUND
                       PERFORM 380-WRITE-ERROR-TRANSACTION
                   ELSE
                       PERFORM 340-ADD-INVENTORY-RECORD
               ELSE IF CHANGE-RECORD
                   IF MASTER-FOUND
                       PERFORM 360-CHANGE-INVENTORY-RECORD
                   ELSE
                       PERFORM 380-WRITE-ERROR-TRANSACTION.
      *
       310-READ-INVENTORY-TRANSACTION.
      *
           READ MNTTRAN INTO MAINTENANCE-TRANSACTION
               AT END
                   MOVE "Y" TO TRANSACTION-EOF-SWITCH.
      *
       320-READ-INVENTORY-MASTER.
      *
           MOVE MT-ITEM-NO TO IR-ITEM-NO.
           READ INVMAST INTO INVENTORY-MASTER-RECORD
               INVALID KEY
                   MOVE "N" TO MASTER-FOUND-SWITCH
               NOT INVALID KEY
                   MOVE "Y" TO MASTER-FOUND-SWITCH.
      *
       330-DELETE-INVENTORY-RECORD.
      *
           DELETE INVMAST.
      *
       340-ADD-INVENTORY-RECORD.
      *
           MOVE MT-ITEM-NO       TO IM-ITEM-NO.
           MOVE MT-ITEM-DESC     TO IM-ITEM-DESC.
           MOVE MT-UNIT-COST     TO IM-UNIT-COST.
           MOVE MT-UNIT-PRICE    TO IM-UNIT-PRICE.
           MOVE MT-REORDER-POINT TO IM-REORDER-POINT.
           MOVE ZERO             TO IM-ON-HAND.
           MOVE ZERO             TO IM-ON-ORDER.
           PERFORM 350-WRITE-INVENTORY-RECORD.
      *
       350-WRITE-INVENTORY-RECORD.
      *
           WRITE INVENTORY-RECORD-AREA FROM INVENTORY-MASTER-RECORD
               INVALID KEY
                   DISPLAY "WRITE ERROR ON INVMAST FOR ITEM NUMBER "
                       IR-ITEM-NO
                   MOVE "Y" TO TRANSACTION-EOF-SWITCH.
      *
       360-CHANGE-INVENTORY-RECORD.
      *
           IF MT-ITEM-DESC NOT = SPACE
               MOVE MT-ITEM-DESC TO IM-ITEM-DESC.
           IF MT-UNIT-COST NOT = ZERO
               MOVE MT-UNIT-COST TO IM-UNIT-COST.
           IF MT-UNIT-PRICE NOT = ZERO
               MOVE MT-UNIT-PRICE TO IM-UNIT-PRICE.
           IF MT-REORDER-POINT NOT = ZERO
               MOVE MT-REORDER-POINT TO IM-REORDER-POINT.
           PERFORM 370-REWRITE-INVENTORY-RECORD.
      *
       370-REWRITE-INVENTORY-RECORD.
      *
           REWRITE INVENTORY-RECORD-AREA FROM INVENTORY-MASTER-RECORD.
      *
       380-WRITE-ERROR-TRANSACTION.
      *
           WRITE ERROR-TRANSACTION FROM MAINTENANCE-TRANSACTION.
           IF NOT ERRTRAN-SUCCESSFUL
               DISPLAY "WRITE ERROR ON ERRTRAN FOR ITEM NUMBER "
                   MT-ITEM-NO
               DISPLAY "FILE STATUS CODE IS " ERRTRAN-FILE-STATUS
               MOVE "Y" TO TRANSACTION-EOF-SWITCH.
      *
