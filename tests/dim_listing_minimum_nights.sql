SELECT
 *
FROM {{ ref('dim_listings_cleansed') }}
WHERE minimum_nights < 2
LIMIT 10