@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Abbildung 131 Case'
@Metadata.ignorePropagatedAnnotations: true
define view entity z04_c_case_132 as select from /dmo/customer
{
    key customer_id as CustomerId,
    first_name as FirstName,
    last_name as LastName,
    title as Title,
    @EndUserText.label: 'Anrede'
    case title
      when 'Mr.' then 'Mister'
      when 'Mrs.' then 'Misses'
      else ' '
    end as title_long,
    street as Street,
    postal_code as PostalCode,
    city as City,
    country_code as CountryCode,
    phone_number as PhoneNumber,
    email_address as EmailAddress,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt
}
