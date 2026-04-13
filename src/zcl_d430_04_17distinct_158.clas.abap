CLASS zcl_d430_04_17distinct_158 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d430_04_17distinct_158 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    ""Variante ohne Distinct
    SELECT FROM /dmo/connection
      FIELDS * INTO TABLE @DATA(lt_result).

    out->write( '------------------Variante ohne DISTINCT------------------------------'  ).
    out->write( lt_result  ).


    ""Variante mit Distinct
    SELECT FROM /dmo/connection
      FIELDS DISTINCT airport_from_id INTO CORRESPONDING FIELDS OF TABLE @lt_result.

    out->write( '------------------Variante mit DISTINCT------------------------------'  ).
    out->write( lt_result  ).


  ENDMETHOD.
ENDCLASS.
