@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Child View'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z04R_CUST_ORDERS as select from z04cust_orders
    association to parent Z04R_CUSTOMERS as _Customer on $projection.Customerid = _Customer.Customerid
{
    key orderid as Orderid,
    customerid as Customerid,
    @Semantics.amount.currencyCode: 'Currency'
    amount as Amount,
    currency as Currency,
    _Customer
}
