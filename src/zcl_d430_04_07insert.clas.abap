CLASS zcl_d430_04_07insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d430_04_07insert IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


     DATA ls_z04depment TYPE z04depment.

    ls_z04depment-id = 'FINANCE'.
    ls_z04depment-description = 'Finance'.

    INSERT INTO z04depment VALUES @ls_z04depment.

    RETURN.

    DATA lt_z00customer TYPE TABLE OF z00customer.

    lt_z00customer = VALUE #( ( customerid = '000001'
                                first_name = 'Vorname-1'
                                last_name  = 'Name-1'
                                postcode = '80939'
                                street = 'Musterstrasse 1'
                                city  = 'München'
                                         )
                              ( customerid = '000002'
                                first_name = 'Vorname-2'
                                last_name  = 'Name-2'
                                postcode = '80932'
                                street = 'Musterstrasse 2'
                                city  = 'München'
                                         )
                              ( customerid = '000003'
                                first_name = 'Vorname-3'
                                last_name  = 'Name-3'
                                postcode = '80933'
                                street = 'Musterstrasse 3'
                                city  = 'München'
                                         )
                              ( customerid = '000004'
                                first_name = 'Vorname-4'
                                last_name  = 'Name-4'
                                postcode = '80934'
                                street = 'Musterstrasse 4'
                                city  = 'München'
                                         )
                                    ).
    MODIFY z00customer FROM TABLE @lt_z00customer.


    DATA lt_z00custorders TYPE TABLE OF z00custorders.

    lt_z00custorders = VALUE #( ( customerid = '000001'
                                  orderid = '000001'
                                  amount = '1000.50'
                                 )
                                ( customerid = '000001'
                                  orderid = '000002'
                                  amount = '2000.50'
                                 )

                                ( customerid = '000002'
                                  orderid = '000003'
                                  amount = '5000.50'
                                 )
                                ( customerid = '000002'
                                  orderid = '000004'
                                  amount = '8000.50'
                                 )
                                ( customerid = '000004'
                                  orderid = '000005'
                                  amount = '7000.50'
                                 )
                                ( customerid = '000004'
                                  orderid = '000006'
                                  amount = '7500.50'
                                 )
                                ( customerid = '000004'
                                  orderid = '000007'
                                  amount = '7900.50'
                                 )
                               ).

    MODIFY z00custorders FROM TABLE @lt_z00custorders.











  ENDMETHOD.
ENDCLASS.
