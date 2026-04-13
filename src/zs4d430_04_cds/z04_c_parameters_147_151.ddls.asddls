@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameters Abbildungen 147 bis 151'
@Metadata.ignorePropagatedAnnotations: true
define view entity z04_C_Parameters_147_151
with parameters
// Parameter 1 setzen bzw 3
Target_Currency : /dmo/currency_code,

// Parameter 2 setzen
@EndUserText.label: 'X für freie Plätze'
FreeOrOcc : abap.char( 1 ),

// Parameter 4 setzen
P_Language : spras,

@Environment.systemField: #USER_DATE
// Parameter 5 setzen hier für die WHERE clause
FirstFlightDate : /dmo/flight_date
as select from /DMO/I_Flight

{
    key AirlineID,
    key ConnectionID,
    key FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    // Verwendung Parameter 2 in Case
    case $parameters.FreeOrOcc
        when 'X' then MaximumSeats - OccupiedSeats
        else OccupiedSeats
    end as Seats,
    // Verwendung Parameter 3 in Funktion
    @Semantics.amount.currencyCode: 'TargetCurrency'    
    currency_conversion( amount => Price, 
                source_currency => CurrencyCode, 
                target_currency => $parameters.Target_Currency, 
                exchange_rate_date => $session.user_date 
                        ) as PriceConverted,
                        
     // Verwendung Parameter 1                   
     $parameters.Target_Currency as TargetCurrency,
     
     // Verwendung Parameter 4 als Filter
     $parameters.P_Language as LanguageForCurrency,
     _Currency._Text[1: Language = $parameters.P_Language ].CurrencyName
     // gibt einen Fehler, Projection in der Select Anweisung nicht erlaubt
//     _Currency._Text[1: Language = $projection.LanguageForCurrency ].CurrencyName as CurrencyName2
     
     
/*
    PlaneType,
    MaximumSeats,
    OccupiedSeats,
*/
    
    /* Associations */
//    _Airline,
//    _Connection,
//    _Currency
}

where /DMO/I_Flight.FlightDate >= $parameters.FirstFlightDate
