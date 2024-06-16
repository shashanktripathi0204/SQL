-- Create a column with 365 rows, one for each date in the current year, to use as a calendar table, that other tables with date values can be tied into

--Example 1: generate number series with recursive CTE

WITH NumberSeries AS
(
-- anchor member
SELECT
 1 AS MyNumber

UNION  ALL

-- the recursive member
SELECT 
MyNumber + 1
FROM NumberSeries
--termination contion
WHERE MyNumber < 100
)

SELECT
MyNumber
FROM NumberSeries;



--Example 2: generate date series with recursive CTE

WITH Dates AS
(
SELECT
 CAST('01-01-2021' AS DATE) AS MyDate

UNION ALL

SELECT
DATEADD(DAY, 1, MyDate)
FROM Dates
WHERE MyDate < CAST('12-31-2021' AS DATE)
)

SELECT
MyDate

FROM Dates
OPTION (MAXRECURSION 365)

