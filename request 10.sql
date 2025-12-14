# the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021

WITH cte1 AS (
	SELECT 
		 p.division,
		 p.product_code,
		 p.product,
		 SUM(s.sold_quantity) AS total_sold_qty
	FROM dim_product p
	JOIN fact_sales_monthly s
	ON p.product_code = s.product_code
	WHERE s.fiscal_year = 2021
	GROUP BY p.product,p.division,
		 p.product_code
    ),
cte2 AS(
SELECT
   *,
   DENSE_RANK() OVER(PARTITION BY DIVISION ORDER BY total_sold_qty DESC) AS rank_order
FROM cte1)
SELECT 
    *
FROM cte2
WHERE rank_order<=3;
    
     