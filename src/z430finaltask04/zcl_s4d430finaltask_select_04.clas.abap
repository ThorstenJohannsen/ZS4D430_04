CLASS zcl_s4d430finaltask_select_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_s4d430finaltask_select_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lv_target_curr) = 'EUR'.
    DATA(lv_date) = sy-datum.

    select from z04_cust_orders_R( customs_id = '*' )
        fields orderid, customerid, Amount,Currency,
               currency_conversion( amount = amount,
                           source_currency = currency,
                           target_currency = @lv_target_curr,
                        exchange_rate_date = @lv_date
                                   ) as ConvAmount, @lv_target_curr as TargetCurrency,
               \_Customers-first_name,
               \_Customers-last_name, \_Customers-postcode,
               \_Customers-city
        ORDER BY
               Customerid, Orderid
        into table @data(lt_cds_cust_order).

    out->write( lt_cds_cust_order ).

out->write( '--------------------------- Variante 1 ---------------------------------------------'  ).
select from z04_cust_orders_R( customs_id = '*' )
        fields customerid,
               \_Customers-first_name,
               \_Customers-last_name, \_Customers-postcode,
               \_Customers-city, sum( Amount ) as Total, Currency,
               sum( currency_conversion( amount = amount,
                           source_currency = currency,
                           target_currency = @lv_target_curr,
                        exchange_rate_date = @lv_date
                                   ) ) as TotalConverted,
               @lv_target_curr as TargetCorrency
        gROUP BY Customerid, \_Customers-first_name,
               \_Customers-last_name, \_Customers-postcode,
               \_Customers-city,Currency
        ORDER BY
               Customerid
        into table @data(lt_cds_cust_order2).

    out->write( lt_cds_cust_order2 ).

  ENDMETHOD.
ENDCLASS.
