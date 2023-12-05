       identification division.

       program-id. calc2000.

       environment division.

       input-output section.

       data division.

       file section.

       working-storage section.

       01  user-entries.

           05  number-entered              pic 9        value 1.
           05  investment-amount           pic 99999.
           05  number-of-years             pic 99.
           05  yearly-interest-rate        pic 99v9.

       01  work-fields.

           05  future-value                pic 9(7)v99.
           05  year-counter                pic 999.
           05  edited-future-value         pic z,zzz,zzz.99.

       procedure division.

       000-calculate-future-values.

           perform 100-calculate-future-value
               until number-entered = zero.
           display "End of session.".
           stop run.

       100-calculate-future-value.

           display "----------------------------------------".
           display "To end the program, enter 0.".
           display "To perform another calculation, enter 1.".
           accept  number-entered.
           display "----------------------------------------".
           if number-entered = 1
               perform 110-get-user-values
               move investment-amount to future-value
               move 1 to year-counter
               perform 120-calculate-next-fv
                   until year-counter > number-of-years
               move future-value to edited-future-value
               display "Future value = " edited-future-value.

       110-get-user-values.

           display "Enter investment amount (xxxxx).".
           accept  investment-amount.
           display "Enter number of years (xx).".
           accept  number-of-years.
           display "Enter yearly interest rate (xx.x).".
           accept  yearly-interest-rate.

       120-calculate-next-fv.

           compute future-value rounded =
               future-value +
                   (future-value * yearly-interest-rate / 100).
           add 1 to year-counter.
