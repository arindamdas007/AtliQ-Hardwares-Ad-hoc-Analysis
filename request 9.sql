# Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?

WITH temp_gross_sales AS (
  SELECT 
    c.channel,
   CONCAT(ROUND(SUM(s.sold_quantity * gp.gross_price)/1000000, 2),"M") AS gross_sales_mln
  FROM gdb023.fact_sales_monthly s
  JOIN gdb023.dim_customer c
    ON s.customer_code = c.customer_code
  JOIN gdb023.fact_gross_price gp
    ON s.product_code = gp.product_code
  WHERE s.fiscal_year=2021
  GROUP BY c.channel
  )
SELECT
     channel,
     gross_sales_mln,
     CONCAT(ROUND((gross_sales_mln*100)/SUM(gross_sales_mln) OVER (),2),"%") as percentage
FROM temp_gross_sales 
ORDER BY percentage DESC;