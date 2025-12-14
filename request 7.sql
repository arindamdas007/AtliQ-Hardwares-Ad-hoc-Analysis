# Gross sales amount for the customer “Atliq Exclusive” for each month. 
SELECT 
    DATE_FORMAT(s.date, '%M (%Y)') AS Month,
    s.fiscal_year as year,
   CONCAT(ROUND(SUM(s.sold_quantity * g.gross_price)/1000000, 2),"M") AS Gross_Sales_Amount
FROM gdb023.fact_sales_monthly s
JOIN gdb023.dim_customer c
    ON s.customer_code = c.customer_code
JOIN gdb023.fact_gross_price g
    ON s.product_code = g.product_code 
WHERE c.customer = 'Atliq Exclusive'
GROUP BY Month, s.fiscal_year
ORDER BY s.fiscal_year;
         



