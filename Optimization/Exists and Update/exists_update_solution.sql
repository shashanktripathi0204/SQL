--Starter Query:


SELECT
       A.PurchaseOrderID,
	   A.OrderDate,
	   A.TotalDue

FROM AdventureWorks2022.Purchasing.PurchaseOrderHeader A

WHERE EXISTS (
	SELECT
	1
	FROM AdventureWorks2022.Purchasing.PurchaseOrderDetail B
	WHERE A.PurchaseOrderID = B.PurchaseOrderID
		AND B.RejectedQty > 5
)

ORDER BY 1



--Re-write:
-- creating a temp table
CREATE TABLE #Purchases
(
PurchaseOrderID INT,
OrderDate DATE,
TotalDue MONEY,
RejectedQty INT
)


-- inserting values into the table
INSERT INTO #Purchases
(
PurchaseOrderID,
OrderDate,
TotalDue
)

--chechking the output of the table
SELECT
PurchaseOrderID,
OrderDate,
TotalDue

FROM AdventureWorks2022.Purchasing.PurchaseOrderHeader

-- inserting the updated value
UPDATE A
	SET RejectedQty = B.RejectedQty

FROM #Purchases A
	JOIN AdventureWorks2022.Purchasing.PurchaseOrderDetail B
		ON A.PurchaseOrderID = B.PurchaseOrderID
WHERE B.RejectedQty > 5



SELECT * FROM #Purchases WHERE RejectedQty IS NOT NULL


DROP TABLE #Purchases



