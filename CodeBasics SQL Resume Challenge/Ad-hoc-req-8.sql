## 8.In which quarter of 2020, got the maximum total_sold_quantity? 
## The final output contains these fields sorted by the total_sold_quantity, 
## Quarter ,total_sold_quantity

SELECT * FROM fact_sales_monthly;

SELECT 
CASE
WHEN m.date BETWEEN '2019-09-01'AND '2019-11-30' THEN 'Quarter 1'
WHEN m.date BETWEEN '2019-12-01'AND '2020-2-29' THEN 'Quarter 2'
WHEN m.date BETWEEN '2020-03-01'AND '2020-05-31' THEN 'Quarter 3'
WHEN m.date BETWEEN '2020-06-01'AND '2020-08-31' THEN 'Quarter 4'
END AS Quarters,
Concat(Round((sum(sold_quantity)/1000000),2),' M') Total_Sold_Quantity
FROM fact_sales_monthly m
WHERE fiscal_year =2020
GROUP BY Quarters
ORDER BY Total_Sold_Quantity desc
