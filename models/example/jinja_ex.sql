{#

{% set Greeting = 'Hello!!'%}
  {{Greeting}} Neha
#}

{#

{%-set fruits = ['Apple','Mango','Tomato'] -%}
{%- for food in fruits -%}
  {%- if food == 'Tomato' -%}
      {%- set food_type = 'veggy' -%}
   {%- else -%}
      {%- set food_type = 'fruit' -%}
  {%- endif -%}
   The {{food}} is my fav {{food_type}}
{% endfor %}

#}

{%- set paymentmethods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}

with payments as (
   select * from {{ source('stripe','payment') }}
),

final as (
   select
       orderid,
       {% for paymentmethod in paymentmethods -%}

       sum(case when paymentmethod = '{{ paymentmethod }}' then amount else 0 end)
            as {{ paymentmethod }}_amount

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}
   from {{ source('stripe','payment') }}
   group by 1
)

select * from final



