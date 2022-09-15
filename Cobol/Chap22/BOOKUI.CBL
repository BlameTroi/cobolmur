       Identification Division.
       Class-id.  BookUI
                  inherits from Base.
       Environment Division.
       Object Section.
       Class-Control.
           BookUI is class "bookui"
           Base   is class "Base".

       Object.

           Data Division.
           Working-Storage Section.
           78  black           value 0.
           78  white           value 7.
           78  bright-white    value 15.

           Procedure Division.
      ***********************************************************
           Method-ID. "get-item-number".
           Data Division.

           Local-Storage Section.
           01  switches.
               05  valid-entry-switch        pic x(01) value "N".
                   88  valid-entry                     value "Y".

           01  error-message                 pic x(50).

           Linkage Section.
           01  ls-item-number                pic x(05).

           Procedure Division returning ls-item-number.

               move "N"    to valid-entry-switch.
               move spaces to ls-item-number.
               perform until valid-entry
                 display "Item number. . . . . " at line 5  column 1
                 display "Enter 99999 to end."   at line 24 column 1
                 accept ls-item-number at line 5 column 22
                     with prompt
                 if ls-item-number = space
                    move "An item number is required." to
                         error-message
                    invoke self "display-error-message"
                        using error-message
                 else
                    set valid-entry to true
                 end-if
               end-perform.

           End Method "get-item-number".
      ***********************************************************
           Method-ID. "get-next-item".
           Data Division.

           Local-Storage Section.
           01  switches.
               05  next-item-switch          pic x(01) value " ".
                   88  next-item                       value "Y".

           01  error-message                 pic x(50).

           Linkage Section.
           01  ls-end-of-inquiries-switch    pic x(01)  value "N".

           Procedure Division returning ls-end-of-inquiries-switch.

               move " " to next-item-switch.
               perform until next-item-switch = "Y" or "N"
                 display "Do you want to display another item?"
                     line 24 column 1
                 accept next-item-switch at line 24 column 38
                     with foreground-color bright-white upper
                 evaluate next-item-switch
                    when "Y"
                       move "N" to ls-end-of-inquiries-switch
                    when "N"
                       move "Y" to ls-end-of-inquiries-switch
                    when other
                       move "You must enter a 'Y' or 'N'." to
                            error-message
                       invoke self "display-error-message"
                           using error-message
                 end-evaluate
               end-perform.

           End Method "get-next-item".
      ***********************************************************
           Method-ID. "display-heading".
           Procedure Division.

               display "Inventory inquiry" at line 1 column 1
                   with blank screen
                   foreground-color black
                   background-color white.
               display "Type an item number. Then press Enter."
                   at line 3 column 1.

           End Method "display-heading".
      ***********************************************************
           Method-ID. "display-desc-info".
           Data Division.

           Local-Storage Section.
           01  screen-display-fields.
               05  unit-cost             pic zzz.zz.
               05  unit-price            pic zzz.zz.

           Linkage Section.
           01  ls-descriptive-data.
               05  ls-item-desc        pic x(40).
               05  ls-unit-cost        pic 9(03)v99.
               05  ls-unit-price       pic 9(03)v99.

           Procedure Division using ls-descriptive-data.

               move ls-unit-cost  to unit-cost.
               move ls-unit-price to unit-price.
               display "Description:"       line 7  column 1.
               display ls-item-desc         line 7  column 22.
               display "Unit cost:"         line 8  column 1.
               display unit-cost            line 8  column 22.
               display "Unit price:"        line 9  column 1.
               display unit-price           line 9  column 22.

           End Method "display-desc-info".
      ***********************************************************
           Method-ID. "display-inv-info".
           Data Division.

           Local-Storage Section.
           01  screen-display-fields.
               05  reorder-point         pic zz,zzz.
               05  on-hand               pic zz,zzz.
               05  on-order              pic zz,zzz.

           Linkage Section.
           01  ls-inventory-data.
               05  ls-reorder-point    pic s9(05).
               05  ls-on-hand          pic s9(05).
               05  ls-on-order         pic s9(05).

           Procedure Division using ls-inventory-data.

               move ls-reorder-point to reorder-point.
               move ls-on-hand       to on-hand.
               move ls-on-order      to on-order.
               display "Reorder point:"     line 10 column 1.
               display reorder-point        line 10 column 22.
               display "On hand:"           line 11 column 1.
               display on-hand              line 11 column 22.
               display "On order:"          line 12 column 1.
               display on-order             line 12 column 22.

           End Method "display-inv-info".
      ***********************************************************
           Method-ID. "display-error-message".
           Data Division.

           Linkage Section.
           01  ls-error-message           pic x(50).

           Procedure Division using ls-error-message.

               display ls-error-message at line 23 column 1
                   with foreground-color bright-white beep.

           End Method "display-error-message".
      ***********************************************************
           Method-ID. "display-blank-line".
           Procedure Division.

               display spaces at line 23 column 1.

           End Method "display-blank-line".
      ***********************************************************
       End Object.
       End Class BookUI.

