@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Lagerbelegung'
@Metadata.ignorePropagatedAnnotations: true
define view entity z_r_zexam04_acmat as select from zexam04_acmat
{
    
    key factory_warehouse as FactoryWarehouse,
    key unit_meas as UnitMeas,
    @Semantics.quantity.unitOfMeasure : 'UnitMeas'
    sum(quant_warehouse) as QuantWarehouse
    
    
}
group by factory_warehouse, unit_meas
