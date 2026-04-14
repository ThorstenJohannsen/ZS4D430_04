@AbapCatalog: { dataMaintenance: #RESTRICTED,
                viewEnhancementCategory: [ #NONE ] }
                
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter (Projektion) Übung 09'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{ dataClass: #MASTER,
                          serviceQuality: #D,
                          sizeCategory: #M }
/* alles hier zwischen ist auskommentiert 
als gruppe */             

define view entity Z04_C_EMPLOYEE 
    as select from Z04_R_Employee
{
   key EmployeeId,
   FirstName,
   LastName,
   BirthDate,
   EntryDate,
   DepartmentId,
   @Semantics.amount.currencyCode: 'CurrencyCode'
   AnnualSalary,
   @EndUserText.label: 'Currency Key' 
   CurrencyCode,
   CreatedBy,
   CreatedAt,
   LocalLastChangedBy,
   LocalLastChangedAt,
   LastChangedAt

}
