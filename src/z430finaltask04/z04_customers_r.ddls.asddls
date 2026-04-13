@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-R für Customers'
@Metadata.ignorePropagatedAnnotations: true
define view entity z04_customers_R as select from z04customers
{
    key customerid as Customerid,
    first_name as FirstName,
    last_name as LastName,
    city as City,
    street as Street,
    postcode as Postcode
}
