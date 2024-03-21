{{ 
   config(
   materialized='table',
    pre_hook="{{ store_hook('raw','store') }}"
) }}

{{ store_hook('raw','store') }}
