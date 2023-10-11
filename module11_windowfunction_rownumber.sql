-- Module 11 row number
SELECT 
	sod.SalesOrderID,
	sod.SalesOrderDetailID,
	sod.LineTotal,
	ProductIdLineTotal = SUM(sod.LineTotal) OVER(PARTITION BY sod.SalesOrderID),
	Ranking = ROW_NUMBER() OVER(PARTITION BY sod.SalesOrderId ORDER BY sod.LineTotal) 
FROM [Sales].[SalesOrderDetail] as sod
ORDER BY 
	sod.SalesOrderID;