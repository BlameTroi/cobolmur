       Identification Division.
       Class-id.  BookMng
                  inherits from Base.

       Environment Division.
       Object Section.
       Class-Control.
           BookMng     is class "bookmng"
           BookUI      is class "bookui"
           BookFM      is class "bookfm"
           BookInv     is class "bookinv"
           Base        is class "Base".

       Object.
           Data Division.
           Working-Storage Section.

           01  handles          object reference.
               05  bookUIObj.
               05  bookFMObj.
               05  bookInvObj.

           01  switches.
               05  end-of-inquiries-switch     pic x(01)  value "N".
                   88  end-of-inquiries                   value "Y".

           01  error-message                   pic x(50).

           01  book-data.
               05  bk-item-number              pic x(05).
               05  bk-descriptive-data.
                   10  bk-item-desc            pic x(40).
                   10  bk-unit-cost            pic 9(03)v99.
                   10  bk-unit-price           pic 9(03)v99.
               05  bk-inventory-data.
                   10  bk-reorder-point        pic s9(05).
                   10  bk-on-hand              pic s9(05).
                   10  bk-on-order             pic s9(05).

           Procedure Division.
      **********************************************************
           Method-ID. "process-inquiries".
           Procedure Division.

               invoke BookUI "New" returning bookUIObj
               invoke BookFM "New" returning bookFMObj

               invoke bookFMObj "open-file"
               invoke bookUIObj "display-heading"

               perform until end-of-inquiries
                  invoke bookUIObj "get-item-number"
                      returning bk-item-number
                  if bk-item-number = "99999"
                      set end-of-inquiries to true
                  else
                      invoke bookFMObj "create-book"
                          using bk-item-number
                          returning bookInvObj
                      if bookInvObj = null
                          move "Inventory record not found."
                              to error-message
                          invoke bookUIObj "display-error-message"
                              using error-message
                      else
                          invoke bookUIObj "display-blank-line"
                          invoke bookInvObj "get-desc-info"
                              returning bk-descriptive-data
                          invoke bookUIObj "display-desc-info"
                              using bk-descriptive-data
                          invoke bookInvObj "get-inv-info"
                              returning bk-inventory-data
                          invoke bookUIObj "display-inv-info"
                              using bk-inventory-data
                          invoke bookUIObj "get-next-item"
                              returning end-of-inquiries-switch
                          if not end-of-inquiries
                              invoke bookUIObj "display-heading"
                          end-if
                      end-if
                  end-if
               end-perform

               invoke bookFMObj "close-file"

           End Method "process-inquiries".

      ***********************************************************
       End Object.
       End Class BookMng.

