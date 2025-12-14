SELECT
     date,
    product_code,
    customer_code,
    sold_quantity,
    fiscal_year,
    CASE 
        WHEN MONTH(date) IN (9, 10, 11) THEN 'Q1'
        WHEN MONTH(date) IN (12, 1, 2) THEN 'Q2'
        WHEN MONTH(date) IN (3, 4, 5) THEN 'Q3'
        WHEN MONTH(date) IN (6, 7, 8) THEN 'Q4'
    END AS quarter
FROM gdb023.fact_sales_monthly;