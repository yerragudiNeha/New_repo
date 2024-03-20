{{
    config(
       materialized= 'incremental'
    )
}}

{{ Append_key_not_found('stripe','payment','orderid') }}