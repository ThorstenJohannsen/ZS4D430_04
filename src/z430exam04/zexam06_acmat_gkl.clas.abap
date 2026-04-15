CLASS zexam06_acmat_gkl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zexam06_acmat_gkl IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data lt_zexam06 type table of zexam06_acmat.

  lt_zexam06 = value #(
                        ( client = 001 matid = 'MAT001' factory_warehouse = 1010 quant_warehouse = 100 unit_meas = 'M3' )
                        ( client = 002 matid = 'MAT002' factory_warehouse = 1010 quant_warehouse = 200 unit_meas = 'M3' )
                        ( client = 003 matid = 'MAT003' factory_warehouse = 1020 quant_warehouse = 300 unit_meas = 'M3' )
                        ( client = 004 matid = 'MAT004' factory_warehouse = 1010 quant_warehouse = 400 unit_meas = 'M3' )
                        ( client = 005 matid = 'MAT005' factory_warehouse = 1030 quant_warehouse = 500 unit_meas = 'M3' )
                        ( client = 006 matid = 'MAT006' factory_warehouse = 1030 quant_warehouse = 600 unit_meas = 'M3' )
                        ( client = 007 matid = 'MAT007' factory_warehouse = 1030 quant_warehouse = 700 unit_meas = 'M3' )
                        ( client = 008 matid = 'MAT008' factory_warehouse = 1040 quant_warehouse = 700 unit_meas = 'M3' )
                        ( client = 009 matid = 'MAT009' factory_warehouse = 1020 quant_warehouse = 700 unit_meas = 'M3' )
                        ( client = 010 matid = 'MAT010' factory_warehouse = 1040 quant_warehouse = 700 unit_meas = 'M3' )
                       ).

     modify zexam06_acmat from table @lt_zexam06.

     out->write( lt_zexam06 ).

  ENDMETHOD.
ENDCLASS.
