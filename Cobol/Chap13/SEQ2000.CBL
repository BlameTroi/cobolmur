000100 IDENTIFICATION DIVISION.                                                 
000200*                                                                         
000300 PROGRAM-ID.  SEQ2000.
000400*                                                                         
000500 ENVIRONMENT DIVISION.                                                    
000600*                                                                         
000700 INPUT-OUTPUT SECTION.                                                    
000800*                                                                         
000900 FILE-CONTROL.                                                            
001000
           SELECT MNTTRAN  ASSIGN TO "c:\cobol\data\mnttran.dat".
           SELECT OLDMAST  ASSIGN TO "c:\cobol\data\oldmast.dat".
001200     SELECT NEWMAST  ASSIGN TO "c:\cobol\data\newmast.dat"
001300                     FILE STATUS IS NEWMAST-FILE-STATUS.
001400     SELECT ERRTRAN  ASSIGN TO "c:\cobol\data\errtran.dat"
001500                     FILE STATUS IS ERRTRAN-FILE-STATUS.
001600*                                                                         
001700 DATA DIVISION.                                                           
001800*                                                                         
001900 FILE SECTION.                                                            
002000*                                                                         
002100 FD  MNTTRAN.
002400*                                                                         
002500 01  TRANSACTION-RECORD      PIC X(61).
002600*                                                                         
002700 FD  OLDMAST.
003000*                                                                         
003100 01  OLD-MASTER-RECORD       PIC X(70).
003200*                                                                         
003300 FD  NEWMAST.
003600*                                                                         
003700 01  NEW-MASTER-RECORD.
      *
006300     05  NM-ITEM-NO              PIC X(5).
           05  NM-DESCRIPTIVE-DATA.
               10  NM-ITEM-DESC        PIC X(40).
               10  NM-UNIT-COST        PIC S9(3)V99.
               10  NM-UNIT-PRICE       PIC S9(3)V99.
           05  NM-INVENTORY-DATA.
               10  NM-REORDER-POINT    PIC S9(5).
               10  NM-ON-HAND          PIC S9(5).
               10  NM-ON-ORDER         PIC S9(5).
003800*                                                                         
003900 FD  ERRTRAN.
004200*                                                                         
004300 01  ERROR-TRANSACTION       PIC X(61).
004400*                                                                         
004500 WORKING-STORAGE SECTION.                                                 
004600*                                                                         
004700 01  SWITCHES.                                                            
004900     05  ALL-RECORDS-PROCESSED-SWITCH    PIC X   VALUE "N".
005000         88  ALL-RECORDS-PROCESSED               VALUE "Y".
           05  NEED-TRANSACTION-SWITCH         PIC X   VALUE "Y".
               88  NEED-TRANSACTION                    VALUE "Y".
           05  NEED-MASTER-SWITCH              PIC X   VALUE "Y".
               88  NEED-MASTER                         VALUE "Y".
           05  WRITE-MASTER-SWITCH             PIC X   VALUE "N".
               88  WRITE-MASTER                        VALUE "Y".
005300*                                                                         
005400 01  FILE-STATUS-FIELDS.                                                  
005600     05  NEWMAST-FILE-STATUS     PIC XX.
005700         88  NEWMAST-SUCCESSFUL          VALUE "00".
005800     05  ERRTRAN-FILE-STATUS     PIC XX.
005900         88  ERRTRAN-SUCCESSFUL          VALUE "00".
006000*
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
008500     OPEN INPUT  OLDMAST
008600                 MNTTRAN
008700          OUTPUT NEWMAST
008800                 ERRTRAN.
009000     PERFORM 300-MAINTAIN-INVENTORY-RECORD
009100         UNTIL ALL-RECORDS-PROCESSED.                                     
009200     CLOSE MNTTRAN
009300           OLDMAST
009500           NEWMAST
                 ERRTRAN.
009700     STOP RUN.                                                            
009800*                                                                         
009900 300-MAINTAIN-INVENTORY-RECORD.
010000*                                                                         
           IF NEED-TRANSACTION
               PERFORM 310-READ-INVENTORY-TRANSACTION
               MOVE "N" TO NEED-TRANSACTION-SWITCH.
           IF NEED-MASTER
               PERFORM 320-READ-OLD-MASTER
               MOVE "N" TO NEED-MASTER-SWITCH.
           PERFORM 330-MATCH-MASTER-TRAN.
           IF WRITE-MASTER
               PERFORM 340-WRITE-NEW-MASTER
               MOVE "N" TO WRITE-MASTER-SWITCH.
      *
       310-READ-INVENTORY-TRANSACTION.
      *
           READ MNTTRAN INTO MAINTENANCE-TRANSACTION
               AT END
                   MOVE HIGH-VALUE TO MT-ITEM-NO.
      *
       320-READ-OLD-MASTER.
      *
           READ OLDMAST INTO INVENTORY-MASTER-RECORD
               AT END
                   MOVE HIGH-VALUE TO IM-ITEM-NO.
      *
