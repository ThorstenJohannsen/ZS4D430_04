@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameters in View View Abb. 153'
@Metadata.ignorePropagatedAnnotations: true
define view entity z04_C_Parameters_153
with parameters
    Language: spras,
    FirstFlightDate: /dmo/flight_date 
as select from z04_C_Parameters_147_151(
     Target_Currency: 'EUR',
     P_Language: $parameters.Language,
     FreeOrOcc: 'X',
     FirstFlightDate: $parameters.FirstFlightDate )

{
    key AirlineID,
    key ConnectionID,
    key FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    Seats,
    @Semantics.amount.currencyCode: 'TargetCurrency'
    PriceConverted,
    TargetCurrency,
    LanguageForCurrency,
    CurrencyName
}
