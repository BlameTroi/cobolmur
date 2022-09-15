       IDENTIFICATION DIVISION.

       PROGRAM-ID. CHAR3000.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01  switches.
           05  end-of-session-switch   pic X       value "N".
               88  end-of-session                  value "Y" "y".
           05  valid-entry-switch      pic x.
               88  valid-entry                     value "Y".

       01  work-fields.
           05  zip-code                pic x(10).
           05  edited-zip-code         pic x(9).
           05  count-1                 pic s9(3).
           05  count-2                 pic s9(3).
           05  count-3                 pic s9(3).

       PROCEDURE DIVISION.

       000-edit-zip-codes.

           perform 100-edit-zip-code
               until end-of-session.
           display "End of session.".
           stop run.

       100-edit-zip-code.

           display "-----------------------------------------------".
           display "To end program, enter Y (or y).".
           accept end-of-session-switch.
           display "-----------------------------------------------".
           if not end-of-session
               perform 110-get-input-fields
               perform 120-edit-zip-code-entry
               if valid-entry
                   display "Edited zip code = " edited-zip-code
               else
                   display "Invalid entry.".

       110-get-input-fields.

           display "Enter zip code with or without a hyphen (-).".
           accept zip-code.

       120-edit-zip-code-entry.

           move zero to count-1 count-2 count-3.

           inspect zip-code tallying
               count-1 for all "-"
               count-2 for characters before "-".
           inspect zip-code
               tallying count-3 for characters before " ".

           if count-1 = 0 and (count-3 = 5 or count-3 = 9)
               move zip-code to edited-zip-code
               move "Y" to valid-entry-switch
           else
               if count-1 = 1 and count-2 = 5
                   move zip-code (1:5) to edited-zip-code
                   move "Y" to valid-entry-switch
                   if count-3 = 10
                       move zip-code (7:4)  to edited-zip-code (6:)
                   end-if
               else
                   move "N" to valid-entry-switch
               end-if
           end-if.

