-- Test compares cardinality difference of models A and B, based on 2 columns with difference expected to be n. 
-- Therefore test returns a record when difference is unequal to n.
-- Test should be defined inline and takes 5 parameters:
--    'model'          ... model A (against which test is defined in)
--    'column_name'    ... column_name from model A for record count
--    'compare_to'     ... model B to compare to
--    'field'          ... field in model B to compare record count against
--    'n'              ... the expected exact difference in cardinality

{% test cardinality_difference_unequal_to_n(model, column_name, compare_to, field, n) %}


with count_a as (

    select count( {{ column_name }} ) as count
        
    from {{ model }}

),


count_b as (

    select count( {{ field }} ) as count
        
    from {{ compare_to}} 

)


select 1 as dummy_column

from count_a, count_b

where (count_a.count - count_b.count) <> {{ n }}


{% endtest %}






