/* 
Purpose: Join Order Details and Order Details Header Together
         To get the date of sale along with product category and sales amount
         
Author: Brad Penney
*/


SELECT orderid, productcategory, sales, order_date 
    FROM order_details d
    JOIN order_details_header h
        ON d.order_id = h.orderid;