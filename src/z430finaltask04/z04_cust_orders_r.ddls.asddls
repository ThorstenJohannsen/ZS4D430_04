@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-R für Cust_Orders'
@Metadata.ignorePropagatedAnnotations: true
define view entity z04_cust_orders_R 
with parameters
   Customs_ID : z04_customerid
   
as select from z04cust_orders
association [1..1] to z04customers as _Customers
on $projection.Customerid = _Customers.customerid
 
{
   key orderid as Orderid,
   customerid as Customerid,
   @Semantics.amount.currencyCode: 'currency'
   amount as Amount,
   currency as Currency,
     
    _Customers
   
}
where customerid =  case 
                     when $parameters.Customs_ID = '*' then customerid 
                     else $parameters.Customs_ID 
                   end

