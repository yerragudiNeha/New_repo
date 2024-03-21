{{
    config(
        materialized='view'
    )
    
}}

with cte as(
    select * from {{ref('Employees')}}
)

select employee_first_name, 
employee_id,
employee_last_name 
from cte 