@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Abteilungen (Entität) Übung 11'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z04_R_Department as select from z04depment
association [0..*] to Z04_R_Employee as _Employee
   on $projection.Id = _Employee.DepartmentId
association [0..1] to Z04_R_Employee as _Head
   on $projection.DepartmentHead = _Head.EmployeeId
association [1..1] to Z04_R_Employee as _Assistant
    on $projection.DepartmentAssistant = _Assistant.EmployeeId
 
{
   key id as Id,
   description as Description,
   department_head as DepartmentHead,
   department_assistant as DepartmentAssistant,
   created_by as CreatedBy,
   created_at as CreatedAt,
   local_last_changed_by as LocalLastChangedBy,
   local_last_changed_at as LocalLastChangedAt,
   last_changed_at as LastChangedAt,
   _Employee,
   _Head,
   _Assistant
}

