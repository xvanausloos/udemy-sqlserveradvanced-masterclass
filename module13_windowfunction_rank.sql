-- Module 13 rank and dense rank
SELECT 
	sod.SalesOrderID,
	sod.SalesOrderDetailID,
	sod.LineTotal,
	Ranking = ROW_NUMBER() OVER(PARTITION BY sod.SalesOrderId ORDER BY sod.LineTotal DESC),
	RankingWithRank = RANK() OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC),
	RankinWithDenseRank = DENSE_RANK() OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC)
FROM [Sales].[SalesOrderDetail] as sod
ORDER BY 
	sod.SalesOrderID;
