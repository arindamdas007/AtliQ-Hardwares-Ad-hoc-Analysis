WITH product_cnt_segment AS (
SELECT
     p.segment,
     s.fiscal_year,
     COUNT(DISTINCT s.product_code) AS product_count
FROM fact_sales_monthly s
JOIN dim_product p
ON p.product_code=s.product_code
GROUP BY p.segment,
         s.fiscal_year
)
SELECT
   a.segment,
   a.product_count as product_count_2020,
   b.product_count as product_count_2021,
   b.product_count - a.product_count as difference
FROM product_cnt_segment  as a
JOIN product_cnt_segment  as b
ON a.segment=b.segment
   AND a.fiscal_year=2020
   AND b.fiscal_year=2021
ORDER BY difference DESC;





