# all the unique product counts for each segment and sort them in descending order of product counts

SELECT
    p.segment,
    COUNT(DISTINCT p.product_code) AS unique_product_count
FROM dim_product p
GROUP BY segment
ORDER BY unique_product_count DESC;
