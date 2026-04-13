@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Umsatzliste pro Kunde'
@Metadata.ignorePropagatedAnnotations: true
define view entity z04_customers_C_LIST
with parameters
C_id : z04_customerid,
Target_Currency : abap.cuky,
@Environment.systemField: #USER_DATE
ac_date : abap.dats

as select from z04_cust_orders_R(Customs_ID:$parameters.C_id )

{
//    key Orderid,
    Customerid,
    _Customers.first_name as Vorname,
    _Customers.last_name as Nachname,
    @Semantics.amount.currencyCode: 'currency'
    sum(Amount) as AmountT,    
    Currency,
    @Semantics.amount.currencyCode: 'TargetCurrency'    
    sum(currency_conversion( amount => Amount, 
                source_currency => Currency, 
                target_currency => $parameters.Target_Currency, 
                exchange_rate_date => $parameters.ac_date ) ) as ConvertedAmount,
   
    $parameters.Target_Currency as TargetCurrency,
     /* Associations */
    _Customers
    
}

group by Customerid, _Customers.first_name, _Customers.last_name, Currency
