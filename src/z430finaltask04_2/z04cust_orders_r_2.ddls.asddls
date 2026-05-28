@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung 430 View R für CustOrders'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z04CUST_ORDERS_R_2 
    with parameters
    p_customer_id : z04_customerid
    as select from z04cust_orders_2
    association [1..1] to z04_customers_r2 as _Customer 
        on $projection.CustomerId = _Customer.CustomerId
{
    key order_id as OrderId,
    customer_id as CustomerId,
    order_date as OrderDate,
    @Semantics.amount.currencyCode: 'Currency'
    amount as Amount,
    currency as Currency,
    
    _Customer
}
where
    customer_id = $parameters.p_customer_id
    or $parameters.p_customer_id = '*' // Nur ID oder Stern erlaubt
