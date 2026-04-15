@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'Zz04exam04_ACMAT'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZZ04R_EXAM04_ACMAT
  as select from ZEXAM04_ACMAT as Stock
{
  key matid as Matid,
  factory_warehouse as FactoryWarehouse,
  @Semantics.quantity.unitOfMeasure: 'UnitMeas'
  quant_warehouse as QuantWarehouse,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  unit_meas as UnitMeas,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
