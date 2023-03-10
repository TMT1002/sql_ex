SELECT TOP 100
	p.EnglishProductName AS ProductName,
	p.ModelName,
	p.ProductLine,
	pc.EnglishProductCategoryName AS ProductCategoryName,
	ps.EnglishProductSubcategoryName AS ProductSubcategoryName,
	p.DealerPrice,
	p.ListPrice,
	p.Color,
	p.EnglishDescription AS Description
FROM 
	DimProduct p
	JOIN DimProductSubcategory ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
	JOIN DimProductCategory pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
ORDER BY 
	p.ListPrice DESC
