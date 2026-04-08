CLASS zcl_04_structurea DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

* Task 1: Simple Structure
**********************************************************************
*    TYPES:
*      BEGIN OF st_address,
*        street      TYPE /dmo/street,
*        postal_code TYPE /dmo/postal_code,
*        city        TYPE /dmo/city,
*        country     TYPE land1,
*      END OF st_address.

*** Meine Strukturen
   types st_adr type z04_s_address.
   types st_nam type z04_s_name.
   types st_pers type z04_s_person.

* Task 2: Nested Structure
**********************************************************************
*    TYPES:
*      BEGIN OF st_name,
*        first_name TYPE /dmo/first_name,
*        last_name  TYPE /dmo/last_name,
*      END OF st_name.

    TYPES: BEGIN OF st_person,
*             name    TYPE st_name,
*             address TYPE st_address,
             name    TYPE st_nam,
             address TYPE st_adr,
           END OF st_person.


*Task 3: Named Includes
**********************************************************************
*    TYPES BEGIN OF st_person_inc.
**    INCLUDE TYPE st_name    AS name.
**    INCLUDE TYPE st_address AS address.
*    INCLUDE TYPE st_nam    AS name.
*    INCLUDE TYPE st_adr AS address.
*    TYPES END OF st_person_inc.

protected section.
private section.
ENDCLASS.



CLASS ZCL_04_STRUCTUREA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Task 1
**********************************************************************
*    DATA address TYPE st_address.
    DATA address TYPE st_adr.

    address-street      = 'Dietmar-Hopp-Allee 16'.
    address-postal_code = '69190'.
    address-city        = 'Walldorf'.
    address-country     = 'DE'.

    out->write(  address ).
    out->write( cl_abap_char_utilities=>newline ).

* Task 2
**********************************************************************
*    DATA person TYPE st_person.
    DATA person TYPE z04_s_person.


    person-name-first_name     = 'Dictionary'.
    person-name-last_name      = 'ABAP'.
    person-address-street      = 'Dietmar-Hopp-Allee 16'.
    person-address-postal_code = '69190'.
    person-address-city        = 'Walldorf'.
    person-address-country     = 'DE'.

    out->write( person ).
    out->write( cl_abap_char_utilities=>newline ).

* Task 2
**********************************************************************
*    DATA person2 TYPE st_person_inc.
    DATA person2 TYPE z04_s_person_inc.

    person2-name-first_name     = 'Dictionary'.
    person2-name-last_name      = 'ABAP'.
    person2-address-street      = 'Dietmar-Hopp-Allee 16'.
    person2-address-postal_code = '69190'.
    person2-address-city        = 'Walldorf'.
    person2-address-country     = 'DE'.

    out->write( person2 ).
    out->write( cl_abap_char_utilities=>newline ).
* or -------------------------------------------------------
    person2-first_name  = 'Dictionary'.
    person2-last_name   = 'ABAP'.
    person2-street      = 'Dietmar-Hopp-Allee 16'.
    person2-postal_code = '69190'.
    person2-city        = 'Walldorf'.
    person2-country     = 'DE'.

    out->write( person2 ).
    out->write( cl_abap_char_utilities=>newline ).

  ENDMETHOD.
ENDCLASS.
