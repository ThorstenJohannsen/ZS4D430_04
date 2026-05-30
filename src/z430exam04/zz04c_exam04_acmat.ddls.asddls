@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {  label: 'Warehouse' }
//@ObjectModel: { sapObjectNodeType.name: 'Zz04exam04_ACMAT view' }
@AccessControl.authorizationCheck: #NOT_ALLOWED
define root view entity ZZ04C_EXAM04_ACMAT
  provider contract transactional_query
  as projection on ZZ04R_EXAM04_ACMAT
  association [1..1] to ZZ04R_EXAM04_ACMAT as _BaseEntity on $projection.Matid = _BaseEntity.Matid
{
  key Matid,
  FactoryWarehouse,
  @Semantics: {
    quantity.unitOfMeasure: 'UnitMeas'
  }
  QuantWarehouse,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'UnitOfMeasure', 
      entity.name: 'I_UnitOfMeasureStdVH', 
      useForValidation: true
    } ]
  }
  UnitMeas,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  _BaseEntity
}
