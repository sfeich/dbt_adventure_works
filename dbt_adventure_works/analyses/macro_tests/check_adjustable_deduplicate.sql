-- noqa: disable=TMP, PRS
{{ adjustable_deduplicate('stg_customer', 'GeographyKey', order_by='CustomerKey', ties='Y') }};
{{ adjustable_deduplicate('stg_customer', 'GeographyKey', order_by='CustomerKey', ties='N') }}
-- noqa: enable=TMP, PRS