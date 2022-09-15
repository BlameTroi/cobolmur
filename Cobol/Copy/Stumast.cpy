      *******************************************************
      ** STUDENT MASTER RECORD LAYOUT
      *******************************************************

       01  STUDENT-MASTER-RECORD.
           05  SM-STUDENT-ID                   PIC 9(09).
           05  SM-STUDENT-STATUS               PIC X(01).
               88  ENROLLED                    VALUE "E".
               88  INACTIVE                    VALUE "I".
           05  SM-STUDENT-NAME-AND-ADDRESS.
               10  SM-STUDENT-NAME             PIC X(25).
	       10  SM-DATE-OF-BIRTH.
 		   15  SM-DOB-YEAR	       PIC 9(04).
	           15  SM-DOB-MONTH 	       PIC 9(02).
		   15  SM-DOB-DAY	       PIC 9(02).
               10  SM-STUDENT-ADDRESS          PIC X(25).
               10  SM-STUDENT-CITY             PIC X(11).
               10  SM-STUDENT-STATE            PIC X(02).
               10  SM-STUDENT-ZIP-CODE         PIC 9(05).
               10  SM-STUDENT-ZIP-CODE-EXT     PIC 9(04).
           05  SM-STUDENT-PROGRESS-SUMMARY.
               10  SM-CLASS-STANDING           PIC 9(01).
                   88  FRESHMAN                VALUE 1.
                   88  SOPHOMORE               VALUE 2.
                   88  JUNIOR                  VALUE 3.
                   88  SENIOR                  VALUE 4.
               10  SM-MAJOR                    PIC X(04).
               10  SM-UNITS-COMPLETED          PIC 9(03).
               10  SM-TOTAL-GRADE-POINTS       PIC 9(03).
               10  SM-UNITS-IN-PROGRESS        PIC 9(03).

