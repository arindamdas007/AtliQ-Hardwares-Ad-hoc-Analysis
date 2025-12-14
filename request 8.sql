SELECT
	monthname(s.date) as month,
    CASE
     WHEN month(s.date) IN (9,10,11) THEN "Q1"
	 WHEN month(s.date) IN (12,1,2) THEN "Q2"
	 WHEN month(s.date) IN (3,4,5) THEN "Q3"
	 WHEN month(s.date) IN (6,7,8) THEN "Q4"
    END AS quarter,
   CONCAT(ROUND(SUM(s.sold_quantity)/1000000,2),"M") as total_sold_quantity
FROM fact_sales_monthly s
WHERE s.fiscal_year=2020
GROUP BY quarter
ORDER BY total_sold_quantity DESC;

# month-wise along with fiscal quarter and total sold quantity
SELECT
	monthname(s.date) as month,
    CASE
     WHEN month(s.date) IN (9,10,11) THEN "Q1"
	 WHEN month(s.date) IN (12,1,2) THEN "Q2"
	 WHEN month(s.date) IN (3,4,5) THEN "Q3"
	 WHEN month(s.date) IN (6,7,8) THEN "Q4"
    END AS quarter,
   CONCAT(ROUND(SUM(s.sold_quantity)/1000000,2),"M") as total_sold_quantity
FROM fact_sales_monthly s
WHERE s.fiscal_year=2020
GROUP BY month, quarter
ORDER BY quarter ASC;