       Identification Division.
       Class-id.  BookFM
                  inherits from Base.
       Environment Division.
       Input-Output Section.
       File-Control.
           select INVMAST assign to "c:\cobol\data\invmasti.dat"
                          organization is indexed
                          access is random
                          record key is im-item-no.

       Object Section.
       Class-Control.
           BookFM  is class "bookfm"
           BookInv is class "bookinv"
           Base    is class "Base".

       Data Division.
       File Section.
       fd  invmast.
       01  inventory-master-record.
           05  im-item-no              pic x(05).
           05  im-descriptive-data     pic x(50).
           05  im-inventory-data       pic x(15).

       Object.

           Procedure Division.
      ***********************************************************
           Method-ID. "open-file".
           Procedure Division.
               open input invmast.
           End Method "open-file".
      ***********************************************************
           Method-ID. "close-file".
           Procedure Division.
               close invmast.
           End Method "close-file".
      ***********************************************************
           Method-ID. "create-book".
           Data Division.
           Linkage Section.
           01  ls-item-no     pic x(05).
           01  ls-bookInvObj  object reference.
           Procedure Division using ls-item-no
                              returning ls-bookInvObj.
               move ls-item-no to im-item-no
               read invmast
                   invalid key
                       set ls-bookInvObj to null
                   not invalid key
                       invoke BookInv "New"
                           returning ls-bookInvObj
                       invoke ls-bookInvObj "set-book-info"
                           using inventory-master-record
               end-read.
           End Method "create-book".
      ***********************************************************
       End Object.
       End Class BookFM.












