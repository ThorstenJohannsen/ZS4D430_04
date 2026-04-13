CLASS zcl_s4d430_rls_path_expr_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_S4D430_RLS_PATH_EXPR_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    data(today) = cl_abap_context_info=>get_system_date( ).

    SELECT
*    FROM /LRN/C_Employee_Ann
      FROM z04_c_employeequeryp( p_date = @today, p_target_curr = 'USD' )
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           departmentdescription,
           assistantname,
           \_department\_head-lastname AS headname,
           MonthlySalaryConverted,
           CurrencyCodeTarget,
           CompanyAffiliation

    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
