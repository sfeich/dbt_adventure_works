{{ simple_cte_star([
       ('sales_base', 'stg_internet_sales'),
       ('sales_reason','stg_internet_sales_reason')
]) }},


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
        ,res.SalesReasonKey
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


    from sales_base as bas 
       left join sales_reason as res 
          on bas.SalesOrderNumber = res.SalesOrderNumber 
             and bas.SalesOrderLineNumber = res.SalesOrderLineNumber     


)



select *

from joined
