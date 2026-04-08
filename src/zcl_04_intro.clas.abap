CLASS zcl_04_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA var TYPE string. "" Schritt 1
    DATA var TYPE /LRN/S4D430_IND_CDS_View. "" Schritt 2
    DATA ls_table_/lrn/s4d430_ind TYPE /lrn/s4d430_ind.

*    ls_table_/lrn/s4d430_ind-id = '0001'.
*    ls_table_/lrn/s4d430_ind-description ='Wert-1'.
*
*    INSERT INTO /lrn/s4d430_ind VALUES @ls_table_/lrn/s4d430_ind.
    DELETE FROM /lrn/s4d430_ind WHERE  id = 0007.

    SELECT FROM /lrn/s4d430_ind FIELDS * INTO TABLE @DATA(result).

    out->write(  result ).



  ENDMETHOD.
ENDCLASS.
