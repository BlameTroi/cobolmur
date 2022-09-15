       Identification Division.
       Class-id.  BookInv
                  inherits from Base.
       Environment Division.
       Object Section.
       Class-Control.
           BookInv   is class "bookinv"
           Base      is class "Base".

       Object.
           Data Division.
           Working-Storage Section.
           01  book-data.
               05  bk-item-no                    pic x(05).
               05  bk-descriptive-data.
                   10  bk-item-desc              pic x(40).
                   10  bk-unit-cost              pic 9(03)v99.
                   10  bk-unit-price             pic 9(03)v99.
               05  bk-inventory-data.
                   10  bk-reorder-point          pic s9(05).
                   10  bk-on-hand                pic s9(05).
                   10  bk-on-order               pic s9(05).

           Procedure Division.
      ***********************************************************
           Method-ID. "set-book-info".
           Data Division.
           Linkage Section.
           01  ls-book-data.
               05  ls-item-no              pic x(05).
               05  ls-descriptive-data     pic x(50).
               05  ls-inventory-data       pic x(15).
           Procedure Division using ls-book-data.
               move ls-book-data to book-data.
           End Method "set-book-info".
      ***********************************************************
           Method-ID. "get-desc-Info".
           Data Division.
           Linkage Section.
           01  ls-descriptive-data.
               05  ls-item-desc        pic x(40).
               05  ls-unit-cost        pic 9(03)v99.
               05  ls-unit-price       pic 9(03)v99.
           Procedure Division returning ls-descriptive-data.
               move bk-descriptive-data to ls-descriptive-data.
           End Method "get-desc-info".
      ***********************************************************
           Method-ID. "get-inv-info".
           Data Division.
           Linkage Section.
           01  ls-inventory-data.
               05  ls-reorder-point    pic s9(05).
               05  ls-on-hand          pic s9(05).
               05  ls-on-order         pic s9(05).
           Procedure Division returning ls-inventory-data.
               move bk-inventory-data to ls-inventory-data.
           End Method "get-inv-info".
      ***********************************************************
       End Object.
       End Class BookInv.

