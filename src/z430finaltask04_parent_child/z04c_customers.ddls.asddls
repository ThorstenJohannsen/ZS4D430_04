@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Parent'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z04C_CUSTOMERS
 provider contract transactional_query
 as projection on Z04R_CUSTOMERS
{
      key Customerid,
      FirstName,
      LastName,
      City,
      Street,
      Postcode,
      ZzemailZem, // Nimmt das Feld aus der View-Erweiterung auf
      ZzphoneZem, // Nimmt das Feld aus der View-Erweiterung auf
      
      /* Associations */
      _Orders : redirected to composition child Z04C_CUST_ORDERS
}
