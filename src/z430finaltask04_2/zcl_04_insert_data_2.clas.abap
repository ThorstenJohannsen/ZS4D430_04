CLASS zcl_04_insert_data_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_insert_data_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA lt_customers TYPE TABLE OF z04customers_2.
    DATA lt_orders    TYPE TABLE OF z04cust_orders_2.

    " 1. Bestehende Testdaten bereinigen
    DELETE FROM z04customers_2.
    DELETE FROM z04cust_orders_2.
*return.
    " 2. 10 Kunden aufbauen
    " 5 Kunden INNERHALB des PLZ-Bereichs (22000 - 22200)
    lt_customers = VALUE #(
      ( customer_id = '000001' first_name = 'Anna'     last_name = 'Müller'    street = 'Hauptstr. 1'   postcode = '22001' city = 'Hamburg' )
      ( customer_id = '000002' first_name = 'Ben'      last_name = 'Schmidt'   street = 'Elbchaussee 5' postcode = '22111' city = 'Hamburg' )
      ( customer_id = '000003' first_name = 'Clara'    last_name = 'Fischer'   street = 'Alsterufer 2'  postcode = '22199' city = 'Hamburg' )
      ( customer_id = '000004' first_name = 'David'    last_name = 'Weber'     street = 'Hafenstr. 12'  postcode = '22200' city = 'Hamburg' )
      ( customer_id = '000005' first_name = 'Emma'     last_name = 'Meyer'     street = 'Mönckeberg 8'  postcode = '22045' city = 'Hamburg' )

    " 5 Kunden AUßERHALB des PLZ-Bereichs
      ( customer_id = '000006' first_name = 'Felix'    last_name = 'Wagner'    street = 'Berliner Tor'  postcode = '20095' city = 'Hamburg' )
      ( customer_id = '000007' first_name = 'Greta'    last_name = 'Becker'    street = 'Kugelfang 3'   postcode = '30179' city = 'Hannover' )
      ( customer_id = '000008' first_name = 'Henry'    last_name = 'Schulz'    street = 'Podbi 44'      postcode = '30163' city = 'Hannover' )
      ( customer_id = '000009' first_name = 'Ida'      last_name = 'Hoffmann'  street = 'KuDamm 100'    postcode = '10707' city = 'Berlin' )
      ( customer_id = '000010' first_name = 'Jakob'    last_name = 'Bauer'     street = 'Marienplatz 1' postcode = '80331' city = 'München' )
    ).

    " 3. Bestellungen für 4 Kunden aufbauen
    " 3 Kunden innerhalb der PLZ (Kunden: 01, 02, 03)
    " 1 Kunde außerhalb der PLZ (Kunde: 07)
    lt_orders = VALUE #(
      ( order_id = '000001' customer_id = '000001' order_date = '20260501' amount = '150.00'  currency = 'EUR' )
      ( order_id = '000002' customer_id = '000001' order_date = '20260515' amount = '45.50'   currency = 'EUR' )
      ( order_id = '000003' customer_id = '000002' order_date = '20260510' amount = '899.00'  currency = 'EUR' )
      ( order_id = '000004' customer_id = '000003' order_date = '20260512' amount = '1250.00' currency = 'EUR' )
      ( order_id = '000005' customer_id = '000007' order_date = '20260514' amount = '320.00'  currency = 'EUR' )
    ).

    " 4. Daten in die Tabellen schreiben
    INSERT z04customers_2 FROM TABLE @lt_customers.
    IF sy-subrc = 0.
      out->write( '10 Kunden erfolgreich eingefügt.' ).
    ENDIF.

    INSERT z04cust_orders_2 FROM TABLE @lt_orders.
    IF sy-subrc = 0.
      out->write( '5 Bestellungen erfolgreich eingefügt.' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
