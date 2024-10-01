##Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
## The final output contains these fields, 
## segment product_count_2020 product_count_2021 difference
SELECT * FROM dim_product;
SELECT * FROM fact_sales_monthly;


WITH 
CTE_2020 AS(

			SELECT
            p.segment  segment, 
            count(DISTINCT p.product_code) as product_count
			FROM dim_product p
			INNER JOIN fact_sales_monthly m
			ON p.product_code =m.product_code
            WHERE m.fiscal_year = 2020
			GROUP BY p.segment
),
CTE_2021 AS(

			SELECT p.segment segment, 
            count(DISTINCT p.product_code) as product_count
			FROM dim_product p
			INNER JOIN fact_sales_monthly m
			ON p.product_code =m.product_code
            WHERE m.fiscal_year = 2021
			GROUP BY p.segment
)
SELECT CTE_2020.segment,CTE_2020.product_count AS product_count_2020,
		CTE_2021.product_count AS product_count_2021,
        (CTE_2021.product_count - CTE_2020.product_count) Difference
FROM CTE_2020
CROSS JOIN CTE_2021
WHERE CTE_2020.segment = CTE_2021.segment ;











































