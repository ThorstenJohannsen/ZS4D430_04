CLASS zz04_exam04_insert_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zz04_exam04_insert_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
      DATA lt_data TYPE TABLE OF zexam04_acmat.

    " 1. Alten Tabelleninhalt löschen (um Duplikate bei Mehrfachausführung zu vermeiden)
    DELETE FROM zexam04_acmat.

    " Zeitstempel für die administrativen Felder ermitteln
    GET TIME STAMP FIELD DATA(lv_ts).

    " Ermittelt deine ABAP-User-ID
    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).

    " 2. Interne Tabelle mit den gewünschten Testdaten befüllen
    lt_data = VALUE #(
      ( matid = 'MAT001' factory_warehouse = '1010' quant_warehouse = 100 unit_meas = 'M3' )
      ( matid = 'MAT002' factory_warehouse = '1010' quant_warehouse = 200 unit_meas = 'M3' )
      ( matid = 'MAT003' factory_warehouse = '1020' quant_warehouse = 300 unit_meas = 'M3' )
      ( matid = 'MAT004' factory_warehouse = '1010' quant_warehouse = 400 unit_meas = 'M3' )
      ( matid = 'MAT005' factory_warehouse = '1030' quant_warehouse = 500 unit_meas = 'M3' )
      ( matid = 'MAT006' factory_warehouse = '1030' quant_warehouse = 600 unit_meas = 'M3' )
      ( matid = 'MAT007' factory_warehouse = '1030' quant_warehouse = 700 unit_meas = 'M3' )
      ( matid = 'MAT008' factory_warehouse = '1040' quant_warehouse = 700 unit_meas = 'M3' )
      ( matid = 'MAT009' factory_warehouse = '1020' quant_warehouse = 700 unit_meas = 'M3' )
      ( matid = 'MAT010' factory_warehouse = '1040' quant_warehouse = 700 unit_meas = 'M3' )
    ).

*    " Administrative Daten für alle Zeilen standardisiert ergänzen
*    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<fs_data>).
*      <fs_data>-created_by             = lv_user.
*      <fs_data>-created_at             = lv_ts.
*      <fs_data>-local_last_changed_by  = lv_user.
*      <fs_data>-local_last_changed_at = lv_ts.
*      <fs_data>-last_changed_at        = lv_ts.
*    ENDLOOP.

    " 3. Daten in die Datenbanktabelle einfügen
    INSERT zexam04_acmat FROM TABLE @lt_data.

    " 4. Erfolgsmeldung in der ADT-Konsole ausgeben
    out->write( |Erfolgreich { sy-dbcnt } Zeilen in Tabelle zexam04_acmat eingefügt.| ).

  ENDMETHOD.
ENDCLASS.
