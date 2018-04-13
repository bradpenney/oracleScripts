SELECT productcategory, to_char(order_date,'yyyy') AS "Year", to_char(order_date,'W') AS "Week", sum(sales)
FROM sales_report
WHERE to_char(order_date,'yyyy') = 2013 AND to_char(order_date, 'MM') = 07
GROUP BY ROLLUP (to_char(order_date,'yyyy'), to_char(order_date,'W'), productcategory)
ORDER BY to_char(order_date,'yyyy'), to_char(order_date,'W'), productcategory;