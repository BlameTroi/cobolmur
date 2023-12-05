000100 IDENTIFICATION DIVISION.                                                 
000200*                                                                         
000300 PROGRAM-ID.  SRT1000.
000400*                                                                         
000500 ENVIRONMENT DIVISION.                                                    
000600*                                                                         
000700 INPUT-OUTPUT SECTION.                                                    
000800*                                                                         
000900 FILE-CONTROL.                                                            
001000*
           SELECT RCTTRAN  ASSIGN TO "c:\cobol\data\rcttranu.dat".
           SELECT OLDMAST  ASSIGN TO "c:\cobol\data\oldmast.dat".
001200     SELECT NEWMAST  ASSIGN TO "c:\cobol\data\newmast.dat"
                           FILE STATUS IS NEWMAST-FILE-STATUS.
001400     SELECT ERRTRAN  ASSIGN TO "c:\cobol\data\errtran.dat"
                           FILE STATUS IS ERRTRAN-FILE-STATUS.
           SELECT SORTWORK ASSIGN TO "c:\cobol\data\sortwk01.dat".
001600*                                                                         
001700 DATA DIVISION.                                                           
001800*                                                                         
001900 FILE SECTION.                                                            
002000*                                                                         
002100 FD  RCTTRAN.
002400*                                                                         
002500 01  TRANSACTION-RECORD      PIC X(23).
002600*                                                                         
002700 FD  OLDMAST.
003000*                                                                         
003100 01  OLD-MASTER-RECORD       PIC X(70).
003200*                                                                         
003300 FD  NEWMAST.
003600*                                                                         
003700 01  NEW-MASTER-RECORD       PIC X(70).
003800*                                                                         
003900 FD  ERRTRAN.
004200*                                                                         
004300 01  ERROR-TRANSACTION       PIC X(23).
004400*
       SD  SORTWORK.
      *
       01  SORT-WORK-AREA.
           05  SW-ITEM-NO          PIC X(5).
           05  FILLER              PIC X(18).
      *
004500 WORKING-STORAGE SECTION.                                                 
004600*                                                                         
004700 01  SWITCHES.
           05  TRANSACTION-EOF-SWITCH          PIC X   VALUE "N".
               88  TRANSACTION-EOF                     VALUE "Y".
           05  VALID-TRANSACTION-SWITCH        PIC X   VALUE "Y".
               88  VALID-TRANSACTION                   VALUE "Y".
005100     05  FIRST-EXECUTION-SWITCH          PIC X   VALUE "Y".
005200         88  FIRST-EXECUTION                     VALUE "Y".
004900     05  ALL-RECORDS-PROCESSED-SWITCH    PIC X   VALUE "N".
005000         88  ALL-RECORDS-PROCESSED               VALUE "Y".
005300*
       01  FILE-STATUS-FIELDS.
           05  NEWMAST-FILE-STATUS     PIC XX.
               88  NEWMAST-SUCCESSFUL          VALUE "00".
           05  ERRTRAN-FILE-STATUS     PIC XX.
               88  ERRTRAN-SUCCESSFUL          VALUE "00".
      *
006100 01  RECEIPT-TRANSACTION.
006300     05  RT-ITEM-NO              PIC X(5).
           05  RT-VENDOR-NO            PIC X(5).
           05  RT-RECEIPT-DATE         PIC X(8).
           05  RT-RECEIPT-QUANTITY-X   PIC X(5).
           05  RT-RECEIPT-QUANTITY REDEFINES RT-RECEIPT-QUANTITY-X
                                       PIC 9(5).
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
008300 000-UPDATE-INVENTORY-FILE.
008400*                                                                         
008500     OPEN INPUT  OLDMAST
008600                 RCTTRAN
008700          OUTPUT NEWMAST
008800                 ERRTRAN.
           SORT SORTWORK
               ON ASCENDING KEY SW-ITEM-NO
               INPUT PROCEDURE IS 100-EDIT-RECEIPT-TRANSACTIONS
               OUTPUT PROCEDURE IS 400-UPDATE-INVENTORY-RECORDS.
009200     CLOSE RCTTRAN
009300           OLDMAST
009500           NEWMAST
                 ERRTRAN.
