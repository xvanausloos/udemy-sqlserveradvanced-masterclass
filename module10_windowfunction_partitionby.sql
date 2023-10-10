-- exercise 1 
SELECT 
	ProductName.Name,
	ProductName.ListPrice,
	ProductSubcategory.Name,
	ProductCategory.Name
FROM 
	Production.Product as ProductName 
JOIN Production.ProductSubcategory as ProductSubcategory
ON ProductName.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
JOIN Production.ProductCategory as ProductCategory
ON ProductCategory.ProductCategoryId = ProductSubcategory.ProductCategoryID

-- exercise 2 
SELECT 
	ProductName.Name,
	ProductName.ListPrice,
	ProductSubcategory.Name,
	ProductCategory.Name as Category,
	AvgPriceByCategory = AVG(ProductName.ListPrice) OVER(PARTITION BY ProductCategory.Name)
FROM 
	Production.Product as ProductName 
JOIN Production.ProductSubcategory as ProductSubcategory
ON ProductName.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
JOIN Production.ProductCategory as ProductCategory
ON ProductCategory.ProductCategoryId = ProductSubcategory.ProductCategoryID

-- exercise 3
SELECT 
	ProductName.Name,
	ProductName.ListPrice,
	ProductSubcategory.Name,
	ProductCategory.Name as Category,
	AvgPriceByCategory = AVG(ProductName.ListPrice) OVER(PARTITION BY ProductCategory.Name),
	AvgPriceByCategoryAndSubcategory = AVG(ProductName.ListPrice) 
		OVER(PARTITION BY ProductCategory.Name, ProductSubcategory.Name)
FROM 
	Production.Product as ProductName 
JOIN Production.ProductSubcategory as ProductSubcategory
ON ProductName.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
JOIN Production.ProductCategory as ProductCategory
ON ProductCategory.ProductCategoryId = ProductSubcategory.ProductCategoryID

-- exercise 4
SELECT 
	ProductName.Name,
	ProductName.ListPrice,
	ProductSubcategory.Name,
	ProductCategory.Name as Category,
	AvgPriceByCategory = AVG(ProductName.ListPrice) OVER(PARTITION BY ProductCategory.Name),
	AvgPriceByCategoryAndSubcategory = AVG(ProductName.ListPrice) 
		OVER(PARTITION BY ProductCategory.Name, ProductSubcategory.Name),
	ProductVsCategoryDelta = ProductName.ListPrice - avg(ProductName.ListPrice) OVER(PARTITION BY ProductCategory.Name)
FROM 
	Production.Product as ProductName 
JOIN Production.ProductSubcategory as ProductSubcategory
ON ProductName.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
JOIN Production.ProductCategory as ProductCategory
ON ProductCategory.ProductCategoryId = ProductSubcategory.ProductCategoryID
