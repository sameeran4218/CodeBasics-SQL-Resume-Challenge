## What is the percentage of unique product increase in 2021 vs. 2020?
## The final output contains these fields, unique_products_2020 
## unique_products_2021 percentage_chg

SELECT * FROM fact_sales_monthly;
SELECT Distinct product_code FROM fact_sales_monthly WHERE fiscal_year = 2020;
SELECT Distinct product_code FROM fact_sales_monthly WHERE fiscal_year = 2021;

WITH 
uniq_prod_2020 as (
	SELECT COUNT(DISTINCT product_code) AS unique_products_2020
    FROM fact_sales_monthly 
    WHERE fiscal_year =2020
),
uniq_prod_2021 as (
	SELECT COUNT(DISTINCT product_code) AS unique_products_2021
    FROM fact_sales_monthly 
    WHERE fiscal_year =2021
)

SELECT unique_products_2020,unique_products_2021,
		ROUND(((unique_products_2021-unique_products_2020)/unique_products_2020)*100,2)
        AS Percentage_change
FROM  uniq_prod_2020
CROSS JOIN uniq_prod_2021;
