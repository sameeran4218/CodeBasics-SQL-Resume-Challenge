## Get the Top 3 products in each division that have a high total_sold_quantity 
## in the fiscal_year 2021? The final output contains these fields,
# division,product_code,product,total_sold_quantity, rank_order
WITH temp AS(
		SELECT  p.division,
				p.product_code,
                CONCAT(p.product,"(",p.variant ,")") Product,
				SUM(m.sold_quantity) Total_sold,
				RANK()OVER(partition by p.division order by SUM(sold_quantity) DESC) as rank_order
		from fact_sales_monthly m
		INNER JOIN dim_product p
		ON m.product_code = p.product_code 
		WHERE fiscal_year =2021 
		GROUP BY p.product_code,p.division,p.product,p.variant
        )
SELECT *
FROM temp
WHERE rank_order IN (1,2,3)
