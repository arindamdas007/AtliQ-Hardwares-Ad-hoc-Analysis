SELECT 
     c.customer_code,
     c.customer,
     ROUND(AVG(f.pre_invoice_discount_pct),2) as average_discount_percentage
FROM dim_customer c
JOIN fact_pre_invoice_deductions f
ON 
   c.customer_code = f.customer_code
WHERE c.market = "India" AND
	  f.fiscal_year = 2021
GROUP BY c.customer_code, c.customer
ORDER BY average_discount_percentage DESC
limit 5 ;