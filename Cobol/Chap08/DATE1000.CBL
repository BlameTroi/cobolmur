       IDENTIFICATION DIVISION.

       PROGRAM-ID. DATE1000.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01  switches.
           05  end-of-session-switch   pic X       value "N".
               88  end-of-session                  value "Y" "y".

       01  user-entries.

           05  date-1                  pic 9(5).
           05  date-1-r redefines date-1.
               10  d1-year             pic 9(2).
               10  d1-days             pic 9(3).
           05  date-2                  pic 9(5).
           05  date-2-r redefines date-2.
               10  d2-year             pic 9(2).
               10  d2-days             pic 9(3).

       01  work-fields.

           05  work-date.
               10  work-year           pic 9(2).
               10  work-days           pic 9(3).
           05  total-days              pic s9(5).
           05  total-days-1            pic s9(5).
           05  total-days-2            pic s9(5).
           05  elapsed-days            pic z(5).
           05  year-remainder          pic s9.
           05  leap-years              pic s9(3).

       PROCEDURE DIVISION.

       000-calculate-elapsed-days.

           perform 100-calculate-elapsed-days
               until end-of-session.
           display "End of session.".
           stop run.

       100-calculate-elapsed-days.

           display "-----------------------------------------------".
           display "To end program, enter Y (or y).".
           accept end-of-session-switch.
           display "-----------------------------------------------".
           if not end-of-session
               perform 110-get-user-entries
               perform 120-calculate-elapsed-days
               display "Elapsed days = " elapsed-days.

       110-get-user-entries.

           display "Enter first date (YYDDD).".
           accept date-1.
           display "Enter second date (YYDDD).".
           accept date-2.

       120-calculate-elapsed-days.

           move date-1 to work-date.
           perform 130-compute-total-days.
           move total-days to total-days-1.
           move date-2 to work-date.
           perform 130-compute-total-days.
           move total-days to total-days-2.
           compute elapsed-days = total-days-1 - total-days-2.

       130-compute-total-days.

           divide work-year by 4 giving leap-years
               remainder year-remainder.
           compute total-days = (work-year * 365)
                              + work-days + leap-years.
           if year-remainder = 0
               compute total-days = total-days - 1.





