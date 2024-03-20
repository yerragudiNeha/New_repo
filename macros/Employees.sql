
{% macro append_mode(source_schema, source_table) %}
   
   with cte as(
    
       select * FROM {{source(source_schema, source_table) }}
)
   
select 
   *
from cte

{% endmacro %}