009700     STOP RUN.                                                            
009800*
       100-EDIT-RECEIPT-TRANSACTIONS.
      *
           PERFORM 200-EDIT-RECEIPT-TRAN
               UNTIL TRANSACTION-EOF.
      *
       200-EDIT-RECEIPT-TRAN.
      *
           PERFORM 210-READ-RECEIPT-TRANSACTION.
           IF NOT TRANSACTION-EOF
               PERFORM 220-EDIT-TRANSACTION-FIELDS
               IF VALID-TRANSACTION
                   PERFORM 230-RELEASE-VALID-TRANSACTION
               ELSE
                   PERFORM 240-WRITE-ERROR-TRANSACTION.
      *
       210-READ-RECEIPT-TRANSACTION.
      *
           READ RCTTRAN INTO RECEIPT-TRANSACTION
               AT END
                   MOVE "Y" TO TRANSACTION-EOF-SWITCH.
      *
       220-EDIT-TRANSACTION-FIELDS.
      *
           MOVE "Y" TO VALID-TRANSACTION-SWITCH.
           IF       RT-ITEM-NO NOT NUMERIC
                 OR RT-VENDOR-NO NOT NUMERIC
                 OR RT-RECEIPT-QUANTITY-X NOT NUMERIC
               MOVE "N" TO VALID-TRANSACTION-SWITCH.
      *
       230-RELEASE-VALID-TRANSACTION.
      *
           RELEASE SORT-WORK-AREA FROM RECEIPT-TRANSACTION.
      *
014800 240-WRITE-ERROR-TRANSACTION.
014900*
015000     WRITE ERROR-TRANSACTION FROM RECEIPT-TRANSACTION.
           IF NOT ERRTRAN-SUCCESSFUL
               DISPLAY "WRITE ERROR ON ERRTRAN FOR ITEM NUMBER "
                   RT-ITEM-NO
               DISPLAY "FILE STATUS CODE IS " ERRTRAN-FILE-STATUS.
015700*
      *300-SORT-VALID-TRANSACTIONS.  DUMMY MODULE DONE BY SORT PROGRAM.
      *
       400-UPDATE-INVENTORY-RECORDS.
      *
008900     MOVE LOW-VALUE TO IM-ITEM-NO.
009000     PERFORM 500-PROCESS-RECEIPT-TRAN
009100         UNTIL ALL-RECORDS-PROCESSED.
      *
009900 500-PROCESS-RECEIPT-TRAN.
010000*                                                                         
           PERFORM 510-RETURN-RECEIPT-TRANSACTION.
           PERFORM 520-PROCESS-INVENTORY-MASTER
               UNTIL IM-ITEM-NO >= RT-ITEM-NO.
           IF     IM-ITEM-NO = HIGH-VALUE
              AND RT-ITEM-NO = HIGH-VALUE
               MOVE "Y" TO ALL-RECORDS-PROCESSED-SWITCH
           ELSE
               IF IM-ITEM-NO = RT-ITEM-NO
                   PERFORM 550-APPLY-RECEIPT-TRANSACTION
               ELSE
                   PERFORM 240-WRITE-ERROR-TRANSACTION.
      *
       510-RETURN-RECEIPT-TRANSACTION.
      *
           RETURN SORTWORK INTO RECEIPT-TRANSACTION
               AT END
                   MOVE HIGH-VALUE TO RT-ITEM-NO.
      *
       520-PROCESS-INVENTORY-MASTER.
      *
           IF FIRST-EXECUTION
               PERFORM 530-READ-OLD-MASTER
               MOVE "N" TO FIRST-EXECUTION-SWITCH
           ELSE
               PERFORM 540-WRITE-NEW-MASTER
               PERFORM 530-READ-OLD-MASTER.
      *
       530-READ-OLD-MASTER.
      *
           READ OLDMAST INTO INVENTORY-MASTER-RECORD
               AT END
                   MOVE HIGH-VALUE TO IM-ITEM-NO.
      *
013400 540-WRITE-NEW-MASTER.
013500*
           WRITE NEW-MASTER-RECORD FROM INVENTORY-MASTER-RECORD.
           IF NOT NEWMAST-SUCCESSFUL
               DISPLAY "WRITE ERROR ON NEWMAST FOR ITEM NUMBER "
                   IM-ITEM-NO
               DISPLAY "FILE STATUS CODE IS " NEWMAST-FILE-STATUS
               MOVE "Y" TO ALL-RECORDS-PROCESSED-SWITCH.
014300*
       550-APPLY-RECEIPT-TRANSACTION.
      *
           ADD RT-RECEIPT-QUANTITY TO IM-ON-HAND.
           SUBTRACT RT-RECEIPT-QUANTITY FROM IM-ON-ORDER.
      *
