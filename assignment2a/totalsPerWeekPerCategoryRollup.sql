/* 
Author: Brad Penney, April 2018
Purpose: Rollup the data from sales_report to produce the needed results for monthly sales revenue
*/

SPOOL /bkuprecScripts/auditLogs/totalsPerWeekPerCategoryRollup.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;

SELECT productcategory, to_char(order_date,'yyyy') AS "Year", to_char(order_date, 'MM') as "Month", to_char(order_date,'W') AS "Week", sum(sales) AS "Sales"
FROM sales_report
WHERE to_char(order_date,'yyyy') = 2013 AND to_char(order_date, 'MM') = 07
GROUP BY CUBE (to_char(order_date,'yyyy'), to_char(order_date, 'MM'), to_char(order_date,'W'), productcategory)
ORDER BY to_char(order_date,'yyyy'), to_char(order_date, 'MM'), to_char(order_date,'W'), productcategory;

SPOOL off;