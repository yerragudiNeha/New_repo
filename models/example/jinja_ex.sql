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

{% set payment_menthods = ['Bank_transfer', 'credit_card', 'gift_card', 'coupon']%}

with cte as (
    select * from {{source('stripe','payment')}}
),

select 
  order_id,
  {% for payment_method in payment_methods %}
     sum(case when payment_method={{'payment_methods'}}) then amount else 0 end) as {{payment_methods}}_amount 
     {% if not loop.last%}
       ,
    {% endif%}
   {%endfor%}
   from cte
   





