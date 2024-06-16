
/*
Correlated Subqueries are subqueries that run once for each record in the main/outer query.

They return a scalar output(single value) for each of those records.

correlated subqueries can be used in either the select or where caluses
*/


-- for a give sales order id, how many line items in the sales order detail table have a quantity greater than 1

select 
SalesOrderID,
OrderDate,
SubTotal,
TaxAmt,
Freight,
TotalDue,
MultiOrderCout = 
(
SELECT COUNT(*) FROM AdventureWorks2022.Sales.SalesOrderDetail b
--correlating sales orderid from inner and outer query to be passed dynamically
where b.SalesOrderID = a.SalesOrderID
and b.OrderQty > 1
)
from AdventureWorks2022.Sales.SalesOrderHeader a;
