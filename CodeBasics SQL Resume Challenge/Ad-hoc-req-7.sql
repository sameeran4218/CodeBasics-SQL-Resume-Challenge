## 7.Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” 
## for each month . This analysis helps to get an idea of low and high-performing months
## and take strategic decisions. 
#The final report contains these columns: Month, Year, Gross sales Amount

SELECT * FROM fact_sales_monthly
SELECT * FROM fact_gross_price
SELECT * FROM dim_customer


SELECT 		
		YEAR(fm.date) `Year`,
        MONTHNAME(fm.date) `Month`,
		CONCAT(round(sum((fm.sold_quantity * g.gross_price))/1000000,2),'M') Gross_Sale
FROM fact_sales_monthly fm
INNER JOIN dim_customer c
ON fm.customer_code = c.customer_code
INNER JOIN fact_gross_price g
ON g.product_code = fm.product_code
WHERE c.customer = "Atliq Exclusive"
GROUP BY `Year`,`Month`
ORDER BY `Year`,`Month`