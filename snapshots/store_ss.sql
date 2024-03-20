
{% snapshot store_snapshot %}


{{ config(
   target_schema='snapshot',
   unique_key='S_STORE_ID',
   strategy='check',
   check_cols=['S_STORE_NAME','S_MANAGER','S_MARKET_MANAGER']
) }}

select * from {{ source('raw','store') }}

{% endsnapshot %}
