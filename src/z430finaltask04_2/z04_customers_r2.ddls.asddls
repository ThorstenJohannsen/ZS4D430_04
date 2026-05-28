@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 430 View R für Customers'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity z04_customers_r2 
    as select from z04customers_2
{
    key customer_id as CustomerId,
    first_name as FirstName,
    last_name as LastName,
    street as Street,
    postcode as Postcode,
    city as City
}
