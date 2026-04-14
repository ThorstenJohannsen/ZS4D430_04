@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-R für Customers'
@AbapCatalog.dataMaintenance: #RESTRICTED
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST]
@AbapCatalog.extensibility.dataSources: [ 'CustomerR' ]
@AbapCatalog.extensibility.elementSuffix: 'ZEM'
@Metadata.ignorePropagatedAnnotations: true
define view entity z04_customers_R 
as select from z04customers as CustomerR
{
    key customerid as Customerid,
    first_name as FirstName,
    last_name as LastName,
    city as City,
    street as Street,
    postcode as Postcode
}
