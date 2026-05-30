@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection-Views'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define view entity Z04C_CUST_ORDERS
  as projection on Z04R_CUST_ORDERS

{
      key Orderid,
      Customerid,
      @Semantics.amount.currencyCode: 'Currency'
      Amount,
      Currency,

      /* Associations */
      _Customer : redirected to parent Z04C_CUSTOMERS

}
