       Identification Division.

       Program-id. Bookinq.

       Environment Division.

       Object Section.

       Class-Control.
          BookMng is class "bookmng".

       Data Division.

       Working-Storage Section.

       01  handles.
           05  bookMngObj       object reference.

       Procedure Division.

           Invoke BookMng "New" returning bookMngObj.
           Invoke bookMngObj "process-inquiries".
           Stop Run.

