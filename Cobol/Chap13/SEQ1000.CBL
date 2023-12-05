000100 IDENTIFICATION DIVISION.                                                 
000200*                                                                         
000300 PROGRAM-ID.  SEQ1000.
000400*                                                                         
000500 ENVIRONMENT DIVISION.                                                    
000600*                                                                         
000700 INPUT-OUTPUT SECTION.                                                    
000800*                                                                         
000900 FILE-CONTROL.                                                            
001000
           SELECT RCTTRAN  ASSIGN TO "c:\cobol\data\rcttranl.dat"
                           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OLDMAST  ASSIGN TO "c:\cobol\data\oldmastl.dat"
                           ORGANIZATION IS LINE SEQUENTIAL.
001200     SELECT NEWMAST  ASSIGN TO "c:\cobol\data\newmastl.dat"
                           ORGANIZATION IS LINE SEQUENTIAL
001300                     FILE STATUS IS NEWMAST-FILE-STATUS.
001400     SELECT ERRTRAN  ASSIGN TO "c:\cobol\data\errtranl.dat"
                           ORGANIZATION IS LINE SEQUENTIAL
001500                     FILE STATUS IS ERRTRAN-FILE-STATUS.
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
004500 WORKING-STORAGE SECTION.                                                 
004600*                                                                         
004700 01  SWITCHES.                                                            
005100     05  FIRST-EXECUTION-SWITCH          PIC X   VALUE "Y".
005200         88  FIRST-EXECUTION                     VALUE "Y".
004900     05  ALL-RECORDS-PROCESSED-SWITCH    PIC X   VALUE "N".
005000         88  ALL-RECORDS-PROCESSED               VALUE "Y".
005300*                                                                         
005400 01  FILE-STATUS-FIELDS.                                                  
005600     05  NEWMAST-FILE-STATUS     PIC XX.
005700         88  NEWMAST-SUCCESSFUL          VALUE "00".
005800     05  ERRTRAN-FILE-STATUS     PIC XX.
005900         88  ERRTRAN-SUCCESSFUL          VALUE "00".
006000*
006100 01  RECEIPT-TRANSACTION.
006300     05  RT-ITEM-NO              PIC X(5).
           05  RT-VENDOR-NO            PIC X(5).
           05  RT-RECEIPT-DATE         PIC X(8).
           05  RT-RECEIPT-QUANTITY     PIC S9(5).
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
008300 000-UPDATE-INVENTORY-MASTER.
008400*                                                                         
008500     OPEN INPUT  RCTTRAN
008600                 OLDMAST
008700          OUTPUT NEWMAST
008800          EXTEND ERRTRAN.
008900     MOVE LOW-VALUE TO IM-ITEM-NO.                                        
009000     PERFORM 300-PROCESS-RECEIPT-TRAN
009100         UNTIL ALL-RECORDS-PROCESSED.                                     
009200     CLOSE RCTTRAN
009300           OLDMAST
009500           NEWMAST
                 ERRTRAN.
009700     STOP RUN.                                                            
009800*                                                                         
009900 300-PROCESS-RECEIPT-TRAN.
010000*                                                                         
           PERFORM 310-READ-RECEIPT-TRANSACTION.
           PERFORM 320-PROCESS-INVENTORY-MASTER
               UNTIL IM-ITEM-NO >= RT-ITEM-NO.
           IF      IM-ITEM-NO = HIGH-VALUE
               AND RT-ITEM-NO = HIGH-VALUE
               MOVE "Y" TO ALL-RECORDS-PROCESSED-SWITCH
           ELSE
               IF IM-ITEM-NO = RT-ITEM-NO
                   PERFORM 350-APPLY-RECEIPT-TRANSACTION
               ELSE
                   PERFORM 360-WRITE-ERROR-TRANSACTION.
      *
       310-READ-RECEIPT-TRANSACTION.
      *
           READ RCTTRAN INTO RECEIPT-TRANSACTION
               AT END
                   MOVE HIGH-VALUE TO RT-ITEM-NO.
      *
       320-PROCESS-INVENTORY-MASTER.
      *
           IF FIRST-EXECUTION
               PERFORM 330-READ-OLD-MASTER
               MOVE "N" TO FIRST-EXECUTION-SWITCH
           ELSE
               PERFORM 340-WRITE-NEW-MASTER
               PERFORM 330-READ-OLD-MASTER.
      *
       330-READ-OLD-MASTER.
      *
           READ OLDMAST INTO INVENTORY-MASTER-RECORD
               AT END
                   MOVE HIGH-VALUE TO IM-ITEM-NO.
      *
013400 340-WRITE-NEW-MASTER.
013500*
           WRITE NEW-MASTER-RECORD FROM INVENTORY-MASTER-RECORD.
013700     IF NOT NEWMAST-SUCCESSFUL
013800         DISPLAY "WRITE ERROR ON NEWMAST FOR ITEM NUMBER "
013950             IM-ITEM-NO
               DISPLAY "FILE STATUS CODE IS " NEWMAST-FILE-STATUS
014200         MOVE "Y" TO ALL-RECORDS-PROCESSED-SWITCH.
014300*
       350-APPLY-RECEIPT-TRANSACTION.
      *
           ADD RT-RECEIPT-QUANTITY TO IM-ON-HAND.
           SUBTRACT RT-RECEIPT-QUANTITY FROM IM-ON-ORDER.
      *
014800 360-WRITE-ERROR-TRANSACTION.
014900*
015000     WRITE ERROR-TRANSACTION FROM RECEIPT-TRANSACTION.
015100     IF NOT ERRTRAN-SUCCESSFUL
015200         DISPLAY "WRITE ERROR ON ERRTRAN FOR ITEM NUMBER "
015300             RT-ITEM-NO
               DISPLAY "FILE STATUS CODE IS " ERRTRAN-FILE-STATUS
015600         MOVE "Y" TO ALL-RECORDS-PROCESSED-SWITCH.
015700*
