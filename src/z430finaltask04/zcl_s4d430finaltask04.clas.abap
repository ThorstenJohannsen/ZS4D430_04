CLASS zcl_s4d430finaltask04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_s4d430finaltask04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_customer TYPE TABLE OF z04customers.
    DATA lt_cust_order TYPE TABLE OF z04cust_orders.


    lt_customer = VALUE #( ( customerid = '000001'
                             first_name = 'Thorsten'
                             last_name = 'Johannsen'
                             street = 'Rosengasse 15'
                             city = 'Hamburg'
                             postcode = '20255' )

                           ( customerid = '000002'
                             first_name = 'Trini'
                             last_name = 'Johannsen'
                             street = 'Rosengasse 15'
                             city = 'Hamburg'
                             postcode = '20255' )

                           ( customerid = '000003'
                             first_name = 'Nina'
                             last_name = 'Szogsikowski'
                             street = 'Mutterstrasse 1a'
                             city = 'Hamburg'
                             postcode = '20357' )

                           ( customerid = '000004'
                             first_name = 'Max'
                             last_name = 'Mustermann'
                             street = 'Globalallee'
                             city = 'Mümchen'
                             postcode = '80539' )
                           ).
    out->write( lt_customer ).
    MODIFY z04customers FROM TABLE @lt_customer.


    lt_cust_order = VALUE #( ( orderid = '000001'
                               customerid = '000001'
                               amount = 1500
                               currency = 'EUR' )

                            ( orderid = '000002'
                               customerid = '000002'
                               amount = 2000
                               currency = 'EUR' )

                             ( orderid = '000003'
                               customerid = '000003'
                               amount = 500
                               currency = 'EUR' )

                               ( orderid = '000004'
                               customerid = '000004'
                               amount = 5500
                               currency = 'USD' )

                               ( orderid = '000005'
                               customerid = '000001'
                               amount = 4000
                               currency = 'EUR' )

                               ( orderid = '000006'
                               customerid = '000002'
                               amount = 850
                               currency = 'EUR' )

                               ( orderid = '000007'
                               customerid = '000003'
                               amount = 1500
                               currency = 'EUR' )

                               ( orderid = '000008'
                               customerid = '000001'
                               amount = 3700
                               currency = 'EUR' )

                               ( orderid = '000009'
                               customerid = '000004'
                               amount = 10500
                               currency = 'USD' )

                               ( orderid = '000010'
                               customerid = '000001'
                               amount = 15000
                               currency = 'EUR' )
                            ).
    out->write( lt_cust_order ).

    MODIFY z04cust_orders FROM TABLE @lt_cust_order.


  ENDMETHOD.
ENDCLASS.
