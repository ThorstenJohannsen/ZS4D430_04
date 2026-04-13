@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter (Assozitation) Übung 12'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z04_C_EMPLOYEEQUERYP 
// Übung 15 Aufgabe 1 die Aufgabe 2 wird in der Klasse gemacht
with parameters
p_target_curr : /dmo/currency_code,
@EndUserText.label: 'Datum der Bewertung'
@Environment.systemField: #USER_DATE // steht nicht in der Übung 15 ist aber so einfacher, da vorbelegt. Das Sternchen am Ende verschwindet!
p_date : abap.dats

as select from Z04_R_Employee
{
    key EmployeeId,
    FirstName,
    LastName,
    DepartmentId,
    _Department.Description as DepartmentDescription,
//    _Department._Assistant.LastName as AssistantName, // mit Übung 14 geändert
    // Übung 14 Aufgabe 1
    concat_with_space( _Department._Assistant.FirstName, 
                       _Department._Assistant.LastName, 
                       1 ) as AssistantName,
    
    // Übung 13
    case EmployeeId
        when _Department.DepartmentHead then 'H'
        when  _Department.DepartmentAssistant then 'A'
        else ''
    end  as EmployeeRole,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
     // Übung 14 Aufgabe 3    
    @EndUserText.label: 'Monthly Salary'
    @Semantics.amount.currencyCode: 'CurrencyCode'
    cast( ( cast( AnnualSalary as abap.fltp ) / 12.0) as abap.dec( 10, 0 )) as MonthlySalary,
    CurrencyCode,   
      
   
    @Semantics.amount.currencyCode: 'CurrencyCode'
    @EndUserText.label: 'Annual Salary Converted'
    currency_conversion( amount => AnnualSalary, 
                source_currency => CurrencyCode,
                // Übung 15 Parameter einsetzen 
                target_currency => $parameters.p_target_curr, // oder $projection.CurrencyCodeTarget
             exchange_rate_date => $parameters.p_date ) as AnnualSalaryConverted,         
       
//     cast( 'USD' as /dmo/currency_code ) as CurrencyCode_USD,   
    // Übung 14 Aufgabe 3 Ende
     
     cast( ( cast( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0) as abap.dec( 10, 0 )) as MonthlySalaryConverted,
     
     $parameters.p_target_curr as CurrencyCodeTarget,   // Übung 15 Aufgabe    
     // Übung 14 Aufgabe 2 geändert mit Übung 15
//     division( dats_days_between( EntryDate, 
//                                 $session.system_date ), 
//                                365, 1 ) as CompanyAffiliation,
     //Übung 15 Parameter Date einsetzen                           
     division( dats_days_between( EntryDate, 
                                 $parameters.p_date ), 
                                365, 1 ) as CompanyAffiliation,
                                
    /* Associations */
    _Department
}
