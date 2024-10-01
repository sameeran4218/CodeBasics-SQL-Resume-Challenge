## Which channel helped to bring more gross sales in the fiscal year 2021 
## and the percentage of contribution? The final output contains these fields, 
## channel, gross_sales_mln, percentage
WITH temp AS (
		SELECT 
				c.channel,
				sum((m.sold_quantity *g.gross_price)) as total_sale
		FROM fact_sales_monthly m
		INNER JOIN fact_gross_price g
		ON m.product_code = g.product_code
		INNER JOIN dim_customer c
		ON c.customer_code =m.customer_code
		WHERE m.fiscal_year =2021
		GROUP BY c.channel
)
SELECT
	channel, round((total_sale/1000000),2) Total_Sale_Millions,
    round(((total_sale/(sum(total_sale)OVER()))*100),2) Percentage
FROM temp
ORDER BY Percentage DESC