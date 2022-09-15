       IDENTIFICATION DIVISION.

       PROGRAM-ID. DATE2000.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01  switches.
           05  end-of-session-switch        pic X       value "N".
               88  end-of-session                       value "Y" "y".

       01  current-date-and-time.

           05  cd-date.
               10  cd-year                  pic 9(4).
               10  cd-month                 pic 9(2).
               10  cd-day                   pic 9(2).

       01  user-entries.

           05  birth-month                  pic 9(2).
           05  birth-day                    pic 9(2).
           05  birth-year                   pic 9(2).

       01  work-fields.

           05  user-age                     pic z(3).

       PROCEDURE DIVISION.

       000-calculate-user-ages.

           accept cd-date from date yyyymmdd.
           perform 100-calculate-user-age
               until end-of-session.
           display "End of session.".
           stop run.

       100-calculate-user-age.

           display "-----------------------------------------------".
           display "To end program, enter Y (or y).".
           accept end-of-session-switch.
           display "-----------------------------------------------".
           if not end-of-session
               perform 110-get-user-entries
               display "Age = " user-age.

       110-get-user-entries.

           display "Enter month of birth.".
           accept birth-month.
           display "Enter day of birth.".
           accept birth-day.
           display "Enter year of birth (99).".
           accept birth-year.


