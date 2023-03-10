/*
SELECT 
	isr.SalesOrderNumber,
	isr.SalesOrderLineNumber,
	c.FirstName + ' ' + c.LastName AS CustomerName,
	ns.ProductName,
	OrderQuantity,
	UnitPrice,
	DiscountAmount,
	SalesAmount
FROM
	FactInternetSales s
	INNER JOIN (SELECT p.ProductKey,p.EnglishProductName AS ProductName FROM DimProduct p WHERE p.EnglishProductName = 'Road-150 Red, 48' ) 
	AS ns ON s.ProductKey = ns.ProductKey
	INNER JOIN DimCustomer c ON s.CustomerKey = c.CustomerKey
	INNER JOIN FactInternetSalesReason isr ON s.SalesTerritoryKey = isr.SalesReasonKey
*/
SELECT 
	SalesOrderNumber,
	SalesOrderLineNumber,
	c.FirstName + ' ' + c.LastName AS CustomerName,
	ns.ProductName,
	OrderQuantity,
	UnitPrice,
	DiscountAmount,
	SalesAmount
FROM
	FactInternetSales s
	INNER JOIN (SELECT p.ProductKey,p.EnglishProductName AS ProductName FROM DimProduct p WHERE p.EnglishProductName = 'Road-150 Red, 48' ) 
	AS ns ON s.ProductKey = ns.ProductKey
	INNER JOIN DimCustomer c ON s.CustomerKey = c.CustomerKey