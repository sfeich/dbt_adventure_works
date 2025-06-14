-- noqa: disable=TMP,PRS
{{ tsql_utils.fabric__test_sequential_values(source('sql-server-on-prem', 'DimCustomer'), 'CustomerKey') }}
-- noqa: enable=TMP