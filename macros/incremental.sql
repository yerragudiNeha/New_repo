{% macro Append_key_not_found(source_schema,source_table,key_value,column_value)%}

with cte as (
    select * from {{source(source_schema,source_table)}}
)

select * from cte
  {% if is_incremental()%}
       
       where status='{{column_value}}'' and
      {{key_value}} not in (select {{key_value}} from {{this}} )
      
  {% endif%}

{% endmacro %}