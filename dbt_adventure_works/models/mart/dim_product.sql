with int_product as (
    

    select *

    from {{ ref('int_product') }}


)



select ProductKey
    ,ProductAlternateKey
    ,ProductName
    ,ProductDescription
    ,ModelName
    ,ProductLine
    ,ProductCategory
    ,ProductSubcategory
    ,StandardCost
    ,Color
    ,Size
    ,SizeRange
    ,Weight
    ,WeightUnitMeasureCode
    ,SizeUnitMeasureCode
    ,Class
    ,Style
    ,DaysToManufacture     
    ,FinishedGoodsFlag
    ,SafetyStockLevel
    ,ReorderPoint
    ,ListPrice     
    ,DealerPrice


from int_product