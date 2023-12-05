       IDENTIFICATION DIVISION.                                                 
      *                                                                         
       PROGRAM-ID.    LISTMODS.
      *                                                                         
       ENVIRONMENT DIVISION.                                                    
      *                                                                         
       CONFIGURATION SECTION.                                                   
      *                                                                         
       INPUT-OUTPUT SECTION.                                                    
      *                                                                         
       FILE-CONTROL.                                                            
      *                                                                         
           SELECT SRCEFILE   ASSIGN TO "c:\cobol\rpt3000.cbl"
                             ORGANIZATION IS LINE SEQUENTIAL.
           SELECT MODLIST    ASSIGN TO "c:\cobol\data\modlist.prn".
      *                                                                         
       DATA DIVISION.                                                           
      *                                                                         
       FILE SECTION.                                                            
      *                                                                         
       FD  SRCEFILE
           LABEL RECORDS ARE STANDARD.                                          
      *                                                                         
       01  SOURCE-RECORD.                                                       
      *                                                                         
           05  FILLER                    PIC X(6).                              
           05  CODING-AREA               PIC X(66).                             
               88  BLANK-LINE            VALUE SPACE.                           
           05  CODING-AREA-X             REDEFINES CODING-AREA.                 
               10  AST-AREA              PIC X.
                   88  COMMENT           VALUE "*".                             
               10  DATA-AREA.                                                   
                   15  A-AREA            PIC X(4).                              
                   15  B-AREA            PIC X(61).                             
           05  FILLER                    PIC X(8).                              
      *                                                                         
       FD  MODLIST                                                              
           LABEL RECORDS ARE OMITTED.                                           
      *                                                                         
       01  PRINT-AREA.                                                          
      *                                                                         
           05  PRINT-LINE        PIC X(132).                                    
           05  PRINT-LINE-1      REDEFINES PRINT-LINE.                          
               10  PL1-ASTERISK  PIC X.                                         
               10  PL1-NAME      PIC X(32).                                     
               10  FILLER        PIC X(99).                                     
           05  PRINT-LINE-2      REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(4).                                      
               10  PL2-ASTERISK  PIC X.                                         
               10  PL2-NAME      PIC X(32).                                     
               10  FILLER        PIC X(95).                                     
           05  PRINT-LINE-3      REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(8).                                      
               10  PL3-ASTERISK  PIC X.                                         
               10  PL3-NAME      PIC X(32).                                     
               10  FILLER        PIC X(91).                                     
           05  PRINT-LINE-4      REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(12).                                     
               10  PL4-ASTERISK  PIC X.                                         
               10  PL4-NAME      PIC X(32).                                     
               10  FILLER        PIC X(87).                                     
           05  PRINT-LINE-5      REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(16).                                     
               10  PL5-ASTERISK  PIC X.                                         
               10  PL5-NAME      PIC X(32).                                     
               10  FILLER        PIC X(83).                                     
           05  PRINT-LINE-6      REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(20).                                     
               10  PL6-ASTERISK  PIC X.                                         
               10  PL6-NAME      PIC X(32).                                     
               10  FILLER        PIC X(79).                                     
           05  PRINT-LINE-7      REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(24).                                     
               10  PL7-ASTERISK  PIC X.                                         
               10  PL7-NAME      PIC X(32).                                     
               10  FILLER        PIC X(75).                                     
           05  PRINT-LINE-8      REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(28).                                     
               10  PL8-ASTERISK  PIC X.                                         
               10  PL8-NAME      PIC X(32).                                     
               10  FILLER        PIC X(71).                                     
           05  PRINT-LINE-9      REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(32).                                     
               10  PL9-ASTERISK  PIC X.                                         
               10  PL9-NAME      PIC X(32).                                     
               10  FILLER        PIC X(67).                                     
           05  PRINT-LINE-10     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(36).                                     
               10  PL10-ASTERISK PIC X.                                         
               10  PL10-NAME     PIC X(32).                                     
               10  FILLER        PIC X(63).                                     
           05  PRINT-LINE-11     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(40).                                     
               10  PL11-ASTERISK PIC X.                                         
               10  PL11-NAME     PIC X(32).                                     
               10  FILLER        PIC X(59).                                     
           05  PRINT-LINE-12     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(44).                                     
               10  PL12-ASTERISK PIC X.                                         
               10  PL12-NAME     PIC X(32).                                     
               10  FILLER        PIC X(55).                                     
           05  PRINT-LINE-13     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(48).                                     
               10  PL13-ASTERISK PIC X.                                         
               10  PL13-NAME     PIC X(32).                                     
               10  FILLER        PIC X(51).                                     
           05  PRINT-LINE-14     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(52).                                     
               10  PL14-ASTERISK PIC X.                                         
               10  PL14-NAME     PIC X(32).                                     
               10  FILLER        PIC X(47).                                     
           05  PRINT-LINE-15     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(56).                                     
               10  PL15-ASTERISK PIC X.                                         
               10  PL15-NAME     PIC X(32).                                     
               10  FILLER        PIC X(43).                                     
           05  PRINT-LINE-16     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(60).                                     
               10  PL16-ASTERISK PIC X.                                         
               10  PL16-NAME     PIC X(32).                                     
               10  FILLER        PIC X(39).                                     
           05  PRINT-LINE-17     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(64).                                     
               10  PL17-ASTERISK PIC X.                                         
               10  PL17-NAME     PIC X(32).                                     
               10  FILLER        PIC X(35).                                     
           05  PRINT-LINE-18     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(68).                                     
               10  PL18-ASTERISK PIC X.                                         
               10  PL18-NAME     PIC X(32).                                     
               10  FILLER        PIC X(31).                                     
           05  PRINT-LINE-19     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(72).                                     
               10  PL19-ASTERISK PIC X.                                         
               10  PL19-NAME     PIC X(32).                                     
               10  FILLER        PIC X(27).                                     
           05  PRINT-LINE-20     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(76).                                     
               10  PL20-ASTERISK PIC X.                                         
               10  PL20-NAME     PIC X(32).                                     
               10  FILLER        PIC X(23).                                     
           05  PRINT-LINE-21     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(80).                                     
               10  PL21-ASTERISK PIC X.                                         
               10  PL21-NAME     PIC X(32).                                     
               10  FILLER        PIC X(19).                                     
           05  PRINT-LINE-22     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(84).                                     
               10  PL22-ASTERISK PIC X.                                         
               10  PL22-NAME     PIC X(32).                                     
               10  FILLER        PIC X(15).                                     
           05  PRINT-LINE-23     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(88).                                     
               10  PL23-ASTERISK PIC X.                                         
               10  PL23-NAME     PIC X(32).                                     
               10  FILLER        PIC X(11).                                     
           05  PRINT-LINE-24     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(92).                                     
               10  PL24-ASTERISK PIC X.                                         
               10  PL24-NAME     PIC X(32).                                     
               10  FILLER        PIC X(7).                                      
           05  PRINT-LINE-25     REDEFINES PRINT-LINE.                          
               10  FILLER        PIC X(96).                                     
               10  PL25-ASTERISK PIC X.                                         
               10  PL25-NAME     PIC X(32).                                     
               10  FILLER        PIC X(3).                                      
           05  DECLARATIVE-LINE      REDEFINES PRINT-LINE.                      
               10  FILLER            PIC X.                                     
               10  DL-CODE           PIC X(65).                                 
               10  FILLER            PIC X(66).                                 
           05  MODULE-LINE           REDEFINES PRINT-LINE.                      
               10  ML-MODULE-NAME    PIC X(30).                                 
               10  FILLER            PIC X(102).                                
           05  STATISTICS-LINE       REDEFINES PRINT-LINE.                      
               10  SL-DESCRIPTION    PIC X(30).                                 
               10  SL-COUNT          PIC ZZ,ZZ9.                                
               10  FILLER            PIC X(96).                                 
      *                                                                         
       WORKING-STORAGE SECTION.                                                 
      *                                                                         
       01  MODULE-TABLE.                                                        
      *                                                                         
           05  MODULE-ENTRY                  OCCURS 250 TIMES                   
                                             INDEXED BY MODULE-INDEX.           
               10  MODULE-NUMBER             PIC S9(3)    COMP.                 
               10  FULL-MODULE-NAME.                                            
                   15  MODULE-NAME           PIC X(30).                         
                   15  FILLER                PIC X.                             
                   15  COMMON-MODULE-FLAG    PIC X.                             
                       88  COMMON-MODULE     VALUE "C".
               10  MODULE-TYPE-FLAG          PIC X.                             
                   88  PROGRAM-PARAGRAPH     VALUE "P".
                   88  PROGRAM-SECTION       VALUE "X".
                   88  SUBPROGRAM            VALUE "S".
               10  MODULE-PRINTED-SW         PIC X.                             
                   88  MODULE-PRINTED        VALUE "Y".
               10  TIMES-CALLED              PIC S9(3)    COMP.                 
               10  MODULE-CALL-COUNT         PIC S9(3)    COMP.                 
               10  MODULE-CALL-DATA          OCCURS 25 TIMES                    
                                             INDEXED BY CALL-INDEX.             
                   15  CALLED-MODULE         PIC S9(3)    COMP.                 
               10  CALL-OVERFLOW-SW          PIC X.                             
      *                                                                         
       01  MODULE-TABLE-LIMITS               COMP.                              
      *                                                                         
           05  MODULE-LIMIT                  PIC S999     VALUE +250.           
           05  CALL-LIMIT                    PIC S999     VALUE +25.            
      *                                                                         
       01  UNSTRING-WORK-FIELDS.                                                
      *                                                                         
           05  SOURCE-LINE.                                                     
               10  SOURCE-LINE-POSITION      PIC X                              
                   OCCURS 66 TIMES
                   INDEXED BY SOURCE-LINE-POSITION-INDEX.                       
           05  NEXT-SOURCE-WORD.                                                
               10  SOURCE-WORD-POSITION      PIC X                              
                   OCCURS 30 TIMES                                              
                   INDEXED BY SOURCE-WORD-POSITION-INDEX.                       
           05  SOURCE-WORDS.                                                    
               10  SOURCE-WORD               PIC X(30)                          
                   OCCURS 8 TIMES                                               
                   INDEXED BY SOURCE-WORD-INDEX.                                
           05  SOURCE-WORD-COUNT             PIC S9      COMP.                  
      *                                                                         
       01  PROGRAM-CONTROL-SWITCHES.                                            
      *                                                                         
           05  PARAGRAPH-MODULES-SW          PIC X       VALUE "Y".
               88  PARAGRAPH-MODULES                     VALUE "Y".
               88  SECTION-MODULES                       VALUE "N".
           05  SRCEFILE-EOF-SW               PIC X       VALUE "N".
               88  SRCEFILE-EOF                          VALUE "Y".
           05  ACTIVE-RECORD-SW              PIC X.                             
               88  ACTIVE-RECORD                         VALUE "Y".
           05  CANCEL-PROGRAM-SW             PIC X       VALUE "N".
               88  CANCEL-PROGRAM                        VALUE "Y".
           05  COUNT-LINES-SW                PIC X       VALUE "Y".
               88  COUNT-LINES                           VALUE "Y".
           05  PROCEDURE-DIVISION-SW         PIC X       VALUE "N".
               88  PROCEDURE-DIVISION                    VALUE "Y".
           05  DECLARATIVES-SECTION-SW       PIC X.                             
               88  DECLARATIVES-SECTION                  VALUE "Y".
           05  END-DECLARATIVES-SW           PIC X       VALUE "N".
               88  END-DECLARATIVES                      VALUE "Y".
           05  FIRST-MODULE-NAME-SW          PIC X       VALUE "Y".
               88  FIRST-MODULE-NAME                     VALUE "Y".
           05  NEXT-PROCEDURE-NAME-SW        PIC X.                             
               88  NEXT-PROCEDURE-NAME                   VALUE "Y".
           05  DUPLICATE-CALL-SW             PIC X       VALUE "N".
               88  DUPLICATE-CALL                        VALUE "Y".
      *                                                                         
       01  SEARCH-SWITCHES.                                                     
      *                                                                         
           05  FOUND-SW                      PIC X.                             
               88  FOUND                                 VALUE "Y".
           05  PERFORM-FOUND-SW              PIC X       VALUE "N".
               88  PERFORM-FOUND                         VALUE "Y".
           05  CALL-FOUND-SW                 PIC X       VALUE "N".
               88  CALL-FOUND                            VALUE "Y".
           05  SORT-FOUND-SW                 PIC X       VALUE "N".
               88  SORT-FOUND                            VALUE "Y".
           05  MERGE-FOUND-SW                PIC X       VALUE "N".
               88  MERGE-FOUND                           VALUE "Y".
           05  INPUT-PROCEDURE-FOUND-SW      PIC X       VALUE "N".
               88  INPUT-PROCEDURE-FOUND                 VALUE "Y".
           05  OUTPUT-PROCEDURE-FOUND-SW     PIC X       VALUE "N".
               88  OUTPUT-PROCEDURE-FOUND                VALUE "Y".
           05  GOTO-FOUND-SW                 PIC X       VALUE "N".
               88  GOTO-FOUND                            VALUE "Y".
           05  USE-STATEMENT-SW              PIC X       VALUE "N".
               88  USE-STATEMENT                         VALUE "Y".
      *                                                                         
       01  SUMMARY-SWITCHES.                                                    
      *                                                                         
           05  TABLE-OVERFLOW-SW             PIC X       VALUE "N".
               88  TABLE-OVERFLOW                        VALUE "Y".
           05  MODULE-CALL-OVERFLOW-SW       PIC X       VALUE "N".
               88  CALL-OVERFLOW                         VALUE "Y".
           05  LEVEL-OVERFLOW-SW             PIC X       VALUE "N".
               88  LEVEL-OVERFLOW                        VALUE "Y".
           05  PRINT-UNCALLED-MODULES-SW     PIC X       VALUE "N".
               88  PRINT-UNCALLED-MODULES                VALUE "Y".
           05  PRINT-CALLED-SUBPROGRAMS-SW   PIC X       VALUE "N".
               88  PRINT-CALLED-SUBPROGRAMS              VALUE "Y".
      *                                                                         
       01  DATE-FIELDS.                                                         
      *                                                                         
           05  SYSTEM-DATE         PIC 9(6).                                    
           05  SYSTEM-DATE-R       REDEFINES SYSTEM-DATE.                       
               10  SYSTEM-YEAR     PIC 99.                                      
               10  SYSTEM-MONTH    PIC 99.                                      
               10  SYSTEM-DAY      PIC 99.                                      
           05  TODAYS-DATE         PIC 9(6).                                    
           05  TODAYS-DATE-R       REDEFINES TODAYS-DATE.                       
               10  TODAYS-MONTH    PIC 99.                                      
               10  TODAYS-DAY      PIC 99.                                      
               10  TODAYS-YEAR     PIC 99.                                      
      *                                                                         
       01  TIME-FIELDS.                                                         
      *                                                                         
           05  SYSTEM-TIME             PIC 9(8).                                
           05  SYSTEM-TIME-R           REDEFINES SYSTEM-TIME.                   
               10  SYSTEM-HOUR         PIC 99.                                  
               10  SYSTEM-MINUTE       PIC 99.                                  
               10  SYSTEM-SECOND       PIC 99.                                  
               10  SYSTEM-HUNDREDTH    PIC 99.                                  
      *                                                                         
       01  COUNT-FIELDS                   COMP.                                 
      *                                                                         
           05  TOTAL-LINE-COUNT           PIC S9(5)    VALUE ZERO.              
           05  SOURCE-LINE-COUNT          PIC S9(5)    VALUE ZERO.              
           05  PD-LINE-COUNT              PIC S9(5)    VALUE ZERO.              
           05  MODULE-COUNT               PIC S9(3)    VALUE ZERO.              
           05  COBOL-MODULE-COUNT         PIC S9(3)    VALUE ZERO.              
           05  COBOL-PARAGRAPH-COUNT      PIC S9(3)    VALUE ZERO.              
           05  COBOL-SECTION-COUNT        PIC S9(3)    VALUE ZERO.              
           05  SUBPROGRAM-COUNT           PIC S9(3)    VALUE ZERO.              
           05  RESTART-COUNT              PIC S9(5)    VALUE ZERO.              
           05  PERFORM-COUNT              PIC S9(3)    VALUE ZERO.              
           05  INLINE-PERFORM-COUNT       PIC S9(3)    VALUE ZERO.
           05  CALL-COUNT                 PIC S9(3)    VALUE ZERO.              
           05  SORT-COUNT                 PIC S9(3)    VALUE ZERO.              
           05  MERGE-COUNT                PIC S9(3)    VALUE ZERO.              
           05  SORT-MERGE-PROCEDURE-COUNT PIC S9(3)    VALUE ZERO.              
           05  GOTO-COUNT                 PIC S9(3)    VALUE ZERO.              
           05  NUMBER-OF-CALLS            PIC S9(3)    VALUE ZERO.              
           05  PERIOD-COUNT               PIC S9       VALUE ZERO.              
      *                                                                         
       01  RECORD-LOCATOR-NUMBERS          COMP.                                
      *                                                                         
           05  FIRST-PD-RECORD-NO          PIC S9(5)   VALUE ZERO.              
           05  FIRST-DECLARATIVE-RECORD-NO PIC S9(5)   VALUE ZERO.              
           05  LAST-DECLARATIVE-RECORD-NO  PIC S9(5)   VALUE ZERO.              
           05  FIRST-PROC-NAME-RECORD-NO   PIC S9(5)   VALUE ZERO.              
      *                                                                         
       01  SAVE-AREAS.                                                          
      *                                                                         
           05  PRINT-SAVE-AREA             PIC X(132).                          
           05  INDEX-SAVE-AREA             INDEX.                               
           05  CALLED-MODULE-SAVE-AREA     PIC S9(3)   COMP.                    
      *                                                                         
       01  SEARCH-FIELDS.                                                       
      *                                                                         
           05  CALLED-PROC-NAME            PIC X(30).                           
           05  CALLED-PROC-NUMBER          PIC S9(3)   COMP.                    
      *                                                                         
       01  INDEX-DATA-FIELDS   INDEX.                                           
      *                                                                         
           05  MODULE-INDEX-SAVE-AREA-1.                                        
           05  MODULE-INDEX-SAVE-AREA-2.                                        
           05  MODULE-INDEX-SAVE-AREA-3.                                        
           05  MODULE-INDEX-SAVE-AREA-4.                                        
           05  MODULE-INDEX-SAVE-AREA-5.                                        
           05  MODULE-INDEX-SAVE-AREA-6.                                        
           05  MODULE-INDEX-SAVE-AREA-7.                                        
           05  MODULE-INDEX-SAVE-AREA-8.                                        
           05  MODULE-INDEX-SAVE-AREA-9.                                        
           05  MODULE-INDEX-SAVE-AREA-10.                                       
           05  MODULE-INDEX-SAVE-AREA-11.                                       
           05  MODULE-INDEX-SAVE-AREA-12.                                       
           05  MODULE-INDEX-SAVE-AREA-13.                                       
           05  MODULE-INDEX-SAVE-AREA-14.                                       
           05  MODULE-INDEX-SAVE-AREA-15.                                       
           05  MODULE-INDEX-SAVE-AREA-16.                                       
           05  MODULE-INDEX-SAVE-AREA-17.                                       
           05  MODULE-INDEX-SAVE-AREA-18.                                       
           05  MODULE-INDEX-SAVE-AREA-19.                                       
           05  MODULE-INDEX-SAVE-AREA-20.                                       
           05  MODULE-INDEX-SAVE-AREA-21.                                       
           05  MODULE-INDEX-SAVE-AREA-22.                                       
           05  MODULE-INDEX-SAVE-AREA-23.                                       
           05  MODULE-INDEX-SAVE-AREA-24.                                       
      *                                                                         
           05  CALL-INDEX-SAVE-AREA-1.                                          
           05  CALL-INDEX-SAVE-AREA-2.                                          
           05  CALL-INDEX-SAVE-AREA-3.                                          
           05  CALL-INDEX-SAVE-AREA-4.                                          
           05  CALL-INDEX-SAVE-AREA-5.                                          
           05  CALL-INDEX-SAVE-AREA-6.                                          
           05  CALL-INDEX-SAVE-AREA-7.                                          
           05  CALL-INDEX-SAVE-AREA-8.                                          
           05  CALL-INDEX-SAVE-AREA-9.                                          
           05  CALL-INDEX-SAVE-AREA-10.                                         
           05  CALL-INDEX-SAVE-AREA-11.                                         
           05  CALL-INDEX-SAVE-AREA-12.                                         
           05  CALL-INDEX-SAVE-AREA-13.                                         
           05  CALL-INDEX-SAVE-AREA-14.                                         
           05  CALL-INDEX-SAVE-AREA-15.                                         
           05  CALL-INDEX-SAVE-AREA-16.                                         
           05  CALL-INDEX-SAVE-AREA-17.                                         
           05  CALL-INDEX-SAVE-AREA-18.                                         
           05  CALL-INDEX-SAVE-AREA-19.                                         
           05  CALL-INDEX-SAVE-AREA-20.                                         
           05  CALL-INDEX-SAVE-AREA-21.                                         
           05  CALL-INDEX-SAVE-AREA-22.                                         
           05  CALL-INDEX-SAVE-AREA-23.                                         
      *                                                                         
       01  PRINT-FIELDS                COMP.                                    
      *                                                                         
           05  LINE-COUNT              PIC S9(3)  VALUE +99.                    
           05  LINES-ON-PAGE           PIC S9(3)  VALUE +55.                    
           05  PAGE-COUNT              PIC S9(3)  VALUE ZERO.                   
           05  SPACE-CONTROL           PIC S9.                                  
      *                                                                         
       01  ERROR-MESSAGES.                                                      
      *                                                                         
           05  NO-PROGRAM-ID-MESSAGE.                                           
      *                                                                         
               10  FILLER    PIC X(20)   VALUE "PROGRAM-ID NOT FOUND".
               10  FILLER    PIC X(20)   VALUE " -- PROGRAM TERMINAT".
               10  FILLER    PIC X(20)   VALUE "ED.                 ".
      *                                                                         
           05  NO-PROCEDURE-DIVISION-MESSAGE.                                   
      *                                                                         
               10  FILLER    PIC X(20)   VALUE "PROCEDURE DIVISION N".
               10  FILLER    PIC X(20)   VALUE "OT FOUND -- PROGRAM ".
               10  FILLER    PIC X(20)   VALUE "TERMINATED.         ".
      *                                                                         
           05  NO-END-DECLARATIVES-MESSAGE.                                     
      *                                                                         
               10  FILLER    PIC X(20)   VALUE "END DECLARATIVES NOT".
               10  FILLER    PIC X(20)   VALUE " FOUND -- PROGRAM TE".
               10  FILLER    PIC X(20)   VALUE "RMINATED.           ".
      *                                                                         
           05  TABLE-OVERFLOW-MESSAGE-1.                                        
      *                                                                         
               10  FILLER    PIC X(20)   VALUE "PROGRAM EXCEEDS MODU".
               10  FILLER    PIC X(20)   VALUE "LE LIMIT -- LISTMODS".
               10  FILLER    PIC X(20)   VALUE " CANNOT EXECUTE.    ".          
      *                                                                         
           05  TABLE-OVERFLOW-MESSAGE-2.                                        
      *                                                                         
               10  FILLER    PIC X(20)   VALUE "PROGRAM EXCEEDS MODU".
               10  FILLER    PIC X(20)   VALUE "LE LIMIT SO ALL SUBP".
               10  FILLER    PIC X(20)   VALUE "ROGRAMS OR SORT/MERG".
               10  FILLER    PIC X(20)   VALUE "E MODULES AREN""T LIS".
               10  FILLER    PIC X(20)   VALUE "TED.                ".
      *                                                                         
           05  CALL-OVERFLOW-MESSAGE.                                           
      *                                                                         
               10  FILLER    PIC X(20)   VALUE "** CALL OVERFLOW:  O".
               10  FILLER    PIC X(20)   VALUE "NE OR MORE MODULES E".
               10  FILLER    PIC X(20)   VALUE "XCEED THE CALL LIMIT".
               10  FILLER    PIC X(20)   VALUE ".                   ".          
      *                                                                         
           05  LEVEL-OVERFLOW-MESSAGE.                                          
      *                                                                         
               10  FILLER    PIC X(20)   VALUE "** LEVEL OVERFLOW:  ".          
               10  FILLER    PIC X(20)   VALUE "PROGRAM CONTAINS OVE".
               10  FILLER    PIC X(20)   VALUE "R 25 LEVELS OF CALLS".
               10  FILLER    PIC X(20)   VALUE ", BUT ONLY 25 CAN BE".
               10  FILLER    PIC X(20)   VALUE " PRINTED.           ".          
      *                                                                         
       01  SUMMARY-HEADINGS.                                                    
      *                                                                         
           05  DECLARATIVES-HEADING       PIC X(30)                             
               VALUE "DECLARATIVES SUMMARY ---------".
           05  ERROR-MESSAGES-HEADING     PIC X(30)                             
               VALUE "ERROR MESSAGES ---------------".
           05  UNCALLED-MODULES-HEADING   PIC X(30)                             
               VALUE "UNCALLED MODULES -------------".
           05  CALLED-SUBPROGRAMS-HEADING PIC X(30)                             
               VALUE "CALLED SUBPROGRAMS -----------".
           05  PROGRAM-STATISTICS-HEADING PIC X(30)                             
               VALUE "PROGRAM STATISTICS -----------".
      *                                                                         
       01  HEADING-LINE-1.                                                      
      *                                                                         
           05  FILLER               PIC X(15)   VALUE "DATE AND TIME:".
           05  HDG1-DATE            PIC 99/99/99.
           05  FILLER               PIC XX      VALUE SPACE.
           05  HDG2-TIME-DATA.
               10  HDG2-HOURS       PIC XX.
               10  FILLER           PIC X       VALUE ":".
               10  HDG2-MINUTES     PIC XX.
               10  FILLER           PIC X       VALUE SPACE.
               10  HDG2-TIME-SUFFIX PIC X(8).
           05  FILLER               PIC X(84)   VALUE SPACE.
           05  FILLER               PIC X(6)    VALUE "PAGE:".
           05  HDG1-PAGE-NUMBER     PIC ZZ9.
      *                                                                         
       01  HEADING-LINE-2.                                                      
      *                                                                         
           05  FILLER               PIC X(15)   VALUE "PROGRAM-ID:".
           05  HDG2-PROGRAM-NAME    PIC X(30).
           05  FILLER               PIC X(87)   VALUE SPACE.
      *                                                                         
       01  SUMMARY-HEADING-LINE.                                                
      *                                                                         
           05  SHL-HEADING     PIC X(30).                                       
           05  FILLER          PIC X(20)   VALUE "--------------------".        
           05  FILLER          PIC X(20)   VALUE "--------------------".        
           05  FILLER          PIC X(20)   VALUE "--------------------".        
           05  FILLER          PIC X(20)   VALUE "--------------------".        
           05  FILLER          PIC X(20)   VALUE "--------------------".        
           05  FILLER          PIC X(2)    VALUE "--".                          
      *                                                                         
       PROCEDURE DIVISION.                                                      
      *                                                                         
       0000-PRINT-STRUCTURE-LISTING.                                            
      *                                                                         
           OPEN INPUT  SRCEFILE                                                 
                OUTPUT MODLIST.                                                 
           PERFORM 1000-GET-HEADING-DATA.                                       
           IF NOT CANCEL-PROGRAM                                                
               PERFORM 2000-LOCATE-FIRST-PROCEDURE                              
               IF NOT CANCEL-PROGRAM                                            
                   PERFORM 3000-LOAD-MODULE-NAMES                               
                   IF NOT CANCEL-PROGRAM                                        
                       PERFORM 4000-LOAD-MODULE-CALLS                           
                       PERFORM 5000-PRINT-STRUCTURE-LISTING                     
                       IF DECLARATIVES-SECTION                          DEC
                           PERFORM 6000-PRINT-DECLARATIVES              DEC
                           PERFORM 7000-PRINT-PROGRAM-SUMMARY           DEC
                       ELSE                                             DEC
                           PERFORM 7000-PRINT-PROGRAM-SUMMARY.                  
           CLOSE SRCEFILE                                                       
                 MODLIST.                                                       
           STOP RUN.                                                            
      *                                                                         
       1000-GET-HEADING-DATA.                                                   
      *                                                                         
           ACCEPT SYSTEM-DATE FROM DATE.                                        
           MOVE SYSTEM-YEAR   TO TODAYS-YEAR.                                   
           MOVE SYSTEM-MONTH  TO TODAYS-MONTH.                                  
           MOVE SYSTEM-DAY    TO TODAYS-DAY.                                    
           MOVE TODAYS-DATE   TO HDG1-DATE.                                     
      *                                                                         
           ACCEPT SYSTEM-TIME FROM TIME.                                        
           IF SYSTEM-HOUR LESS 12                                               
               MOVE "AM" TO HDG2-TIME-SUFFIX
           ELSE                                                                 
               MOVE "PM" TO HDG2-TIME-SUFFIX
               IF SYSTEM-HOUR GREATER 12                                        
                   SUBTRACT 12 FROM SYSTEM-HOUR.                                
           MOVE SYSTEM-HOUR   TO HDG2-HOURS.                                    
           MOVE SYSTEM-MINUTE TO HDG2-MINUTES.                                  
      *                                                                         
           PERFORM 1100-GET-PROGRAM-NAME
               UNTIL FOUND
                  OR CANCEL-PROGRAM.
      *                                                                         
       1100-GET-PROGRAM-NAME.                                                   
      *                                                                         
           MOVE "N" TO ACTIVE-RECORD-SW.
           PERFORM 1110-READ-SOURCE-FILE                                        
               UNTIL SRCEFILE-EOF                                               
                  OR (ACTIVE-RECORD AND A-AREA NOT = SPACE).                    
           IF NOT SRCEFILE-EOF                                                  
               PERFORM 1130-UNSTRING-SOURCE-LINE                                
               IF SOURCE-WORD (1) = "PROGRAM-ID"
                   MOVE SOURCE-WORD (2) TO HDG2-PROGRAM-NAME                    
                   MOVE "Y" TO FOUND-SW
               ELSE                                                             
                   MOVE "N" TO FOUND-SW
           ELSE                                                                 
               MOVE "Y" TO CANCEL-PROGRAM-SW
               MOVE SPACE TO HDG2-PROGRAM-NAME                                  
               MOVE NO-PROGRAM-ID-MESSAGE TO PRINT-LINE                         
               PERFORM 1180-PRINT-REPORT-LINE.                                  
      *                                                                         
       1110-READ-SOURCE-FILE.                                                   
      *                                                                         
           READ SRCEFILE                                                        
               AT END                                                           
                   MOVE "Y" TO SRCEFILE-EOF-SW.
           IF    COMMENT                                                        
              OR BLANK-LINE                                                     
               MOVE "N" TO ACTIVE-RECORD-SW
           ELSE                                                                 
               MOVE "Y" TO ACTIVE-RECORD-SW.
           IF NOT SRCEFILE-EOF                                                  
               IF COUNT-LINES                                                   
                   PERFORM 1120-ACCUMULATE-RECORD-COUNTS.                       
      *                                                                         
       1120-ACCUMULATE-RECORD-COUNTS.                                           
      *                                                                         
           ADD 1 TO TOTAL-LINE-COUNT.                                           
           IF ACTIVE-RECORD                                                     
               ADD 1 TO SOURCE-LINE-COUNT                                       
               IF PROCEDURE-DIVISION                                            
                   ADD 1 TO PD-LINE-COUNT.                                      
      *                                                                         
       1130-UNSTRING-SOURCE-LINE.                                               
      *                                                                         
           MOVE DATA-AREA TO SOURCE-LINE.                                       
           INSPECT SOURCE-LINE REPLACING ALL "," BY " ".                        
           INSPECT SOURCE-LINE REPLACING ALL "." BY " ".                        
           MOVE SPACE TO SOURCE-WORDS.                                          
           SET SOURCE-LINE-POSITION-INDEX TO 1.                                 
           SET SOURCE-WORD-INDEX TO 1.                                          
           PERFORM 1140-UNSTRING-NEXT-WORD                                      
               UNTIL SOURCE-WORD-INDEX > 8                                      
                  OR SOURCE-LINE-POSITION-INDEX > 65.                           
      *                                                                         
       1140-UNSTRING-NEXT-WORD.                                                 
      *                                                                         
           MOVE SPACE TO NEXT-SOURCE-WORD.                                      
      *                                                                         
           PERFORM 1150-FIND-NEXT-SOURCE-WORD                                   
               UNTIL SOURCE-LINE-POSITION (SOURCE-LINE-POSITION-INDEX)          
                     NOT = SPACE                                                
                  OR SOURCE-LINE-POSITION-INDEX > 65.                           
      *                                                                         
           IF SOURCE-LINE-POSITION (SOURCE-LINE-POSITION-INDEX) = quote
               IF SOURCE-WORD-INDEX NOT = 1                                     
                   SET SOURCE-WORD-INDEX DOWN BY 1                              
                   IF SOURCE-WORD (SOURCE-WORD-INDEX) = "CALL"
                       SET SOURCE-WORD-INDEX UP BY 1                            
                   ELSE                                                         
                       SET SOURCE-WORD-INDEX UP BY 1                            
                       SET SOURCE-LINE-POSITION-INDEX UP BY 1                   
                       PERFORM 1160-FIND-LITERAL-ENDING                         
                           UNTIL SOURCE-LINE-POSITION                           
                                 (SOURCE-LINE-POSITION-INDEX) = quote
                              OR SOURCE-LINE-POSITION-INDEX > 65                
                       IF SOURCE-LINE-POSITION-INDEX < 66
                           SET SOURCE-LINE-POSITION-INDEX UP BY 1.
      *                                                                         
           PERFORM 1170-BUILD-NEXT-SOURCE-WORD                                  
               VARYING SOURCE-WORD-POSITION-INDEX FROM 1 BY 1                   
                 UNTIL SOURCE-LINE-POSITION (SOURCE-LINE-POSITION-INDEX)        
                      = SPACE                                                   
                    OR SOURCE-LINE-POSITION-INDEX > 65.                         
      *                                                                         
           IF NEXT-SOURCE-WORD NOT = SPACE                                      
               MOVE NEXT-SOURCE-WORD TO SOURCE-WORD (SOURCE-WORD-INDEX)         
               SET SOURCE-WORD-COUNT TO SOURCE-WORD-INDEX                       
               SET SOURCE-WORD-INDEX UP BY 1.                                   
      *                                                                         
       1150-FIND-NEXT-SOURCE-WORD.                                              
      *                                                                         
           SET SOURCE-LINE-POSITION-INDEX UP BY 1.                              
      *                                                                         
       1160-FIND-LITERAL-ENDING.                                                
      *                                                                         
           SET SOURCE-LINE-POSITION-INDEX UP BY 1.                              
      *                                                                         
       1170-BUILD-NEXT-SOURCE-WORD.                                             
      *                                                                         
           MOVE SOURCE-LINE-POSITION (SOURCE-LINE-POSITION-INDEX)               
               TO SOURCE-WORD-POSITION (SOURCE-WORD-POSITION-INDEX).            
           SET SOURCE-LINE-POSITION-INDEX UP BY 1.                              
      *                                                                         
       1180-PRINT-REPORT-LINE.                                                  
      *                                                                         
           IF LINE-COUNT > LINES-ON-PAGE                                        
               PERFORM 1190-PRINT-HEADING-LINES                                 
               PERFORM 1210-WRITE-REPORT-LINE                                   
           ELSE                                                                 
               PERFORM 1210-WRITE-REPORT-LINE.                                  
           MOVE SPACE TO PRINT-AREA.                                            
      *                                                                         
       1190-PRINT-HEADING-LINES.                                                
      *                                                                         
           MOVE PRINT-LINE      TO PRINT-SAVE-AREA.                             
           ADD 1                TO PAGE-COUNT.                                  
           MOVE PAGE-COUNT      TO HDG1-PAGE-NUMBER.                            
           MOVE HEADING-LINE-1  TO PRINT-LINE.                                  
           PERFORM 1200-WRITE-PAGE-TOP-LINE.                                    
           MOVE 1               TO SPACE-CONTROL.                               
           MOVE HEADING-LINE-2  TO PRINT-LINE.                                  
           PERFORM 1210-WRITE-REPORT-LINE.                                      
           MOVE 2               TO SPACE-CONTROL.                               
           MOVE ZERO            TO LINE-COUNT.                                  
           MOVE PRINT-SAVE-AREA TO PRINT-LINE.                                  
      *                                                                         
       1200-WRITE-PAGE-TOP-LINE.                                                
      *                                                                         
           WRITE PRINT-AREA                                                     
               AFTER ADVANCING PAGE.                                            
      *                                                                         
       1210-WRITE-REPORT-LINE.                                                  
      *                                                                         
           WRITE PRINT-AREA                                                     
               AFTER ADVANCING SPACE-CONTROL LINES.                             
           ADD SPACE-CONTROL TO LINE-COUNT.                                     
           MOVE 1            TO SPACE-CONTROL.                                  
      *                                                                         
       2000-LOCATE-FIRST-PROCEDURE.                                             
      *                                                                         
           PERFORM 2100-LOCATE-PD-HEADER                                        
               UNTIL PROCEDURE-DIVISION                                         
                  OR CANCEL-PROGRAM.                                            
           IF NOT CANCEL-PROGRAM                                                
               PERFORM 2200-LOCATE-DECLARATIVES                                 
               IF NOT CANCEL-PROGRAM                                            
                   PERFORM 2300-LOCATE-FIRST-PROC-NAME.                         
      *                                                                         
       2100-LOCATE-PD-HEADER.                                                   
      *                                                                         
           MOVE "N" TO ACTIVE-RECORD-SW.
           PERFORM 1110-READ-SOURCE-FILE                                        
               UNTIL SRCEFILE-EOF                                               
                  OR (ACTIVE-RECORD AND A-AREA NOT = SPACE).                    
           IF NOT SRCEFILE-EOF                                                  
               PERFORM 1130-UNSTRING-SOURCE-LINE                                
               IF SOURCE-WORD (1) = "PROCEDURE"
                   MOVE TOTAL-LINE-COUNT TO FIRST-PD-RECORD-NO                  
                   MOVE "Y" TO PROCEDURE-DIVISION-SW
                   ADD 1 TO PD-LINE-COUNT                                       
               ELSE                                                             
                   MOVE "N" TO PROCEDURE-DIVISION-SW
           ELSE                                                                 
               MOVE "Y" TO CANCEL-PROGRAM-SW
               MOVE NO-PROCEDURE-DIVISION-MESSAGE TO PRINT-LINE                 
               PERFORM 1180-PRINT-REPORT-LINE.                                  
      *                                                                         
       2200-LOCATE-DECLARATIVES.                                                
      *                                                                         
           MOVE "N" TO ACTIVE-RECORD-SW.
           PERFORM 1110-READ-SOURCE-FILE                                        
               UNTIL SRCEFILE-EOF                                               
                  OR (ACTIVE-RECORD AND A-AREA NOT = SPACE).                    
           PERFORM 1130-UNSTRING-SOURCE-LINE.                                   
           IF SOURCE-WORD (1) = "DECLARATIVES"
               MOVE TOTAL-LINE-COUNT TO FIRST-DECLARATIVE-RECORD-NO             
               MOVE "Y" TO DECLARATIVES-SECTION-SW
           ELSE                                                                 
               MOVE "N" TO DECLARATIVES-SECTION-SW.
           IF DECLARATIVES-SECTION                                              
               PERFORM 2210-LOCATE-END-DECLARATIVES                             
                   UNTIL END-DECLARATIVES                                       
                      OR CANCEL-PROGRAM.                                        
      *                                                                         
       2210-LOCATE-END-DECLARATIVES.                                            
      *                                                                         
           MOVE "N" TO ACTIVE-RECORD-SW.
           PERFORM 1110-READ-SOURCE-FILE                                        
               UNTIL SRCEFILE-EOF                                               
                  OR (ACTIVE-RECORD AND A-AREA NOT = SPACE).                    
           PERFORM 1130-UNSTRING-SOURCE-LINE.                                   
           IF SRCEFILE-EOF                                                      
               MOVE "Y" TO CANCEL-PROGRAM-SW
               MOVE NO-END-DECLARATIVES-MESSAGE TO PRINT-LINE                   
               PERFORM 1180-PRINT-REPORT-LINE                                   
           ELSE                                                                 
               IF SOURCE-WORD (1) = "END"
                    MOVE TOTAL-LINE-COUNT TO LAST-DECLARATIVE-RECORD-NO         
                    MOVE "Y" TO END-DECLARATIVES-SW.
      *                                                                         
       2300-LOCATE-FIRST-PROC-NAME.                                             
      *                                                                         
           IF DECLARATIVES-SECTION                                              
               MOVE "N" TO ACTIVE-RECORD-SW
               PERFORM 1110-READ-SOURCE-FILE                                    
                   UNTIL SRCEFILE-EOF                                           
                      OR (ACTIVE-RECORD AND A-AREA NOT = SPACE).                
           IF NOT SRCEFILE-EOF                                                  
               MOVE TOTAL-LINE-COUNT TO FIRST-PROC-NAME-RECORD-NO.              
      *                                                                         
       3000-LOAD-MODULE-NAMES.                                                  
      *                                                                         
           PERFORM 3100-CLEAR-MODULE-TABLE                                      
               VARYING MODULE-INDEX FROM 1 BY 1                                 
               UNTIL MODULE-INDEX > MODULE-LIMIT.                               
           SET MODULE-INDEX TO 1.                                               
           PERFORM 3200-LOAD-MODULE-NAME                                        
               UNTIL SRCEFILE-EOF                                               
                  OR TABLE-OVERFLOW.                                            
           IF TABLE-OVERFLOW                                                    
               MOVE "Y" TO CANCEL-PROGRAM-SW
               MOVE TABLE-OVERFLOW-MESSAGE-1 TO PRINT-LINE                      
               PERFORM 1180-PRINT-REPORT-LINE                                   
           ELSE                                                                 
               SET MODULE-INDEX DOWN BY 1                                       
               SET MODULE-COUNT TO MODULE-INDEX.                                
      *                                                                         
       3100-CLEAR-MODULE-TABLE.                                                 
      *                                                                         
           MOVE ZERO  TO MODULE-NUMBER (MODULE-INDEX).                          
           MOVE SPACE TO FULL-MODULE-NAME (MODULE-INDEX)                        
                         MODULE-TYPE-FLAG (MODULE-INDEX).                       
           MOVE "N"   TO CALL-OVERFLOW-SW (MODULE-INDEX)
                         MODULE-PRINTED-SW (MODULE-INDEX).                      
           MOVE ZERO  TO TIMES-CALLED (MODULE-INDEX).                           
           MOVE ZERO  TO MODULE-CALL-COUNT (MODULE-INDEX).                      
           PERFORM 3110-CLEAR-MODULE-CALLS                                      
               VARYING CALL-INDEX FROM 1 BY 1                                   
               UNTIL CALL-INDEX > CALL-LIMIT.                                   
      *                                                                         
       3110-CLEAR-MODULE-CALLS.                                                 
      *                                                                         
           MOVE ZERO                                                            
               TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).                     
      *                                                                         
       3200-LOAD-MODULE-NAME.                                                   
      *                                                                         
           MOVE "N" TO ACTIVE-RECORD-SW.
           IF FIRST-MODULE-NAME                                                 
               MOVE "N" TO FIRST-MODULE-NAME-SW
           ELSE                                                                 
               PERFORM 1110-READ-SOURCE-FILE                                    
                   UNTIL SRCEFILE-EOF                                           
                      OR (ACTIVE-RECORD AND A-AREA NOT = SPACE).                
           IF NOT SRCEFILE-EOF                                                  
               IF PARAGRAPH-MODULES                                             
                   IF MODULE-INDEX NOT > MODULE-LIMIT                           
                      PERFORM 1130-UNSTRING-SOURCE-LINE                         
                      SET MODULE-NUMBER (MODULE-INDEX) TO MODULE-INDEX          
                      MOVE SOURCE-WORD (1) TO MODULE-NAME (MODULE-INDEX)        
                      ADD 1 TO COBOL-MODULE-COUNT                               
                      IF SOURCE-WORD (2) = "SECTION"
                          MOVE "X" TO MODULE-TYPE-FLAG (MODULE-INDEX)
                          ADD 1 TO COBOL-SECTION-COUNT                          
                          SET MODULE-INDEX UP BY 1                              
                      ELSE                                                      
                          MOVE "P" TO MODULE-TYPE-FLAG (MODULE-INDEX)
                          ADD 1 TO COBOL-PARAGRAPH-COUNT                        
                          SET MODULE-INDEX UP BY 1                              
                   ELSE                                                         
                       MOVE "Y" TO TABLE-OVERFLOW-SW.
           IF NOT SRCEFILE-EOF                                                  
               IF SECTION-MODULES                                               
                   PERFORM 1130-UNSTRING-SOURCE-LINE                            
                   IF SOURCE-WORD (2) = "SECTION"
                       IF MODULE-INDEX NOT > MODULE-LIMIT                       
                           MOVE "X" TO MODULE-TYPE-FLAG (MODULE-INDEX)
                           SET MODULE-NUMBER (MODULE-INDEX)                     
                               TO MODULE-INDEX                                  
                           MOVE SOURCE-WORD (1)                                 
                               TO MODULE-NAME (MODULE-INDEX)                    
                           ADD 1 TO COBOL-SECTION-COUNT                         
                           ADD 1 TO COBOL-MODULE-COUNT                          
                           SET MODULE-INDEX UP BY 1                             
                       ELSE                                                     
                           MOVE "Y" TO TABLE-OVERFLOW-SW
                   ELSE                                                         
                       ADD 1 TO COBOL-PARAGRAPH-COUNT.                          
      *                                                                         
       4000-LOAD-MODULE-CALLS.                                                  
      *                                                                         
           MOVE "N" TO COUNT-LINES-SW.
           MOVE "N" TO SRCEFILE-EOF-SW.
           PERFORM 4100-RESTART-PROC-DIVISION.                                  
           PERFORM 4200-LOAD-CALLS-FOR-ONE-MODULE                               
               VARYING MODULE-INDEX FROM 1 BY 1                                 
               UNTIL MODULE-INDEX > MODULE-COUNT.                               
           PERFORM 4800-COUNT-MODULE-CALLS.                                     
      *                                                                         
       4100-RESTART-PROC-DIVISION.                                              
      *                                                                         
           CLOSE SRCEFILE.                                                      
           OPEN INPUT SRCEFILE.                                                 
           PERFORM 1110-READ-SOURCE-FILE                                        
               VARYING RESTART-COUNT FROM 1 BY 1                                
               UNTIL RESTART-COUNT > FIRST-PROC-NAME-RECORD-NO.                 
      *                                                                         
       4200-LOAD-CALLS-FOR-ONE-MODULE.                                          
      *                                                                         
           MOVE "N" TO NEXT-PROCEDURE-NAME-SW.
           SET CALL-INDEX TO 1.                                                 
           PERFORM 4210-LOAD-ONE-MODULE-CALL                                    
               UNTIL SRCEFILE-EOF                                               
                  OR NEXT-PROCEDURE-NAME.                                       
      *                                                                         
       4210-LOAD-ONE-MODULE-CALL.                                               
      *                                                                         
           MOVE "N" TO ACTIVE-RECORD-SW.
           PERFORM 1110-READ-SOURCE-FILE                                        
               UNTIL SRCEFILE-EOF                                               
                  OR ACTIVE-RECORD.                                             
           IF NOT SRCEFILE-EOF                                                  
               PERFORM 1130-UNSTRING-SOURCE-LINE                                
               IF A-AREA = SPACE                                                
                   MOVE "N" TO PERFORM-FOUND-SW
                   MOVE "N" TO CALL-FOUND-SW
                   MOVE "N" TO SORT-FOUND-SW
                   MOVE "N" TO MERGE-FOUND-SW
                   MOVE "N" TO INPUT-PROCEDURE-FOUND-SW
                   MOVE "N" TO OUTPUT-PROCEDURE-FOUND-SW
                   MOVE "N" TO GOTO-FOUND-SW
                   PERFORM 4220-SEARCH-FOR-CALLING-VERB                         
                       VARYING SOURCE-WORD-INDEX FROM 1 BY 1                    
                       UNTIL SOURCE-WORD-INDEX > SOURCE-WORD-COUNT              
                          OR PERFORM-FOUND                                      
                          OR CALL-FOUND                                         
                          OR SORT-FOUND                                         
                          OR MERGE-FOUND                                        
                          OR INPUT-PROCEDURE-FOUND                              
                          OR OUTPUT-PROCEDURE-FOUND                             
                          OR GOTO-FOUND                                         
               ELSE                                                             
                   IF PARAGRAPH-MODULES                                         
                       MOVE "Y" TO NEXT-PROCEDURE-NAME-SW
                   ELSE                                                         
                       IF SOURCE-WORD (2) = "SECTION"
                           MOVE "Y" TO NEXT-PROCEDURE-NAME-SW.
           IF NOT SRCEFILE-EOF                                                  
               IF A-AREA = SPACE                                                
                   IF PERFORM-FOUND                                             
                       PERFORM 4300-LOAD-PERFORMED-PROCEDURE                    
                   ELSE IF CALL-FOUND                                           
                       PERFORM 4400-LOAD-CALLED-PROCEDURE                       
                   ELSE IF SORT-FOUND                                           
                       PERFORM 4500-LOAD-SORT-MERGE-PROCEDURE                   
                   ELSE IF MERGE-FOUND                                          
                       PERFORM 4500-LOAD-SORT-MERGE-PROCEDURE                   
                   ELSE IF INPUT-PROCEDURE-FOUND                                
                       PERFORM 4600-LOAD-INPUT-PROCEDURE                        
                   ELSE IF OUTPUT-PROCEDURE-FOUND                               
                       PERFORM 4700-LOAD-OUTPUT-PROCEDURE.                      
      *                                                                         
       4220-SEARCH-FOR-CALLING-VERB.                                            
      *                                                                         
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "PERFORM"
               ADD 1 TO PERFORM-COUNT                                           
               MOVE "Y" TO PERFORM-FOUND-SW.
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "CALL"
               ADD 1 TO CALL-COUNT                                              
               MOVE "Y" TO CALL-FOUND-SW.
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "SORT"
               ADD 1 TO SORT-COUNT                                              
               MOVE "Y" TO SORT-FOUND-SW.
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "MERGE"
               ADD 1 TO MERGE-COUNT                                             
               MOVE "Y" TO MERGE-FOUND-SW.
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "GO"
               ADD 1 TO GOTO-COUNT                                              
               MOVE "Y" TO GOTO-FOUND-SW.
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "INPUT"
               SET SOURCE-WORD-INDEX UP BY 1                                    
               IF SOURCE-WORD (SOURCE-WORD-INDEX) = "PROCEDURE"
                   MOVE "Y" TO INPUT-PROCEDURE-FOUND-SW
                   ADD 1 TO SORT-MERGE-PROCEDURE-COUNT                          
               ELSE                                                             
                   SET SOURCE-WORD-INDEX DOWN BY 1.                             
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "OUTPUT"
               SET SOURCE-WORD-INDEX UP BY 1                                    
                   IF SOURCE-WORD (SOURCE-WORD-INDEX) = "PROCEDURE"
                       MOVE "Y" TO OUTPUT-PROCEDURE-FOUND-SW
                       ADD 1 TO SORT-MERGE-PROCEDURE-COUNT                      
                   ELSE                                                         
                       SET SOURCE-WORD-INDEX DOWN BY 1.                         
      *                                                                         
       4300-LOAD-PERFORMED-PROCEDURE.                                           
      *                                                                         
           IF SOURCE-WORD (SOURCE-WORD-INDEX) NOT = SPACE
               MOVE SOURCE-WORD (SOURCE-WORD-INDEX) TO CALLED-PROC-NAME
               PERFORM 4310-SEARCH-FOR-CALLED-MODULE
               IF FOUND
                   PERFORM 4320-SEARCH-FOR-DUPLICATE-CALL
                   IF NOT DUPLICATE-CALL
                       IF CALL-INDEX NOT > CALL-LIMIT
                           MOVE CALLED-PROC-NUMBER
                           TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX)          
                           ADD 1 TO MODULE-CALL-COUNT (MODULE-INDEX)
                           SET CALL-INDEX UP BY 1
                       ELSE
                           MOVE "Y" TO MODULE-CALL-OVERFLOW-SW
                           MOVE "Y" TO CALL-OVERFLOW-SW (MODULE-INDEX)
                       END-IF
                   END-IF
               ELSE
                   ADD 1 TO INLINE-PERFORM-COUNT
               END-IF
           ELSE
      *    IF SOURCE-WORD (SOURCE-WORD-INDEX) = SPACE
               ADD 1 TO INLINE-PERFORM-COUNT.
      *                                                                         
       4310-SEARCH-FOR-CALLED-MODULE.                                           
      *                                                                         
           SET INDEX-SAVE-AREA TO MODULE-INDEX.                                 
           SET MODULE-INDEX TO 1.                                               
           SEARCH MODULE-ENTRY                                                  
               WHEN MODULE-NAME (MODULE-INDEX) = CALLED-PROC-NAME               
                   SET CALLED-PROC-NUMBER TO MODULE-INDEX                       
                   MOVE "Y" TO FOUND-SW
               WHEN MODULE-INDEX = MODULE-COUNT                                 
                   MOVE "N" TO FOUND-SW.
           SET MODULE-INDEX TO INDEX-SAVE-AREA.                                 
      *                                                                         
       4320-SEARCH-FOR-DUPLICATE-CALL.                                          
      *                                                                         
           SET INDEX-SAVE-AREA TO CALL-INDEX.                                   
           MOVE "N" TO DUPLICATE-CALL-SW.
           PERFORM 4330-SEARCH-CALL-AREA                                        
               VARYING CALL-INDEX FROM 1 BY 1                                   
               UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)              
                  OR DUPLICATE-CALL.                                            
           SET CALL-INDEX TO INDEX-SAVE-AREA.                                   
      *                                                                         
       4330-SEARCH-CALL-AREA.                                                   
      *                                                                         
           IF CALLED-MODULE (MODULE-INDEX, CALL-INDEX)                          
                   = CALLED-PROC-NUMBER                                         
               MOVE "Y" TO DUPLICATE-CALL-SW.
      *                                                                         
       4400-LOAD-CALLED-PROCEDURE.                                              
      *                                                                         
           MOVE SOURCE-WORD (SOURCE-WORD-INDEX) TO CALLED-PROC-NAME.            
           PERFORM 4310-SEARCH-FOR-CALLED-MODULE.                               
           IF FOUND                                                             
               PERFORM 4320-SEARCH-FOR-DUPLICATE-CALL                           
               IF NOT DUPLICATE-CALL                                            
                   IF CALL-INDEX NOT > CALL-LIMIT                               
                       MOVE CALLED-PROC-NUMBER                                  
                           TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX)          
                       ADD 1 TO MODULE-CALL-COUNT (MODULE-INDEX)                
                       SET CALL-INDEX UP BY 1                                   
                   ELSE                                                         
                       MOVE "Y" TO MODULE-CALL-OVERFLOW-SW
                       MOVE "Y" TO CALL-OVERFLOW-SW (MODULE-INDEX).
           IF NOT FOUND                                                         
               PERFORM 4410-LOAD-SUBPROGRAM-MODULE                              
               IF NOT TABLE-OVERFLOW                                            
                   IF CALL-INDEX NOT > CALL-LIMIT                               
                       MOVE CALLED-PROC-NUMBER                                  
                           TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX)          
                       ADD 1 TO MODULE-CALL-COUNT (MODULE-INDEX)                
                       SET CALL-INDEX UP BY 1                                   
                   ELSE                                                         
                       MOVE "Y" TO MODULE-CALL-OVERFLOW-SW
                       MOVE "Y" TO CALL-OVERFLOW-SW (MODULE-INDEX).
      *                                                                         
       4410-LOAD-SUBPROGRAM-MODULE.                                             
      *                                                                         
           SET INDEX-SAVE-AREA TO MODULE-INDEX.                                 
           SET MODULE-INDEX TO MODULE-COUNT.                                    
           SET MODULE-INDEX UP BY 1.                                            
           IF MODULE-INDEX NOT > MODULE-LIMIT                                   
               SET MODULE-NUMBER (MODULE-INDEX) TO MODULE-INDEX                 
               MOVE CALLED-PROC-NAME TO MODULE-NAME (MODULE-INDEX)              
               MOVE "S" TO MODULE-TYPE-FLAG (MODULE-INDEX)
               SET CALLED-PROC-NUMBER TO MODULE-INDEX                           
               SET MODULE-COUNT TO MODULE-INDEX                                 
               MOVE "Y" TO PRINT-CALLED-SUBPROGRAMS-SW
               ADD 1 TO SUBPROGRAM-COUNT                                        
           ELSE                                                                 
               MOVE "Y" TO TABLE-OVERFLOW-SW.
           SET MODULE-INDEX TO INDEX-SAVE-AREA.                                 
      *                                                                         
       4500-LOAD-SORT-MERGE-PROCEDURE.                                          
      *                                                                         
           IF SORT-FOUND                                                        
               MOVE "(SORT)" TO CALLED-PROC-NAME                                
           ELSE                                                                 
               MOVE "(MERGE)" TO CALLED-PROC-NAME.                              
           PERFORM 4310-SEARCH-FOR-CALLED-MODULE.                               
           IF FOUND                                                             
               PERFORM 4320-SEARCH-FOR-DUPLICATE-CALL                           
               IF NOT DUPLICATE-CALL                                            
                   IF CALL-INDEX NOT > CALL-LIMIT                               
                       MOVE CALLED-PROC-NUMBER                                  
                           TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX)          
                       ADD 1 TO MODULE-CALL-COUNT (MODULE-INDEX)                
                       SET CALL-INDEX UP BY 1                                   
                   ELSE                                                         
                       MOVE "Y" TO MODULE-CALL-OVERFLOW-SW
                       MOVE "Y" TO CALL-OVERFLOW-SW (MODULE-INDEX).
           IF NOT FOUND                                                         
               PERFORM 4510-LOAD-SORT-MERGE-MODULE                              
               IF NOT TABLE-OVERFLOW                                            
                   IF CALL-INDEX NOT > CALL-LIMIT                               
                       MOVE CALLED-PROC-NUMBER                                  
                           TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX)          
                       ADD 1 TO MODULE-CALL-COUNT (MODULE-INDEX)                
                       SET CALL-INDEX UP BY 1                                   
                   ELSE                                                         
                       MOVE "Y" TO MODULE-CALL-OVERFLOW-SW
                       MOVE "Y" TO CALL-OVERFLOW-SW (MODULE-INDEX).
      *                                                                         
       4510-LOAD-SORT-MERGE-MODULE.                                             
      *                                                                         
           SET INDEX-SAVE-AREA TO MODULE-INDEX.                                 
           SET MODULE-INDEX TO MODULE-COUNT.                                    
           SET MODULE-INDEX UP BY 1.                                            
           IF MODULE-INDEX NOT > MODULE-LIMIT                                   
               SET MODULE-NUMBER (MODULE-INDEX) TO MODULE-INDEX                 
               MOVE CALLED-PROC-NAME TO MODULE-NAME (MODULE-INDEX)              
               MOVE "T" TO MODULE-TYPE-FLAG (MODULE-INDEX)
               SET CALLED-PROC-NUMBER TO MODULE-INDEX                           
               SET MODULE-COUNT TO MODULE-INDEX                                 
           ELSE                                                                 
               MOVE "Y" TO TABLE-OVERFLOW-SW.
           SET MODULE-INDEX TO INDEX-SAVE-AREA.                                 
      *                                                                         
       4600-LOAD-INPUT-PROCEDURE.                                               
      *                                                                         
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "IS"
               SET SOURCE-WORD-INDEX UP BY 1.                                   
           MOVE SOURCE-WORD (SOURCE-WORD-INDEX) TO CALLED-PROC-NAME.            
           PERFORM 4310-SEARCH-FOR-CALLED-MODULE.                               
           IF FOUND                                                             
               PERFORM 4320-SEARCH-FOR-DUPLICATE-CALL                           
               IF NOT DUPLICATE-CALL                                            
                   IF CALL-INDEX > CALL-LIMIT                                   
                       MOVE "Y" TO MODULE-CALL-OVERFLOW-SW
                       MOVE "Y" TO CALL-OVERFLOW-SW (MODULE-INDEX)
                   ELSE                                                         
                       MOVE CALLED-PROC-NUMBER                                  
                           TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX)          
                       ADD 1 TO MODULE-CALL-COUNT (MODULE-INDEX)                
                       IF CALL-INDEX > 1                                        
                           PERFORM 4610-SWITCH-LAST-TWO-CALLS                   
                           SET CALL-INDEX UP BY 1                               
                       ELSE                                                     
                           SET CALL-INDEX UP BY 1.                              
      *                                                                         
       4610-SWITCH-LAST-TWO-CALLS.                                              
      *                                                                         
           MOVE CALLED-MODULE (MODULE-INDEX, CALL-INDEX)                        
               TO CALLED-MODULE-SAVE-AREA.                                      
           MOVE CALLED-MODULE (MODULE-INDEX, CALL-INDEX - 1)                    
               TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).                     
           MOVE CALLED-MODULE-SAVE-AREA                                         
               TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX - 1).                 
      *                                                                         
       4700-LOAD-OUTPUT-PROCEDURE.                                              
      *                                                                         
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "IS"
               SET SOURCE-WORD-INDEX UP BY 1.                                   
           MOVE SOURCE-WORD (SOURCE-WORD-INDEX) TO CALLED-PROC-NAME.            
           PERFORM 4310-SEARCH-FOR-CALLED-MODULE.                               
           IF FOUND                                                             
               PERFORM 4320-SEARCH-FOR-DUPLICATE-CALL                           
               IF NOT DUPLICATE-CALL                                            
                   IF CALL-INDEX NOT > CALL-LIMIT                               
                       MOVE CALLED-PROC-NUMBER                                  
                           TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX)          
                       ADD 1 TO MODULE-CALL-COUNT (MODULE-INDEX)                
                       SET CALL-INDEX UP BY 1                                   
                   ELSE                                                         
                       MOVE "Y" TO MODULE-CALL-OVERFLOW-SW
                       MOVE "Y" TO CALL-OVERFLOW-SW (MODULE-INDEX).
      *                                                                         
       4800-COUNT-MODULE-CALLS.                                                 
      *                                                                         
           PERFORM 4810-COUNT-CALLS-FROM-1-MODULE                               
               VARYING MODULE-INDEX FROM 1 BY 1                                 
               UNTIL MODULE-INDEX > MODULE-COUNT.                               
           IF MODULE-CALL-COUNT (1) > ZERO                                      
               MOVE 1 TO TIMES-CALLED (1)                                       
           ELSE                                                                 
               MOVE 1 TO TIMES-CALLED (2).                                      
           PERFORM 4830-SET-CALLING-FLAGS                                       
               VARYING MODULE-INDEX FROM 1 BY 1                                 
               UNTIL MODULE-INDEX > MODULE-COUNT.                               
      *                                                                         
       4810-COUNT-CALLS-FROM-1-MODULE.                                          
      *                                                                         
           PERFORM 4820-SEARCH-MODULE-ENTRIES                                   
               VARYING CALL-INDEX FROM 1 BY 1                                   
               UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX).             
      *                                                                         
       4820-SEARCH-MODULE-ENTRIES.                                              
      *                                                                         
           SET INDEX-SAVE-AREA TO MODULE-INDEX.                                 
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           ADD 1 TO TIMES-CALLED (MODULE-INDEX).                                
           SET MODULE-INDEX TO INDEX-SAVE-AREA.                                 
      *                                                                         
       4830-SET-CALLING-FLAGS.                                                  
      *                                                                         
           IF TIMES-CALLED (MODULE-INDEX) > 1                                   
               MOVE "C" TO COMMON-MODULE-FLAG (MODULE-INDEX).
           IF TIMES-CALLED (MODULE-INDEX) = ZERO                                
               MOVE "Y" TO PRINT-UNCALLED-MODULES-SW.
      *                                                                         
       5000-PRINT-STRUCTURE-LISTING.                                            
      *                                                                         
           SET MODULE-INDEX TO 1.                                               
           MOVE SPACE TO PRINT-LINE.                                            
           PERFORM 5001-PRINT-LEVEL-1.                                          
           PERFORM 5002-PRINT-LEVEL-2                                           
               VARYING CALL-INDEX FROM 1 BY 1                                   
               UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX).             
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE CALL-OVERFLOW-MESSAGE TO PL2-NAME                           
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           MOVE "*" TO PL1-ASTERISK.                                    AST
           PERFORM 1180-PRINT-REPORT-LINE.                              AST
      *                                                                         
       5001-PRINT-LEVEL-1.                                                      
      *                                                                         
           MOVE "*" TO  PL1-ASTERISK.                                   AST
           PERFORM 1180-PRINT-REPORT-LINE.                              AST
           IF     MODULE-CALL-COUNT (MODULE-INDEX) = ZERO                       
              AND PROGRAM-SECTION (MODULE-INDEX)                                
               SET MODULE-INDEX UP BY 1.                                        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL1-NAME.                    
           PERFORM 1180-PRINT-REPORT-LINE.                                      
      *                                                                         
       5002-PRINT-LEVEL-2.                                                      
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL1-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-1 TO MODULE-INDEX.                        
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL2-NAME.                    
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-1 TO CALL-INDEX                         
               PERFORM 5003-PRINT-LEVEL-3                                       
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-1.                        
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL3-NAME                           
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-1.                        
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL2-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5003-PRINT-LEVEL-3.                                                      
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL2-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-2 TO MODULE-INDEX.                        
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL3-NAME.                    
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-2 TO CALL-INDEX                         
               PERFORM 5004-PRINT-LEVEL-4                                       
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-2.                        
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL4-NAME                           
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-2.                        
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL3-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5004-PRINT-LEVEL-4.                                                      
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL3-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-3 TO MODULE-INDEX.                        
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL4-NAME.                    
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-3 TO CALL-INDEX                         
               PERFORM 5005-PRINT-LEVEL-5                                       
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-3.                        
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL5-NAME                           
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-3.                        
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL4-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5005-PRINT-LEVEL-5.                                                      
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL4-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-4 TO MODULE-INDEX.                        
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL5-NAME.                    
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-4 TO CALL-INDEX                         
               PERFORM 5006-PRINT-LEVEL-6                                       
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-4.                        
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL6-NAME                           
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-4.                        
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL5-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5006-PRINT-LEVEL-6.                                                      
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL5-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-5 TO MODULE-INDEX.                        
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL6-NAME.                    
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-5 TO CALL-INDEX                         
               PERFORM 5007-PRINT-LEVEL-7                                       
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-5.                        
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL7-NAME                           
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-5.                        
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL6-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5007-PRINT-LEVEL-7.                                                      
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL6-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-6 TO MODULE-INDEX.                        
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL7-NAME.                    
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-6 TO CALL-INDEX                         
               PERFORM 5008-PRINT-LEVEL-8                                       
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-6.                        
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL8-NAME                           
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-6.                        
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL7-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5008-PRINT-LEVEL-8.                                                      
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL7-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-7 TO MODULE-INDEX.                        
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL8-NAME.                    
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-7 TO CALL-INDEX                         
               PERFORM 5009-PRINT-LEVEL-9                                       
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-7.                        
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL9-NAME                           
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-7.                        
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL8-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5009-PRINT-LEVEL-9.                                                      
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL8-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-8 TO MODULE-INDEX.                        
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL9-NAME.                    
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-8 TO CALL-INDEX                         
               PERFORM 5010-PRINT-LEVEL-10                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-8.                        
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL10-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-8.                        
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL9-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5010-PRINT-LEVEL-10.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL9-ASTERISK                                 AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-9 TO MODULE-INDEX.                        
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL10-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-9 TO CALL-INDEX                         
               PERFORM 5011-PRINT-LEVEL-11                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-9.                        
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL11-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-9.                        
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL10-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5011-PRINT-LEVEL-11.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL10-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-10 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL11-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-10 TO CALL-INDEX                        
               PERFORM 5012-PRINT-LEVEL-12                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-10.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL12-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-10.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL11-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5012-PRINT-LEVEL-12.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL11-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-11 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL12-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-11 TO CALL-INDEX                        
               PERFORM 5013-PRINT-LEVEL-13                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-11.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL13-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-11.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL12-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5013-PRINT-LEVEL-13.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL12-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-12 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL13-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-12 TO CALL-INDEX                        
               PERFORM 5014-PRINT-LEVEL-14                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-12.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL14-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-12.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL13-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5014-PRINT-LEVEL-14.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL13-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-13 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL14-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-13 TO CALL-INDEX                        
               PERFORM 5015-PRINT-LEVEL-15                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-13.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL15-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-13.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL14-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5015-PRINT-LEVEL-15.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL14-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-14 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL15-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-14 TO CALL-INDEX                        
               PERFORM 5016-PRINT-LEVEL-16                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-14.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL16-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-14.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL15-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5016-PRINT-LEVEL-16.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL15-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-15 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL16-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-15 TO CALL-INDEX                        
               PERFORM 5017-PRINT-LEVEL-17                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-15.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL17-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-15.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL16-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5017-PRINT-LEVEL-17.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL16-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-16 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL17-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-16 TO CALL-INDEX                        
               PERFORM 5018-PRINT-LEVEL-18                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-16.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL18-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-16.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL17-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5018-PRINT-LEVEL-18.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL17-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-17 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL18-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-17 TO CALL-INDEX                        
               PERFORM 5019-PRINT-LEVEL-19                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-17.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL19-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-17.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL18-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5019-PRINT-LEVEL-19.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL18-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-18 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL19-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-18 TO CALL-INDEX                        
               PERFORM 5020-PRINT-LEVEL-20                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-18.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL20-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-18.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL19-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5020-PRINT-LEVEL-20.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL19-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-19 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL20-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-19 TO CALL-INDEX                        
               PERFORM 5021-PRINT-LEVEL-21                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-19.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL21-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-19.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL20-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5021-PRINT-LEVEL-21.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL20-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-20 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL21-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-20 TO CALL-INDEX                        
               PERFORM 5022-PRINT-LEVEL-22                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-20.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL22-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-20.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL21-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5022-PRINT-LEVEL-22.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL21-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-21 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL22-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-21 TO CALL-INDEX                        
               PERFORM 5023-PRINT-LEVEL-23                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-21.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL23-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-21.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL22-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5023-PRINT-LEVEL-23.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL22-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-22 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL23-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-22 TO CALL-INDEX                        
               PERFORM 5024-PRINT-LEVEL-24                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-22.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL24-NAME                          
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-22.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL23-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5024-PRINT-LEVEL-24.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL23-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           MOVE ZERO TO NUMBER-OF-CALLS.                                        
           SET MODULE-INDEX-SAVE-AREA-23 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL24-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF NOT COMMON-MODULE (MODULE-INDEX)                                  
               OR (COMMON-MODULE (MODULE-INDEX)                                 
                   AND NOT MODULE-PRINTED (MODULE-INDEX))                       
               MOVE "Y" TO MODULE-PRINTED-SW (MODULE-INDEX)
               SET CALL-INDEX-SAVE-AREA-23 TO CALL-INDEX                        
               PERFORM 5025-PRINT-LEVEL-25                                      
                   VARYING CALL-INDEX FROM 1 BY 1                               
                   UNTIL CALL-INDEX > MODULE-CALL-COUNT (MODULE-INDEX)          
               SET NUMBER-OF-CALLS TO CALL-INDEX                                
               SET CALL-INDEX TO CALL-INDEX-SAVE-AREA-23.                       
           IF CALL-OVERFLOW-SW (MODULE-INDEX) = "Y"
               MOVE "** CALL OVERFLOW **" TO PL5-NAME                           
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-23.                       
           IF NUMBER-OF-CALLS > 1                                       AST
               MOVE "*" TO PL24-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
      *                                                                         
       5025-PRINT-LEVEL-25.                                                     
      *                                                                         
           IF CALL-INDEX = 1                                            AST
               MOVE "*" TO PL24-ASTERISK                                AST
               PERFORM 1180-PRINT-REPORT-LINE.                          AST
           SET MODULE-INDEX-SAVE-AREA-24 TO MODULE-INDEX.                       
           SET MODULE-INDEX TO CALLED-MODULE (MODULE-INDEX, CALL-INDEX).        
           MOVE FULL-MODULE-NAME (MODULE-INDEX) TO PL25-NAME.                   
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           IF     (MODULE-CALL-COUNT (MODULE-INDEX) NOT = ZERO)                 
              AND (NOT MODULE-PRINTED (MODULE-INDEX))                           
               MOVE "** LEVEL OVERFLOW **" TO PL25-NAME                         
               PERFORM 1180-PRINT-REPORT-LINE                                   
               MOVE "Y" TO LEVEL-OVERFLOW-SW.
           SET MODULE-INDEX TO MODULE-INDEX-SAVE-AREA-24.                       
      *                                                                         
       6000-PRINT-DECLARATIVES.                                         DEC
      *                                                                 DEC
           MOVE 99 TO LINE-COUNT.                                       DEC
           MOVE "N" TO SRCEFILE-EOF-SW.                                 DEC
           PERFORM 6100-RESTART-DECLARATIVES.                           DEC
           MOVE DECLARATIVES-HEADING TO SHL-HEADING.                    DEC
           MOVE SUMMARY-HEADING-LINE TO PRINT-LINE.                     DEC
           MOVE 2 TO SPACE-CONTROL.                                     DEC
           PERFORM 1180-PRINT-REPORT-LINE.                              DEC
           MOVE 2 TO SPACE-CONTROL.                                     DEC
           PERFORM 6200-PRINT-DECLARATIVE-LINE                          DEC
               VARYING RESTART-COUNT                                    DEC
                   FROM FIRST-DECLARATIVE-RECORD-NO BY 1                DEC
               UNTIL RESTART-COUNT > LAST-DECLARATIVE-RECORD-NO.        DEC
      *                                                                 DEC
       6100-RESTART-DECLARATIVES.                                       DEC
      *                                                                 DEC
           CLOSE SRCEFILE.                                              DEC
           OPEN INPUT SRCEFILE.                                         DEC
           PERFORM 1110-READ-SOURCE-FILE                                DEC 
               VARYING RESTART-COUNT FROM 1 BY 1                        DEC 
               UNTIL RESTART-COUNT > FIRST-DECLARATIVE-RECORD-NO.       DEC 
      *                                                                 DEC 
       6200-PRINT-DECLARATIVE-LINE.                                     DEC 
      *                                                                 DEC 
           PERFORM 1110-READ-SOURCE-FILE.                               DEC 
      *                                                                 DEC 
           IF ACTIVE-RECORD                                             DEC 
               IF A-AREA NOT = SPACE                                    DEC 
                   PERFORM 1130-UNSTRING-SOURCE-LINE                    DEC 
                   IF SOURCE-WORD (2) = "SECTION"                       DEC
                       MOVE "*" TO PL1-ASTERISK                         DEC 
                       PERFORM 1180-PRINT-REPORT-LINE                   DEC 
                       MOVE DATA-AREA TO DL-CODE                        DEC 
                       PERFORM 1180-PRINT-REPORT-LINE                   DEC 
                       MOVE "*" TO PL1-ASTERISK                         DEC 
                       PERFORM 1180-PRINT-REPORT-LINE.                  DEC 
      *                                                                 DEC 
           IF ACTIVE-RECORD                                             DEC 
               IF A-AREA = SPACE                                        DEC 
                   IF NOT USE-STATEMENT                                 DEC 
                       PERFORM 1130-UNSTRING-SOURCE-LINE                DEC 
                       PERFORM 6210-SEARCH-FOR-USE-VERB                 DEC 
                           VARYING SOURCE-WORD-INDEX FROM 1 BY 1        DEC 
                           UNTIL SOURCE-WORD-INDEX > SOURCE-WORD-COUNT  DEC 
                              OR USE-STATEMENT                          DEC 
                           IF USE-STATEMENT                             DEC 
                               MOVE DATA-AREA TO DL-CODE                DEC 
                               PERFORM 1180-PRINT-REPORT-LINE           DEC 
                               MOVE ZERO TO PERIOD-COUNT                DEC 
                               INSPECT DATA-AREA TALLYING PERIOD-COUNT  DEC 
                                   FOR ALL "."                          DEC 
                               IF PERIOD-COUNT > ZERO                   DEC 
                                   MOVE "N" TO USE-STATEMENT-SW         DEC
                               ELSE                                     DEC 
                                   NEXT SENTENCE                        DEC 
                           ELSE                                         DEC 
                               NEXT SENTENCE                            DEC 
                       ELSE                                             DEC 
                           MOVE DATA-AREA TO DECLARATIVE-LINE           DEC 
                           PERFORM 1180-PRINT-REPORT-LINE               DEC 
                           MOVE ZERO TO PERIOD-COUNT                    DEC 
                           INSPECT DATA-AREA TALLYING PERIOD-COUNT      DEC 
                               FOR ALL "."                              DEC 
                           IF PERIOD-COUNT > ZERO                       DEC 
                               MOVE "N" TO USE-STATEMENT-SW.            DEC
      *                                                                 DEC 
       6210-SEARCH-FOR-USE-VERB.                                        DEC 
      *                                                                 DEC 
           IF SOURCE-WORD (SOURCE-WORD-INDEX) = "USE"                   DEC
               MOVE "Y" TO USE-STATEMENT-SW.                            DEC
      *                                                                 DEC 
       7000-PRINT-PROGRAM-SUMMARY.                                              
      *                                                                         
           MOVE 99 TO LINE-COUNT.                                               
           IF    TABLE-OVERFLOW                                                 
              OR CALL-OVERFLOW                                                  
              OR LEVEL-OVERFLOW                                                 
               PERFORM 7100-PRINT-ERROR-MESSAGES.                               
           IF PRINT-UNCALLED-MODULES                                            
               PERFORM 7200-PRINT-UNCALLED-MODULES.                             
           IF PRINT-CALLED-SUBPROGRAMS                                          
               PERFORM 7300-PRINT-CALLED-SUBPROGRAMS.                           
           PERFORM 7400-PRINT-PROGRAM-STATISTICS.                               
      *                                                                         
       7100-PRINT-ERROR-MESSAGES.                                               
      *                                                                         
           MOVE ERROR-MESSAGES-HEADING TO SHL-HEADING.                          
           MOVE SUMMARY-HEADING-LINE TO PRINT-LINE.                             
           MOVE 2 TO SPACE-CONTROL.                                             
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE 2 TO SPACE-CONTROL.                                             
           IF TABLE-OVERFLOW                                                    
               MOVE TABLE-OVERFLOW-MESSAGE-2 TO PRINT-LINE                      
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           IF CALL-OVERFLOW                                                     
               MOVE CALL-OVERFLOW-MESSAGE TO PRINT-LINE                         
               PERFORM 1180-PRINT-REPORT-LINE.                                  
           IF LEVEL-OVERFLOW                                                    
               MOVE LEVEL-OVERFLOW-MESSAGE TO PRINT-LINE                        
               PERFORM 1180-PRINT-REPORT-LINE.                                  
      *                                                                         
       7200-PRINT-UNCALLED-MODULES.                                             
      *                                                                         
           MOVE UNCALLED-MODULES-HEADING TO SHL-HEADING.                        
           MOVE SUMMARY-HEADING-LINE TO PRINT-LINE.                             
           MOVE 2 TO SPACE-CONTROL.                                             
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE 2 TO SPACE-CONTROL.                                             
           PERFORM 7210-PRINT-UNCALLED-MODULE                                   
               VARYING MODULE-INDEX FROM 1 BY 1                                 
               UNTIL MODULE-INDEX > MODULE-COUNT.                               
      *                                                                         
       7210-PRINT-UNCALLED-MODULE.                                              
      *                                                                         
           IF TIMES-CALLED (MODULE-INDEX) = ZERO                                
               MOVE MODULE-NAME (MODULE-INDEX) TO ML-MODULE-NAME                
               PERFORM 1180-PRINT-REPORT-LINE.                                  
      *                                                                         
       7300-PRINT-CALLED-SUBPROGRAMS.                                           
      *                                                                         
           MOVE CALLED-SUBPROGRAMS-HEADING TO SHL-HEADING.                      
           MOVE SUMMARY-HEADING-LINE TO PRINT-LINE.                             
           MOVE 2 TO SPACE-CONTROL.                                             
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE 2 TO SPACE-CONTROL.                                             
           PERFORM 7310-PRINT-CALLED-SUBPROGRAM                                 
               VARYING MODULE-INDEX FROM 1 BY 1                                 
               UNTIL MODULE-INDEX > MODULE-COUNT.                               
      *                                                                         
       7310-PRINT-CALLED-SUBPROGRAM.                                            
      *                                                                         
           IF SUBPROGRAM (MODULE-INDEX)                                         
               MOVE MODULE-NAME (MODULE-INDEX) TO ML-MODULE-NAME                
               PERFORM 1180-PRINT-REPORT-LINE.                                  
      *                                                                         
       7400-PRINT-PROGRAM-STATISTICS.                                           
      *                                                                         
           MOVE PROGRAM-STATISTICS-HEADING TO SHL-HEADING.                      
           MOVE SUMMARY-HEADING-LINE              TO PRINT-LINE.                
           MOVE 2                                 TO SPACE-CONTROL.             
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "TOTAL LINES IN PROGRAM:"         TO SL-DESCRIPTION.
           MOVE TOTAL-LINE-COUNT                  TO SL-COUNT.                  
           MOVE 2                                 TO SPACE-CONTROL.             
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "TOTAL LINES MINUS COMMENTS:"     TO SL-DESCRIPTION.
           MOVE SOURCE-LINE-COUNT                 TO SL-COUNT.                  
           MOVE 1                                 TO SPACE-CONTROL.             
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "PD LINES MINUS COMMENTS:"        TO SL-DESCRIPTION.
           MOVE PD-LINE-COUNT                     TO SL-COUNT.                  
           PERFORM 1180-PRINT-REPORT-LINE.                                      
      *                                                                         
           MOVE "NUMBER OF COBOL SECTIONS:"       TO SL-DESCRIPTION.
           MOVE COBOL-SECTION-COUNT               TO SL-COUNT.                  
           MOVE 2                                 TO SPACE-CONTROL.             
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "NUMBER OF COBOL PARAGRAPHS:"     TO SL-DESCRIPTION.
           MOVE COBOL-PARAGRAPH-COUNT             TO SL-COUNT.                  
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "NUMBER OF SUBPROGRAMS USED:"     TO SL-DESCRIPTION.
           MOVE SUBPROGRAM-COUNT                  TO SL-COUNT.                  
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "AVG. LINES PER COBOL MODULE:"    TO SL-DESCRIPTION.
           IF COBOL-MODULE-COUNT NOT = ZERO                                     
               DIVIDE PD-LINE-COUNT BY COBOL-MODULE-COUNT                       
                   GIVING SL-COUNT ROUNDED                                      
           ELSE                                                                 
               MOVE PD-LINE-COUNT                 TO SL-COUNT.                  
           PERFORM 1180-PRINT-REPORT-LINE.                                      
      *                                                                         
           MOVE "NUMBER OF PERFORM STATEMENTS:"   TO SL-DESCRIPTION.
           MOVE PERFORM-COUNT                     TO SL-COUNT.                  
           MOVE 2                                 TO SPACE-CONTROL.             
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "NUMBER OF INLINE PERFORMS:"      TO SL-DESCRIPTION.
           MOVE INLINE-PERFORM-COUNT              TO SL-COUNT.
           PERFORM 1180-PRINT-REPORT-LINE.
           MOVE "NUMBER OF CALL STATEMENTS:"      TO SL-DESCRIPTION.
           MOVE CALL-COUNT                        TO SL-COUNT.                  
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "NUMBER OF SORT STATEMENTS:"      TO SL-DESCRIPTION.
           MOVE SORT-COUNT                        TO SL-COUNT.                  
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "NUMBER OF MERGE STATEMENTS:"     TO SL-DESCRIPTION.
           MOVE MERGE-COUNT                       TO SL-COUNT.                  
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "NO. OF SORT/MERGE PROCEDURES:"   TO SL-DESCRIPTION.
           MOVE SORT-MERGE-PROCEDURE-COUNT        TO SL-COUNT.                  
           PERFORM 1180-PRINT-REPORT-LINE.                                      
           MOVE "NUMBER OF GO TO STATEMENTS:"     TO SL-DESCRIPTION.
           MOVE GOTO-COUNT                        TO SL-COUNT.                  
           PERFORM 1180-PRINT-REPORT-LINE.                                      
      *                                                                         
