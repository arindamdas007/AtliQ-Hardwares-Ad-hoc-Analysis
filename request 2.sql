# What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,

WITH unique_products_count as (
	SELECT 
		fiscal_year,
		COUNT(DISTINCT product_code) AS unique_products
	FROM gdb023.fact_sales_monthly
	GROUP BY fiscal_year
)
SELECT
   a.unique_products as unique_products_2020,
   b.unique_products as unique_products_2021,
   ROUND((b.unique_products -  a.unique_products)/a.unique_products*100,2) as percentage_chg
FROM unique_products_count a
CROSS JOIN unique_products_count b
WHERE a.fiscal_year=2020 
     AND b.fiscal_year=2021;

# Query 2A — Unique Product Increase by Division

WITH product_count_division AS (
SELECT 
    p.division,
    s.fiscal_year,
    COUNT(DISTINCT s.product_code) AS unique_products
FROM fact_sales_monthly s
JOIN dim_product p
ON p.product_code=s.product_code
GROUP BY  p.division,
          s.fiscal_year
)
SELECT
     pa.division,
     pa.unique_products as unique_products_2020,
     pb.unique_products as unique_products_2021,
     ROUND((pb.unique_products -  pa.unique_products)/pa.unique_products*100,2) as percentage_chg
FROM product_count_division pa
JOIN product_count_division pb
ON pa.division = pb.division
WHERE pa.fiscal_year=2020 AND    
	  pb.fiscal_year=2021
ORDER BY percentage_chg DESC;