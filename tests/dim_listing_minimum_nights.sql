select * from {{ ref("dim_listings_cleansed") }} where minimum_nights < 2 limit 10
