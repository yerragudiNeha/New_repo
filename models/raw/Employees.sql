{{ 
   config(
   materialized='table'
) 
}}

with cte as(
      select * from  {{source ('raw','employee_details')}}
   ) 
select employee_id,
           employee_first_name,
           employee_last_name,
           department,
           designation,
           employee_address,
           employee_email,
           employee_phone_number,
           last_modified_timestamp

from cte

