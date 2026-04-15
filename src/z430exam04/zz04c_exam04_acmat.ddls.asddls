@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'Zz04exam04_ACMAT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZZ04C_EXAM04_ACMAT
  provider contract TRANSACTIONAL_QUERY
  as projection on ZZ04R_EXAM04_ACMAT
  association [1..1] to ZZ04R_EXAM04_ACMAT as _BaseEntity on $projection.MATID = _BaseEntity.MATID
{
  key Matid,
  FactoryWarehouse,
  @Semantics: {
    Quantity.Unitofmeasure: 'UnitMeas'
  }
  QuantWarehouse,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  UnitMeas,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
