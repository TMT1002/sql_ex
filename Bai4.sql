SELECT 
	fa.AccountDescription,
	SUM(CASE WHEN o.OrganizationName = 'France' THEN f.Amount END) AS France,
	SUM(CASE WHEN o.OrganizationName = 'Germany' THEN f.Amount END) AS Germany,
	SUM(CASE WHEN o.OrganizationName = 'Australia' THEN f.Amount END) AS Australia
FROM 
	FactFinance f
	JOIN DimAccount fa ON f.AccountKey = fa.AccountKey
	JOIN DimOrganization o ON f.OrganizationKey = o.OrganizationKey
WHERE 
	o.OrganizationName IN ('France', 'Germany', 'Australia')
GROUP BY 
	fa.AccountDescription

