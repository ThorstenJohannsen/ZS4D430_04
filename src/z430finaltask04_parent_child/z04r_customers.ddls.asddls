@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z04R_CUSTOMERS as select from z04customers
    composition [0..*] of Z04R_CUST_ORDERS as _Orders
{
    key customerid as Customerid,
    first_name as FirstName,
    last_name as LastName,
    city as City,
    street as Street,
    postcode as Postcode,

    _Orders // Make association public
}
