## 6.Generate a report which contains the top 5 customers who received an average
## high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.
## The final output contains these fields, 
## customer_code ,customer, average_discount_percentage

SELECT * FROM dim_customer;
SELECT * FROM fact_pre_invoice_deductions;

SELECT  c.customer_code, c.customer,
		ROUND(avg(Pre_In.pre_invoice_discount_pct),4) AVG_Pre_Invoice_Disc_Perc
FROM dim_customer c
INNER JOIN fact_pre_invoice_deductions Pre_In
ON c.customer_code = Pre_In.customer_code
WHERE c.market = 'India'
AND Pre_In.fiscal_year = 2021
GROUP BY c.customer_code, c.customer
ORDER BY AVG_Pre_Invoice_Disc_Perc desc
LIMIT 5