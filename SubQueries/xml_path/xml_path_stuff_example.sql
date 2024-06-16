--Step 1
-- get the count
		  SELECT
		  COUNT(*)
		  FROM AdventureWorks2022.Sales.SalesOrderDetail A
		  WHERE A.SalesOrderID = 43659



--Step 2:
-- get al the values
		  SELECT
		  *
		  FROM AdventureWorks2022.Sales.SalesOrderDetail A
		  WHERE A.SalesOrderID = 43659

--Step 3:
-- get the required column
		  SELECT
		  LineTotal
		  FROM AdventureWorks2022.Sales.SalesOrderDetail A
		  WHERE A.SalesOrderID = 43659


--Step 4:
-- create an xml value, of the required column
		  SELECT
		  LineTotal
		  FROM AdventureWorks2022.Sales.SalesOrderDetail A
		  WHERE A.SalesOrderID = 43659
		  FOR XML PATH('')

--Step 5:
-- transform the value to an accepteable value
		  SELECT
		  ',' + CAST(CAST(LineTotal AS MONEY) AS VARCHAR)
		  FROM AdventureWorks2022.Sales.SalesOrderDetail A
		  WHERE A.SalesOrderID = 43659
		  FOR XML PATH('')

--Step 6:
-- add the stuff to delete extra/unwanted characters
SELECT
	STUFF(
		  (
			  SELECT
			  ',' + CAST(CAST(LineTotal AS MONEY) AS VARCHAR)
			  FROM AdventureWorks2022.Sales.SalesOrderDetail A
			  WHERE A.SalesOrderID = 43659
			  FOR XML PATH('')
		  ),
		  1,1,'I''m stuffed!')



--Step 7:
-- use correlated subqueires to get the values
SELECT 
       SalesOrderID
      ,OrderDate
      ,SubTotal
      ,TaxAmt
      ,Freight
      ,TotalDue
	  ,LineTotals = 
		STUFF(
			  (
				  SELECT
				  ',' + CAST(CAST(LineTotal AS MONEY) AS VARCHAR)
				  FROM AdventureWorks2022.Sales.SalesOrderDetail B
				  WHERE A.SalesOrderID = B.SalesOrderID 
				  FOR XML PATH('')
			  ),
			  1,1,''
		  )

FROM AdventureWorks2022.Sales.SalesOrderHeader A

