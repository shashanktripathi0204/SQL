--Example 1

SELECT
[Accessories],
[Bikes],
[Clothing],
[Components]

FROM
(
SELECT
	   ProductCategoryName = D.Name,
	   A.LineTotal

FROM AdventureWorks2022.Sales.SalesOrderDetail A
	JOIN AdventureWorks2022.Production.Product B
		ON A.ProductID = B.ProductID
	JOIN AdventureWorks2022.Production.ProductSubcategory C
		ON B.ProductSubcategoryID = C.ProductSubcategoryID
	JOIN AdventureWorks2022.Production.ProductCategory D
		ON C.ProductCategoryID = D.ProductCategoryID
) E

PIVOT(
SUM(LineTotal)
FOR ProductCategoryName IN([Accessories],[Bikes],[Clothing],[Components])
) F

ORDER BY 1



--- Example 2

SELECT
[Order Quantity] = OrderQty,
[Bikes],
[Clothing]

FROM
(
SELECT
	   ProductCategoryName = D.Name,
	   A.LineTotal,
	   A.OrderQty

FROM AdventureWorks2022.Sales.SalesOrderDetail A
	JOIN AdventureWorks2022.Production.Product B
		ON A.ProductID = B.ProductID
	JOIN AdventureWorks2022.Production.ProductSubcategory C
		ON B.ProductSubcategoryID = C.ProductSubcategoryID
	JOIN AdventureWorks2022.Production.ProductCategory D
		ON C.ProductCategoryID = D.ProductCategoryID
) E

PIVOT(
SUM(LineTotal)
FOR ProductCategoryName IN([Bikes],[Clothing])
) F

ORDER BY 1