Create Database Tstore

use Tstore

Create Table [Staff](
	[ID] VARCHAR(6) PRIMARY KEY CHECK([ID] LIKE 'ST[0-9][0-9][0-9]'),
	[Name] VARCHAR(100),
	[Address] VARCHAR(255),
	[Phone Number] VARCHAR(20) CHECK([Phone Number] LIKE '08%'),
	[Gender] VARCHAR(10),
	[Email] VARCHAR(255),
	[Salary] INT CHECK (Salary >= 3000000)
)

drop table [Staff]

Create Table [Vendor](
    [ID] VarChar(6) Primary Key CHECK([ID] LIKE 'VE[0-9][0-9][0-9]'),
    [Name] Varchar(100) not null,
    [Address] Varchar(255) not null,
    [Phone Number] Varchar(20) not null CHECK([Phone Number] LIKE '08%'),
    [Email] Varchar(255) not null
)
drop table [Vendor]



Create Table [PurchaseTransaction](
    [ID] Varchar(6) PRIMARY KEY CHECK([ID] LIKE 'PU[0-9][0-9][0-9]') NOT NULL,
    [Staff ID] VarChar(6) Not Null,
    [Vendor ID] Varchar(6)  not null,

    [PurchaseDate] datetime CHECK([PurchaseDate] < dateadd(hh, -1, getdate()) ) not null,

    [ClothesPurchased] varchar(6) FOREIGN KEY REFERENCES [Cloth]([Cloth ID]),
    [Qty] int not null
)

Alter Table [PurchaseTransaction]
ADD FOREIGN KEY ([Staff ID]) REFERENCES [Staff]([ID])

Alter Table [PurchaseTransaction]
ADD FOREIGN KEY ([Vendor ID]) REFERENCES [Vendor]([ID])

drop table [PurchaseTransaction]

Create Table [Customer](
    [ID] VarChar(6) Primary Key CHECK([ID] LIKE 'CU[0-9][0-9][0-9]'), 
    [Name] Varchar(100) not null,
    [Address] Varchar(255) not null,
    [Phone Number] Varchar(20) not null CHECK([Phone Number] LIKE '08%'),
    [Gender] Varchar(10) not null,
    [Email] Varchar(255) not null
)
drop table [Customer]

Create Table [SalesTransaction](
    [Sales ID] Varchar(6) Primary Key CHECK([Sales ID] LIKE 'SA[0-9][0-9][0-9]'),
    [Staff ID] Varchar(6),
    [Customer ID] Varchar(6),
    [SalesDate] datetime CHECK([SalesDate] < dateadd(hh, -1, getdate()) ) not null,
    [ClothesSold] varchar(6) FOREIGN KEY REFERENCES [Cloth]([Cloth ID]),
    [Qty] int not null
)

ALTER TABLE [SalesTransaction]
ADD FOREIGN KEY ([Staff ID]) REFERENCES [Staff]([ID])

ALTER TABLE [SalesTransaction]
ADD FOREIGN KEY ([Customer ID]) REFERENCES [Customer]([ID])

drop table[SalesTransaction]

Create Table [Cloth](
    [Cloth ID] varchar(6) primary key CHECK([Cloth ID] LIKE 'CL[0-9][0-9][0-9]'),
    [Brand] varchar(20) not null,
    [Price] INT not null CHECK([Price] >= 20000),
    [Category] varchar(20) not null,
    [Stock] int not null
)
drop table[Cloth]

Create Table [Category](
    [Category ID] varchar(20) primary key CHECK([Category ID] LIKE 'CA[0-9][0-9][0-9]'),
    [Name] varchar(20) not null
)
drop table[Category]

Create Table PurchaseTransaction_Vendor(
		PurchaseTransactionPurchaseID Varchar(6),
		ClothesPurchased Varchar(6),
		Qty INT
		primary key (PurchaseTransactionPurchaseID, ClothesPurchased)
)
drop table PurchaseTransaction_Vendor
select * from PurchaseTransaction_Vendor
alter table PurchaseTransaction_Vendor
	add foreign key (PurchaseTransactionPurchaseID) References [PurchaseTransaction]([ID])
alter table PurchaseTransaction_Vendor
	add foreign key (ClothesPurchased) References [Cloth]([Cloth ID])

Create Table SalesTransaction_Customer(
	SalesTransactionSalesID varchar(6),
	ClothesSold varchar(6),
	Qty INT
	primary key(SalesTransactionSalesID, ClothesSold)
)
alter table SalesTransaction_Customer
add foreign key (SalesTransactionSalesID) References [SalesTransaction]([Sales ID])

alter table SalesTransaction_Customer
add foreign key (ClothesSold) References [Cloth]([Cloth ID])


