@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 430 View Umsatzliste'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z04CUSTOMERS_C_LIST_2
  as select from z04cust_orders_2   as _Order
    inner join   z04_customers_r2 as _Customer on _Order.customer_id = _Customer.CustomerId
{
  key _Order.customer_id     as CustomerID,
  key _Order.currency        as Currency,
      _Customer.FirstName    as FirstName,
      _Customer.LastName     as LastName,
      _Customer.Postcode     as Postcode, // Wichtig für die spätere Access Control!

      @Semantics.amount.currencyCode: 'Currency'
      sum(_Order.amount)     as TotalAmount
}
group by
  _Order.customer_id,
  _Order.currency,
  _Customer.FirstName,
  _Customer.LastName,
  _Customer.Postcode
