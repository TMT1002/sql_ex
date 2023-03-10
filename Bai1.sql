SELECT 
	FirstName + ' ' + LastName AS FullName,
	BirthDate,
	Gender,
	EmailAddress,
	EnglishEducation,
	Phone,
	AddressLine1,
	AddressLine2
FROM 
	DimCustomer c
	JOIN DimGeography g ON c.GeographyKey = g.GeographyKey
WHERE 
	g.CountryRegionCode = 'GB'