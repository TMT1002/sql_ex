SELECT 
	FactProductInventory.ProductKey,
	p.EnglishProductName AS ProductName,
	p.ModelName,
	pc.EnglishProductCategoryName AS ProductCategoryName,
	psc.EnglishProductSubcategoryName AS ProductSubcategoryName,
	FactProductInventory.UnitsBalance,
	FactProductInventory.UnitCost
FROM
	FactProductInventory
	INNER JOIN (SELECT ProductKey, MAX(MovementDate) AS LastDate
	FROM FactProductInventory GROUP BY ProductKey) AS fpi 
	ON FactProductInventory.ProductKey = fpi.ProductKey AND FactProductInventory.MovementDate = fpi.LastDate
	INNER JOIN DimProduct p ON fpi.ProductKey = p.ProductKey
	INNER JOIN DimProductSubcategory psc ON p.ProductSubcategoryKey = psc.ProductSubcategoryKey
	INNER JOIN DimProductCategory pc ON psc.ProductCategoryKey = pc.ProductCategoryKey

	-- muốn bỏ đi các sp ko có model hoặc category hoặc subcategory thì đổi thành inner join