
{% macro store_hook(source_schema, source_table) %}
   
   with cte as(
    
       select * FROM {{source(source_schema, source_table) }}
)
   
select 
   s_store_sk,
   s_store_id,
   s_rec_start_date,
   s_rec_end_date,
   s_store_name,
   s_number_employees,
   s_manager,
   s_market_id,
   s_tax_precentage
from cte

{% endmacro %}

