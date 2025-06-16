with base as (

    select
      -- natural keys identifying a single sales item
      SalesOrderNumber,
      SalesOrderLineNumber,

      -- foreign keys
      ProductKey,
      CustomerKey,
      PromotionKey,
      CurrencyKey,
      SalesTerritoryKey,
      OrderDateKey,
      DueDateKey,
      ShipDateKey,

      -- sales amount, quantity, UP etc.
      OrderQuantity,
      UnitPrice,
      SalesAmount,
      ExtendedAmount,
      DiscountAmount,
      UnitPriceDiscountPct,
      TotalProductCost,
      ProductStandardCost,
      TaxAmt,
      Freight

    from {{ source('sql-server-on-prem', 'FactInternetSales') }} -- noqa: disable=TMP, PRS

)

select *

from base
