CLASS z04cl_fill_customer_orders DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z04cl_fill_customer_orders IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_customers TYPE TABLE OF z04customers.
    DATA lt_orders    TYPE TABLE OF z04cust_orders.

    " 1. Alten Tabelleninhalt löschen
    DELETE FROM z04customers.
    DELETE FROM z04cust_orders.

    " ABAP-Cloud-Benutzer für das Protokoll ermitteln
    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).

    " 2. Testdaten für 5 KUNDEN (IDs im Format 000001 - 000005)
    lt_customers = VALUE #(
      ( customerid = '000001' first_name = 'Max'   last_name = 'Mustermann' city = 'Hamburg'   street = 'Hafenstraße 1'  postcode = '20359' zzemail_zem = 'max@test.de'   zzphone_zem = '040-123456' )
      ( customerid = '000002' first_name = 'Anna'  last_name = 'Schmidt'    city = 'Berlin'    street = 'Lindenallee 5'  postcode = '10115' zzemail_zem = 'anna@test.de'  zzphone_zem = '030-987654' )
      ( customerid = '000003' first_name = 'Tom'   last_name = 'Meyer'      city = 'München'   street = 'Brauweg 12'     postcode = '80331' zzemail_zem = 'tom@test.de'   zzphone_zem = '089-555444' )
      ( customerid = '000004' first_name = 'Laura' last_name = 'Weber'      city = 'Köln'      street = 'Rheingasse 8'   postcode = '50667' zzemail_zem = 'laura@test.de' zzphone_zem = '0221-112233' )
      ( customerid = '000005' first_name = 'Simon' last_name = 'Wagner'     city = 'Frankfurt' street = 'Mainzer Landstr. 45' postcode = '60329' zzemail_zem = 'simon@test.de' zzphone_zem = '069-445566' )
    ).

    " 3. Testdaten für 20 BESTELLUNGEN (IDs im Format 000001 - 000020)
    lt_orders = VALUE #(
      " Bestellungen für Kunde 000001
      ( orderid = '000001' customerid = '000001' amount = '150.00' currency = 'EUR' )
      ( orderid = '000002' customerid = '000001' amount = '45.50'  currency = 'EUR' )
      ( orderid = '000003' customerid = '000001' amount = '12.99'  currency = 'EUR' )
      ( orderid = '000004' customerid = '000001' amount = '340.00' currency = 'EUR' )

      " Bestellungen für Kunde 000002
      ( orderid = '000005' customerid = '000002' amount = '899.99' currency = 'EUR' )
      ( orderid = '000006' customerid = '000002' amount = '24.50'  currency = 'EUR' )
      ( orderid = '000007' customerid = '000002' amount = '115.00' currency = 'EUR' )
      ( orderid = '000008' customerid = '000002' amount = '75.10'  currency = 'EUR' )

      " Bestellungen für Kunde 000003
      ( orderid = '000009' customerid = '000003' amount = '20.00'  currency = 'EUR' )
      ( orderid = '000010' customerid = '000003' amount = '125.10' currency = 'EUR' )
      ( orderid = '000011' customerid = '000003' amount = '8.50'   currency = 'EUR' )
      ( orderid = '000012' customerid = '000003' amount = '430.00' currency = 'EUR' )

      " Bestellungen für Kunde 000004
      ( orderid = '000013' customerid = '000004' amount = '99.00'  currency = 'EUR' )
      ( orderid = '000014' customerid = '000004' amount = '18.50'  currency = 'EUR' )
      ( orderid = '000015' customerid = '000004' amount = '250.00' currency = 'EUR' )
      ( orderid = '000016' customerid = '000004' amount = '67.40'  currency = 'EUR' )

      " Bestellungen für Kunde 000005
      ( orderid = '000017' customerid = '000005' amount = '55.00'  currency = 'EUR' )
      ( orderid = '000018' customerid = '000005' amount = '1200.00' currency = 'EUR' )
      ( orderid = '000019' customerid = '000005' amount = '31.20'  currency = 'EUR' )
      ( orderid = '000020' customerid = '000005' amount = '94.80'  currency = 'EUR' )
    ).

    " 4. Daten in die Datenbanktabellen einfügen
    INSERT z04customers   FROM TABLE @lt_customers.
    DATA(lv_cust_count) = sy-dbcnt.

    INSERT z04cust_orders FROM TABLE @lt_orders.
    DATA(lv_ord_count)  = sy-dbcnt.

    " 5. Erfolgsmeldung ausgeben
    out->write( |[S4D430] Numerische IDs erfolgreich eingespielt:| ).
    out->write( |-> { lv_cust_count } Kunden (000001 - 000005) angelegt (User: { lv_user }).| ).
    out->write( |-> { lv_ord_count } Bestellungen (000001 - 000020) verknüpft.| ).


  ENDMETHOD.
ENDCLASS.
