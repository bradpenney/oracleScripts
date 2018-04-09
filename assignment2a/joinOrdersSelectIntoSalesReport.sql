/* 
Purpose: Join Order Details and Order Details Header Together
        To get the date of sale along with product category and sales amount
        Created new table with only this data called sales_report
         
Author: Brad Penney
*/

CREATE TABLE sales_report AS
    SELECT orderid, productid, productcategory, sales, order_date
        FROM order_details d
        JOIN order_details_header h
            ON d.order_id = h.orderid;