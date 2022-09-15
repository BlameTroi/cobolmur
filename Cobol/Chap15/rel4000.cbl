000100 IDENTIFICATION DIVISION.                                                 
000200*                                                                         
000300 PROGRAM-ID. REL4000.
000400*                                                                         
000500 ENVIRONMENT DIVISION.                                                    
000600*                                                                         
000700 INPUT-OUTPUT SECTION.                                                    
000800*                                                                         
000900 FILE-CONTROL.                                                            
001000     SELECT INVMASTS ASSIGN TO "c:\cobol\data\invmasts.dat".
001100     SELECT INVMASTR ASSIGN TO "c:\cobol\data\invmastr.dat"
001200                     ORGANIZATION IS RELATIVE
001300                     ACCESS IS RANDOM
001400                     RELATIVE KEY IS INVMASTR-RR-NUMBER.
001500*                                                                         
001600 DATA DIVISION.                                                           
001700*                                                                         
001800 FILE SECTION.                                                            
001900*                                                                         
002000 FD  INVMASTS.
002300*                                                                         
002400 01  SEQUENTIAL-RECORD-AREA  PIC X(70).
002500*                                                                         
002600 FD  INVMASTR.
002900*                                                                         
003000 01  RELATIVE-RECORD-AREA    PIC X(70).
003400*                                                                         
003500 WORKING-STORAGE SECTION.                                                 
003600*                                                                         
003700 01  SWITCHES.                                                            
003900     05  INVMAST-EOF-SWITCH      PIC X    VALUE "N".
004000         88  INVMAST-EOF                  VALUE "Y".
      *
       01  KEY-FIELDS.
           05  INVMASTR-RR-NUMBER      PIC 9(5).
004100*                                                                         
004200 01  INVENTORY-MASTER-RECORD.                                             
004500     05  IM-ITEM-NO              PIC X(5).
004400     05  IM-DESCRIPTIVE-DATA.                                             
004600         10  IM-ITEM-DESC        PIC X(40).
004700         10  IM-UNIT-COST        PIC S9(3)V99.
004800         10  IM-UNIT-PRICE       PIC S9(3)V99.
004900     05  IM-INVENTORY-DATA.                                               
005000         10  IM-REORDER-POINT    PIC S9(5).                               
005100         10  IM-ON-HAND          PIC S9(5).                               
005200         10  IM-ON-ORDER         PIC S9(5).                               
005400*                                                                         
005500 PROCEDURE DIVISION.                                                      
005600*                                                                         
005700 000-CREATE-INVENTORY-FILE.                                               
005800*                                                                         
005900     OPEN INPUT  INVMASTS
006000          OUTPUT INVMASTR.
006100     PERFORM 100-CREATE-INVENTORY-RECORD                                  
006200         UNTIL INVMAST-EOF.                                               
006300     CLOSE INVMASTS
006400           INVMASTR.
006600     STOP RUN.                                                            
006700*                                                                         
006800 100-CREATE-INVENTORY-RECORD.                                             
006900*                                                                         
007000     PERFORM 110-READ-SEQUENTIAL-RECORD.
007100     IF NOT INVMAST-EOF                                                   
007200         PERFORM 120-WRITE-RELATIVE-RECORD.
007300*                                                                         
007400 110-READ-SEQUENTIAL-RECORD.
007500*                                                                         
007600     READ INVMASTS INTO INVENTORY-MASTER-RECORD
007700         AT END                                                           
007800             MOVE "Y" TO INVMAST-EOF-SWITCH.                              
007900*                                                                         
008000 120-WRITE-RELATIVE-RECORD.
008100*
           COMPUTE INVMASTR-RR-NUMBER =
               FUNCTION NUMVAL (IM-ITEM-NO) - 10000.
008200     WRITE RELATIVE-RECORD-AREA FROM INVENTORY-MASTER-RECORD
008300         INVALID KEY                                                      
008400             DISPLAY "WRITE ERROR ON INVMASTR FOR ITEM NUMBER "
                       IM-ITEM-NO
008600             MOVE "Y" TO INVMAST-EOF-SWITCH.                              
