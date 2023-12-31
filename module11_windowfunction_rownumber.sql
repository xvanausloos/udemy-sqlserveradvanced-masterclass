-- Module 11 row number
SELECT 
	sod.SalesOrderID,
	sod.SalesOrderDetailID,
	sod.LineTotal,
	ProductIdLineTotal = SUM(sod.LineTotal) OVER(PARTITION BY sod.SalesOrderID),
	Ranking = ROW_NUMBER() OVER(PARTITION BY sod.SalesOrderId ORDER BY sod.LineTotal DESC) 
FROM [Sales].[SalesOrderDetail] as sod
ORDER BY 
	sod.SalesOrderID;

-- exercise 1 & 2
SELECT 
  ProductName = A.Name,
  A.ListPrice,
  ProductSubcategory = B.Name,
  ProductCategory = C.Name,
  PriceRank = ROW_NUMBER() OVER(ORDER BY A.ListPrice DESC)
FROM AdventureWorks2022.Production.Product A
  JOIN AdventureWorks2022.Production.ProductSubcategory B
    ON A.ProductSubcategoryID = B.ProductSubcategoryID
  JOIN AdventureWorks2022.Production.ProductCategory C
    ON B.ProductCategoryID = C.ProductCategoryID;

-- exercise 3
SELECT 
  ProductName = A.Name,
  A.ListPrice,
  ProductSubcategory = B.Name,
  ProductCategory = C.Name,
  PriceRank = ROW_NUMBER() OVER(ORDER BY A.ListPrice DESC),
  [Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC)
FROM AdventureWorks2022.Production.Product A
  JOIN AdventureWorks2022.Production.ProductSubcategory B
    ON A.ProductSubcategoryID = B.ProductSubcategoryID
  JOIN AdventureWorks2022.Production.ProductCategory C
    ON B.ProductCategoryID = C.ProductCategoryID;

-- exercise 4
SELECT 
  ProductName = A.Name,
  A.ListPrice,
  ProductSubcategory = B.Name,
  ProductCategory = C.Name,
  PriceRank = ROW_NUMBER() OVER(ORDER BY A.ListPrice DESC),
  [Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC),
  [Top 5 Price In Category] = 
	CASE 
		WHEN ROW_NUMBER() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC) <= 5 THEN 'Yes'
		ELSE 'No'
	END
FROM AdventureWorks2022.Production.Product A
  JOIN AdventureWorks2022.Production.ProductSubcategory B
    ON A.ProductSubcategoryID = B.ProductSubcategoryID
  JOIN AdventureWorks2022.Production.ProductCategory C
    ON B.ProductCategoryID = C.ProductCategoryID;


