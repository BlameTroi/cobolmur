       IDENTIFICATION DIVISION.

       PROGRAM-ID. CHAR1000.

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
           05  user-entry              pic x(5).
           05  work-field              pic x(6).
           05  edited-result           pic s9(5).
           05  count-1                 pic s9(3).
           05  count-2                 pic s9(3).

       PROCEDURE DIVISION.

       000-edit-numeric-entries.

           perform 100-edit-numeric-entry
               until end-of-session.
           display "End of session.".
           stop run.

       100-edit-numeric-entry.

           display "-----------------------------------------------".
           display "To end program, enter Y (or y).".
           accept end-of-session-switch.
           display "-----------------------------------------------".
           if not end-of-session
               perform 110-get-input-fields
               perform 120-edit-numeric-entry
               if valid-entry
                   display "Edited result = " edited-result
               else
                   display "Invalid entry.".

       110-get-input-fields.

           display "Enter numeric field (99999).".
           accept user-entry.

       120-edit-numeric-entry.

           move zero to count-1 count-2.
           move user-entry to work-field.

           inspect work-field
               tallying count-1 for all "$" all "," all "."
               replacing leading " " by "0".

           if count-1 = 0
               inspect work-field
                   tallying count-2 for characters before " "
               move work-field (1:count-2) to edited-result
               move "Y" to valid-entry-switch
           else
               move "N" to valid-entry-switch.

