       IDENTIFICATION DIVISION.

       PROGRAM-ID. CHAR2000.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01  switches.
           05  end-of-session-switch   pic X       value "N".
               88  end-of-session                  value "Y" "y".

       01  work-fields.
           05  full-name               pic x(20).
           05  name-1                  pic x(10).
           05  pointer-field           pic s9(3).

       PROCEDURE DIVISION.

       000-convert-name-fields.

           perform 100-convert-name-field
               until end-of-session.
           display "End of session.".
           stop run.

       100-convert-name-field.

           display "-----------------------------------------------".
           display "To end program, enter Y (or y).".
           accept end-of-session-switch.
           display "-----------------------------------------------".
           if not end-of-session
               perform 110-get-input-fields
               perform 120-convert-name
               display "Result: " full-name.

       110-get-input-fields.

           display "Enter full name in all caps (20).".
           accept full-name.

       120-convert-name.

           move function lower-case (full-name) to full-name.
           move function upper-case (full-name (1:1))
               to full-name (1:1).
           move 1 to pointer-field.
           unstring full-name delimited by all " "
               into name-1
               with pointer pointer-field.
           move function upper-case (full-name (pointer-field:1))
               to full-name (pointer-field:1).
           unstring full-name delimited by all " "
               into name-1
               with pointer pointer-field.
           if pointer-field <= 20
              move function upper-case (full-name (pointer-field:1))
                   to full-name (pointer-field:1).
