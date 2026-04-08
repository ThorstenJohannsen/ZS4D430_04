@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter (Assozitation) Übung 12'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z04_C_EmployeeQuery as select from Z04_R_Employee
{
    key EmployeeId,
    FirstName,
    LastName,
//    BirthDate,
//    EntryDate,
    DepartmentId,
    _Department.Discription as DepartmentDescription,
    _Department._Assistant.LastName as AssistantName,
//    AnnualSalary,
//    CurrencyCode,
//    CreatedBy,
//    CreatedAt,
//    LocalLastChangedBy,
//    LocalLastChangedAt,
//    LastChangedAt,
    /* Associations */
    _Department
}
