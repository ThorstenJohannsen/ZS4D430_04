@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung 16'
@Metadata.ignorePropagatedAnnotations: true
// Übung 16 Aufgabe 1 testen von DISTINC Anweisung
//define view entity Z04_C_DEPARTMENTQUERY as select distinct from Z04_C_EmployeeQuery
define view entity Z04_C_DEPARTMENTQUERY
with parameters
   p_target_curr : /dmo/currency_code,
   @EndUserText.label: 'Datum der Bewertung'
   @Environment.systemField: #USER_DATE
   p_date : abap.dats
 as select from Z04_C_EMPLOYEEQUERYP( p_target_curr:$parameters.p_target_curr , 
                                             p_date: $parameters.p_date ) as e
 //Übung 16 Aufgabe 4
 right outer join Z04_R_Department as d  
 on e.DepartmentId = d.Id
{
 d.Id,
 d.Description,
 e.DepartmentId,
 e.DepartmentDescription,
 e.CurrencyCodeTarget,
 avg( e.CompanyAffiliation as abap.dec( 11 , 1 ) ) as AverageAffilation,
 @Semantics.amount.currencyCode: 'CurrencyCodeTarget'
 sum( e.AnnualSalaryConverted )                    as TotalSalary
}
group by
 d.Id,
 d.Description,
 e.DepartmentId,
 e.DepartmentDescription,
 e.CurrencyCodeTarget
