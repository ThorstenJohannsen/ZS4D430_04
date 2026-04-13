CLASS zcl_d430_04_16cds_parameters DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d430_04_16cds_parameters IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    ""Variante 1
    SELECT FROM z04_c_parameters_153( language =  'D',
                                      firstflightdate = '20260410' )
      FIELDS * INTO TABLE @DATA(lt_result).
out->write( '------------------Variante 1------------------------------'  ).
    out->write( lt_result  ).


    ""Variante 2
    data(today) = cl_abap_context_info=>get_system_date( ).

    try.
*        data(language) = cl_abap_context_info=>get_user_language_abap_format( ). "" geht nicht, gibt fehler!
*        data(language) = cl_abap_context_info=>get_user_language_iso_format( ). "" geht nicht, gibt fehler!
        data(language) = sy-langu.
        catch cx_root.
    endtry.

    SELECT FROM z04_c_parameters_153( language =  @language,
                                      firstflightdate = @today )
      FIELDS * INTO TABLE @lt_result.
    out->write( '------------------Variante 2------------------------------'  ).
    out->write( lt_result ).

    ""Variante 3


    SELECT FROM z04_c_parameters_153( language =  @language,
                                      firstflightdate = @( cl_abap_context_info=>get_system_date( ) ) )
      FIELDS * INTO TABLE @lt_result.
    out->write( '------------------Variante 3------------------------------'  ).
    out->write( lt_result  ).

  ENDMETHOD.
ENDCLASS.
