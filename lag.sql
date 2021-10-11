WITH cte_sales AS (
	SELECT 
		month,
		brand_name,
		net_sales,
		LAG(net_sales,1) OVER (
			PARTITION BY brand_name
			ORDER BY month
		) previous_sales
	FROM 
		sales.vw_netsales_brands
	WHERE
		year = 2018
)

SELECT 
	month, 
	brand_name,
	net_sales, 
	previous_sales,
	FORMAT(
		(net_sales - previous_sales)  / previous_sales,
		'P'
	) vs_previous_month
FROM
	cte_sales;
