CLASS zcl_d430_04_15aggr159 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d430_04_15aggr159 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      SELECT FROM /dmo/connection
       FIELDS carrier_id,  COUNT( * ) AS Counter,   MAX(  distance ) AS Maximum,
              MIN(  distance  )  AS Minimum,
              div( sum( distance ) , count( * ) ) as D_AVG, "" habe ich selber reingenommen
              COUNT( DISTINCT airport_from_id  ) AS airports

*           WHERE airport_to_id = 'XXX'
           GROUP BY carrier_id
           INTO TABLE @DATA(lt_result).

    out->write( lt_result ).

  ENDMETHOD.
ENDCLASS.