013400 330-MATCH-MASTER-TRAN.
      *
           IF IM-ITEM-NO > MT-ITEM-NO
               PERFORM 350-PROCESS-HI-MASTER
           ELSE IF IM-ITEM-NO < MT-ITEM-NO
               PERFORM 360-PROCESS-LO-MASTER
           ELSE
               PERFORM 370-PROCESS-MAST-TRAN-EQUAL.

       340-WRITE-NEW-MASTER.
013500*
013600     WRITE NEW-MASTER-RECORD.
           IF NOT NEWMAST-SUCCESSFUL
013800         DISPLAY "WRITE ERROR ON NEWMAST FOR ITEM NUMBER "
013950             IM-ITEM-NO
               DISPLAY "FILE STATUS CODE IS " NEWMAST-FILE-STATUS
014200         MOVE "Y" TO ALL-RECORDS-PROCESSED-SWITCH.
014300*
       350-PROCESS-HI-MASTER.
      *
           IF ADD-RECORD
               PERFORM 380-APPLY-ADD-TRANSACTION
           ELSE
               PERFORM 390-WRITE-ERROR-TRANSACTION.
      *
       360-PROCESS-LO-MASTER.
      *
           MOVE INVENTORY-MASTER-RECORD TO NEW-MASTER-RECORD.
           MOVE "Y" TO WRITE-MASTER-SWITCH.
           MOVE "Y" TO NEED-MASTER-SWITCH.
      *
       370-PROCESS-MAST-TRAN-EQUAL.
      *
           IF IM-ITEM-NO = HIGH-VALUES
               MOVE "Y" TO ALL-RECORDS-PROCESSED-SWITCH
           ELSE
               IF DELETE-RECORD
                   PERFORM 400-APPLY-DELETE-TRANSACTION
               ELSE
                   IF CHANGE-RECORD
                       PERFORM 410-APPLY-CHANGE-TRANSACTION
                   ELSE
                       PERFORM 390-WRITE-ERROR-TRANSACTION.
      *
       380-APPLY-ADD-TRANSACTION.
      *
           MOVE MT-ITEM-NO TO NM-ITEM-NO.
           MOVE MT-ITEM-DESC TO NM-ITEM-DESC.
           MOVE MT-UNIT-COST TO NM-UNIT-COST.
           MOVE MT-UNIT-PRICE TO NM-UNIT-PRICE.
           MOVE MT-REORDER-POINT TO NM-REORDER-POINT.
           MOVE ZERO TO NM-ON-HAND
                        NM-ON-ORDER.
           MOVE "Y" TO WRITE-MASTER-SWITCH.
           MOVE "Y" TO NEED-TRANSACTION-SWITCH.
012700*
014800 390-WRITE-ERROR-TRANSACTION.
014900*
           WRITE ERROR-TRANSACTION FROM MAINTENANCE-TRANSACTION.
           IF NOT ERRTRAN-SUCCESSFUL
015200         DISPLAY "WRITE ERROR ON ERRTRAN FOR ITEM NUMBER "
015300             MT-ITEM-NO
               DISPLAY "FILE STATUS CODE IS " ERRTRAN-FILE-STATUS
015600         MOVE "Y" TO ALL-RECORDS-PROCESSED-SWITCH
           ELSE
015000         MOVE "Y" TO NEED-TRANSACTION-SWITCH.
      *
       400-APPLY-DELETE-TRANSACTION.
      *
           MOVE "Y" TO NEED-MASTER-SWITCH.
           MOVE "Y" TO NEED-TRANSACTION-SWITCH.

      *
       410-APPLY-CHANGE-TRANSACTION.
      *
           IF MT-ITEM-DESC NOT = SPACE
               MOVE MT-ITEM-DESC TO IM-ITEM-DESC.
           IF MT-UNIT-COST NOT = ZERO
               MOVE MT-UNIT-COST TO IM-UNIT-COST.
           IF MT-UNIT-PRICE NOT = ZERO
               MOVE MT-UNIT-PRICE TO IM-UNIT-PRICE.
1          IF MT-REORDER-POINT NOT = ZERO
               MOVE MT-REORDER-POINT TO IM-REORDER-POINT.
           MOVE "Y" TO NEED-TRANSACTION-SWITCH.
