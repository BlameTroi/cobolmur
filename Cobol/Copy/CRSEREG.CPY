      *******************************************************
      ** COURSE REGISTRATION RECORD LAYOUT
      *******************************************************
 
       01  COURSE-REGISTRATION-RECORD.
           05  CR-COURSE-KEY.
               10  CR-DEPARTMENT-CODE          PIC X(04).
               10  CR-COURSE-NUMBER            PIC 9(03).
               10  CR-SECTION-NUMBER           PIC 9(02).
           05  CR-COURSE-INFORMATION.
               10  CR-COURSE-TITLE             PIC X(20).
               10  CR-COURSE-START-DATE.
                   15  CR-COURSE-START-YEAR    PIC 9(04).
                   15  CR-COURSE-START-MONTH   PIC 9(02).
               10  CR-COURSE-UNITS             PIC 9(01).
               10  CR-COURSE-DAYS              PIC 9(01).
           05  CR-REGISTRATION-INFORMATION.
               10  CR-TEACHER-NUMBER           PIC 9(03).
               10  CR-STUDENT-INFORMATION.
                   15  CR-STUDENT-ID           PIC 9(09).
                   15  CR-STUDENT-NAME         PIC X(25).
                   15  CR-CLASS-STANDING       PIC 9(01).
                       88  FRESHMAN            VALUE 1.
                       88  SOPHOMORE           VALUE 2.
                       88  JUNIOR              VALUE 3.
                       88  SENIOR              VALUE 4.
                   15  CR-MAJOR                PIC X(04).
           05  CR-GRADING-INFORMATION.
               10  CR-6-WEEKS-GRADE            PIC X(01).
               10  CR-12-WEEKS-GRADE           PIC X(01).
               10  CR-FINAL-EXAM-GRADE         PIC X(01).
               10  CR-SEMESTER-GRADE           PIC X(01).

