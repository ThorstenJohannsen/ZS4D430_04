CLASS zcl_d430_04_10cds_122_123_124 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d430_04_10cds_122_123_124 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*Abbildung 122
*    SELECT FROM /DMO/I_Connection_R
*     FIELDS AirlineID, ConnectionID, \_Airline-Name, \_Airline-CurrencyCode,  \_Flight-PlaneType
*          INTO TABLE @DATA(result).
*
*    out->write( result ).


***Abbildung 123
*    SELECT FROM /DMO/I_Connection_R
*       FIELDS AirlineID, ConnectionID,
*            \_Airline-Name,
**            \_Airline\_Currency-CurrencyISOCode
*            \_Airline\_Currency-CurrencyISOCode
*        INTO TABLE @DATA(result).
*    out->write( result ).

***Abbildung 124
    SELECT FROM i_currency FIELDS currency,
*        \_text[ (1) where language = 'e' ]-currencyshortname AS currencynameen,
        """ Beide Anweisungen unten sind gleich
        \_text[ (1) where language = 'E' ]-currencyshortname AS currencyname_EN,
        \_text[ MANY TO ONE WHERE language = 'D' ]-currencyshortname AS currencyname_DE
    INTO TABLE @DATA(result).
*
    out->write( result ).

  ENDMETHOD.
ENDCLASS.
