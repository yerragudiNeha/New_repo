{{ 
   config(
   materialized='table'
) }}

{{ append_mode('raw', 'item')}}
