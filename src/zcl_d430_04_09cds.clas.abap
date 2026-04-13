CLASS zcl_d430_04_09cds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d430_04_09cds IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "Abbildung 140
    select from /dmo/travel
        fields total_price, currency_code, begin_date,
            """ kein Ergebnis, weil am 20.12.2025 keine Daten in der Exchange Tabelle vorhanden waren
            currency_conversion( amount = total_price,
                                 source_currency = currency_code,
                                 target_currency = 'EUR',
*                                 exchange_rate_date = cast( '20260409' as dats )
                                 exchange_rate_date = begin_date,
                                 on_error = @sql_currency_conversion=>c_on_error-set_to_null
                                ) as total_price_EUR
       into tablE @DATA(lt_result).



    out->write( lt_result ).


  ENDMETHOD.
ENDCLASS.
