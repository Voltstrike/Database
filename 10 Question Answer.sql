Use Tstore

/*E1*/
Select [Transaction] = count(*), [Staff Name] = s.[Name], [Vendor Name] = v.[Name] 
From [PurchaseTransaction] pt
JOIN [Staff] s ON pt.[Staff ID] = s.[ID]
JOIN [Vendor] v ON pt.[Vendor ID] = v.[ID]
Where s.[Salary] Between 5000000 AND 10000000 AND v.[Name] LIKE('%o%')
Group BY s.[Name], v.[Name]

/*E2*/
Select [Sales ID] = st.[Sales ID], [Sales Date] = st.[SalesDate], [Customer Name] = c.[Name], [Customer Address] = c.[Address]
FROM [SalesTransaction] st
JOIN [Customer] c ON st.[Customer ID] = c.[ID]
WHERE DATEPART(day, st.[SalesDate]) = DATEPART(day, '2020/11/15')

/*E3*/
Select [Month] = DATENAME(month, DATEADD(MONTH,-1,st.[SalesDate])),
[Transaction Count] = COUNT(st.[Sales ID]),
[Cloth Sold Count] = SUM(st.[Qty])
From [SalesTransaction] st
JOIN [Cloth] cl ON st.[ClothesSold] = cl.[Cloth ID]
JOIN [Staff] s ON st.[Staff ID] = s.[ID]
WHERE s.[Gender] LIKE 'Female' AND cl.[Price] > 70000
Group By st.[SalesDate]

/*E4*/
Select SUBSTRING(c.[Brand], CHARINDEX(' ', c.[Brand])+ 1, LEN(c.[Brand]) - CHARINDEX(' ', c.[Brand])) AS [Last Name of Brand],
[Cloth Sold Count] = MAX(st.[Qty])
FROM [Cloth] c
JOIN [SalesTransaction] st ON st.[ClothesSold] = c.[Cloth ID] 
WHERE st.[Qty] Between 5 AND 10
Group By c.[Brand]

/*E5*/
Select [Brand] = c.[Brand], [Price] = c.[Price], [Stock] = c.[Stock]
FROM [Cloth] c
JOIN [PurchaseTransaction] pt ON c.[Cloth ID] = pt.[ClothesPurchased]
JOIN [PurchaseTransaction_Vendor] ptv ON pt.[ID] = ptv.PurchaseTransactionPurchaseID
Group By c.[Brand], c.[Price], c.[Stock]
Having c.[Price] > 
(Select [Price] 
From [Cloth] cl
WHERE cl.[Brand] LIKE ('Saad %')) - 35000 AND c.[Price] < 
(Select [Price]
From [Cloth] cl
Where cl.[Brand] LIKE('Saad %'))

/*E6*/
Select [Sales Date] = CONVERT(Varchar, st.[SalesDate],103), [Brand] = cl.[Brand], [Quantity] = st.[Qty]
FROM [SalesTransaction] st
JOIN [Cloth] cl ON st.[ClothesSold] = cl.[Cloth ID]
Where st.[Qty] > (SELECT COUNT(stra.[Sales ID]) FROM [SalesTransaction] stra WHERE MONTH(st.[SalesDate]) = 4) 

/*E7*/
Select [Purchase ID] = pt.[ID], Lower(s.[Name]) As [Staff Name], [Staff Salary] = CONCAT('IDR ', s.[Salary]), 
Convert(Varchar,pt.[PurchaseDate] ,107) as [Purchase Date], [Total Quantity] = SUM(pt.[Qty])
FROM [PurchaseTransaction] pt
JOIN [Staff] s ON pt.[Staff ID] = s.[ID]
JOIN PurchaseTransaction_Vendor ptv ON pt.[ID] = ptv.PurchaseTransactionPurchaseID,
(Select MIN(ptv.[Qty]) AS MinQuantity 
FROM PurchaseTransaction_Vendor ptv 
JOIN [PurchaseTransaction] pt ON pt.[ID] = ptv.PurchaseTransactionPurchaseID
WHERE DATEPART(MONTH, pt.[PurchaseDate]) = 4) AS MinimumQty
WHERE pt.[Qty] > MinimumQty.MinQuantity
Group by pt.[ID], s.[Name], s.[Salary], pt.[PurchaseDate]

/*E8*/
Select [Vendor ID] = SUBSTRING(v.[ID],3,3), [Vendor Name] = v.[Name], 
[Clothes Bought] = CAST(SUM(pt.[Qty]) AS VARCHAR) + ' piece(s)', [Vendor Phone] = REPLACE(v.[Phone Number], '08', '+62')
From [Vendor] v
JOIN [PurchaseTransaction] pt ON v.[ID] = pt.[Vendor ID]
JOIN PurchaseTransaction_Vendor ptv ON pt.[ID] = ptv.PurchaseTransactionPurchaseID,
(Select AVG(ptvs.Qty) AS Quantity From PurchaseTransaction_Vendor ptvs) AS AVGQuantity
Where ptv.Qty >  AVGQuantity.Quantity
Group By v.[ID], v.[Name],v.[Phone Number]
Having SUM(ptv.Qty) < 100

/*E9*/
Create View StoreSalesView AS
Select [Sales ID] = st.[Sales ID], 
[CustomerName] = c.[Name], [CustomerPhone] = c.[Phone Number],
[Cloth Average Price] = 'IDR '+ CAST(AVG(cl.[Price])AS VARCHAR),
[Sales Quantity] = CAST(SUM(st.[Qty]) AS VARCHAR) + ' piece(s)'
From [SalesTransaction] st
JOIN [Customer] c ON st.[Customer ID] = c.[ID]
JOIN [Cloth] cl ON st.[ClothesSold] = cl.[Cloth ID]
GROUP BY st.[Sales ID], c.[Name], c.[Phone Number]
HAVING AVG(cl.[Price]) > 100000 AND SUM(st.[Qty]) > 4

Select * From StoreSalesView

/*E10*/
Create View StorePurchaseView AS
Select [Purchase Month] = DATENAME(MONTH, pt.[PurchaseDate]) , [Minimum Purchase Quantity] = MIN(pt.[Qty]),
[Purchased Cloth Count] = SUM(pt.[Qty])
From [PurchaseTransaction] pt
JOIN [Cloth] cl ON pt.[ClothesPurchased] = cl.[Cloth ID]
GROUP BY DATENAME(MONTH, pt.[PurchaseDate])
HAVING MIN(pt.[Qty]) > 10 AND SUM(pt.[Qty]) > 1

select * from StorePurchaseView
