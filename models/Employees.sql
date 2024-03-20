{{ 
   config(
   materialized='table'
) }}

{{ append_mode('raw', 'employee_details')}}
