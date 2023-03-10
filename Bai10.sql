SELECT TOP 20
	ResellerName,
	r.ResellerKey,
	rs.TotalQuantity,
	rs.TotalOrderCost
FROM
	DimReseller r
	LEFT JOIN (SELECT ResellerKey,
	SUM(TotalProductCost) AS TotalOrderCost,
	SUM(OrderQuantity) AS TotalQuantity
	FROM FactResellerSales GROUP BY ResellerKey) AS rs ON r.ResellerKey = rs.ResellerKey
ORDER BY rs.TotalOrderCost DESC