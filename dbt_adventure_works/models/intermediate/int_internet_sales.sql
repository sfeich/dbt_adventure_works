{{ simple_cte_star([
       ('sales_base', 'stg_internet_sales'),
       ('sales_reason','stg_internet_sales_reason')
]) }},



sales_reason_row_number as (

    select res.*,
        row_number() over (
        partition by res.SalesOrderNumber, res.SalesOrderLineNumber
        order by res.SalesReasonKey) as row_number
    
    from sales_reason as res

),


sales_reason_count as (

    select SalesOrderNumber
       ,SalesOrderLineNumber
       ,count(*) as NoOfSalesReasons

    from sales_reason 

    group by SalesOrderNumber
       ,SalesOrderLineNumber

),


joined as (


    select

        -- natural keys identifying a single sales item 
        bas.SalesOrderNumber
        ,bas.SalesOrderLineNumber

        -- foreign keys
        ,bas.ProductKey
        ,bas.CustomerKey
        ,bas.PromotionKey
        ,bas.CurrencyKey
        ,bas.SalesTerritoryKey
        -- default value 0 for records with absent sales reason
        ,coalesce(res.SalesReasonKey,0) as SalesReasonKey
        ,bas.OrderDateKey
        ,bas.DueDateKey
        ,bas.ShipDateKey

        -- sales amount,bas. quantity,bas. UP etc.
        ,bas.OrderQuantity
        ,bas.UnitPrice
        ,bas.SalesAmount
        ,bas.ExtendedAmount
        ,bas.DiscountAmount
        ,bas.UnitPriceDiscountPct
        ,bas.TotalProductCost
        ,bas.ProductStandardCost  
        ,bas.TaxAmt
        ,bas.Freight
        ,coalesce(cnt.NoOfSalesReasons,0) as NoOfSalesReasons


    from sales_base as bas 
       left join sales_reason_row_number as res 
          on bas.SalesOrderNumber = res.SalesOrderNumber 
             and bas.SalesOrderLineNumber = res.SalesOrderLineNumber 
             and res.row_number = 1 
       left join sales_reason_count as cnt
          on bas.SalesOrderNumber = cnt.SalesOrderNumber 
             and bas.SalesOrderLineNumber = cnt.SalesOrderLineNumber 


)



select *

from joined







