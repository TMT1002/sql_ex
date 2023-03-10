SELECT 
	g.EnglishCountryRegionName AS CountryName, 
	COUNT(g.EnglishCountryRegionName) AS TotalCustomer
FROM 
	DimCustomer c
	JOIN DimGeography g ON c.GeographyKey = g.GeographyKey
GROUP BY 
	g.EnglishCountryRegionName
ORDER BY 
	TotalCustomer DESC