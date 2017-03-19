CREATE DATABASE HotelManager
GO

USE HotelManager
GO

-- User
-- Service
-- RoomType
-- Room
-- Payments
-- Group User
-- Employee
-- Deparment
-- CustomerType
-- Customer
-- CheckInVoucher
-- BillDetail
-- Bill

CREATE TABLE tbl_GroupUser
(
	Id INT IDENTITY PRIMARY KEY,
	NameGroup NVARCHAR(50),
	CreateDate DATETIME,
	CreateBy NVARCHAR(50),
	Status BIT
)
GO 
 
CREATE TABLE tlb_User
(
	Id INT IDENTITY PRIMARY KEY,
	Username NCHAR(10) NOT NULL,		-- không được trống
	Password NVARCHAR(50) NOT NULL,		-- không được trống
	FullName NVARCHAR(50) NOT NULL,		-- không được trống
	Image NVARCHAR(250),
	GroupUser_Id INT,
	CreateDate DATETIME,
	CreateBy NCHAR(10),
	UpdateDate DATETIME,
	UpdateBy NCHAR(10),
	Status BIT			   -- kích hoat || không kích hoạt

	FOREIGN KEY (GroupUser_Id) REFERENCES dbo.tbl_GroupUser (Id)
)
GO

CREATE TABLE tbl_Service
(
	Id INT IDENTITY PRIMARY KEY,
	NameService NVARCHAR(50),
	PriceService DECIMAL(18,0),
	CreateDate DATETIME,
	CreateBy NCHAR(10),
	Status BIT
)
GO

CREATE TABLE tbl_RoomType
(
	Id INT IDENTITY PRIMARY KEY,
	NameRoom NVARCHAR(50),
	PriceRoom DECIMAL(18,0),
	MaxCustomer INT,
	CreateDate DATETIME,
	CreateBy NCHAR(10),
	Status BIT	
)
GO

CREATE TABLE tbl_Room
(
	Id INT IDENTITY PRIMARY KEY,
	TypeRoom  INT,
	NameRoom NVARCHAR(50),
	FloorRoom INT,
	DetailRoom NVARCHAR(500),
	PriceRoom DECIMAL(18,0),
	RoomTypeId INT,
	CreateDate DATETIME,
	CreateBy NCHAR(10),
	Status BIT

	FOREIGN KEY (TypeRoom) REFERENCES dbo.tbl_RoomType(Id)
)
GO

-- OK

CREATE TABLE tbl_Payments
(
	 Id INT IDENTITY PRIMARY KEY,
	 NamePayment NVARCHAR(50),
	 Status NCHAR(10)
)
GO

CREATE TABLE tbl_Department
(
	Id INT IDENTITY PRIMARY KEY,
	DepartmentName NVARCHAR(50),
	Descriptions NVARCHAR(500)
)
GO

CREATE TABLE tbl_Employee
(
	Id INT IDENTITY PRIMARY KEY,
	FullName NVARCHAR(50),
	BirthDay DATETIME,
	Address NVARCHAR(500),
	Sex BIT,
	Department_Id INT,
	Image NVARCHAR(250)

	FOREIGN KEY (Department_Id) REFERENCES dbo.tbl_Department (Id)
)
GO

DROP TABLE dbo.tbl_Employee

CREATE TABLE tbl_CustomerType
(
	Id INT IDENTITY PRIMARY KEY,
	CodeTypeCustomer NCHAR(10),
	FullTypeCustomer NVARCHAR(50),
	CreateDate DATETIME,
	CreateBy NVARCHAR(50),
	Status BIT
)
GO
 
 CREATE TABLE tbl_Customer
 (
	Id INT IDENTITY PRIMARY KEY,
	FullName NVARCHAR(50),
	IDCard INT,				   -- cmnd khách hàng
	PhoneNumber NVARCHAR(15),
	Address NVARCHAR(250),
	CustomerType_Id INT,
	CreateDate DATETIME,
	CreateBy NVARCHAR(50),
 )
 GO

 CREATE TABLE tbl_CheckInVoucher
 (
	Id INT IDENTITY PRIMARY KEY,
	PaymentMethod INT,
	Customer_Id INT,
	Room_Id INT,
	DateSetRoom DATETIME,
	CheckInDate DATETIME,
	NumberRoom INT,
	NameRoom NCHAR(10),
	CreateDate DATETIME,
	CreateBy NVARCHAR(50),
	Status BIT

	FOREIGN KEY (PaymentMethod) REFERENCES dbo.tbl_Payments(Id),
	FOREIGN KEY (Customer_Id) REFERENCES dbo.tbl_Customer(Id),
	FOREIGN KEY (Room_Id) REFERENCES dbo.tbl_Room(Id)
 )
 GO

 CREATE TABLE tbl_BillDetail
 (
	Id INT IDENTITY PRIMARY KEY,
	Service_Id INT,
	NumberOfDate INT,
	Price DECIMAL(18,0)

	FOREIGN KEY (Service_Id) REFERENCES dbo.tbl_Service(Id)
 )
 GO

 CREATE TABLE tbl_Bill
 (
	Id INT IDENTITY PRIMARY KEY,
	BillDatail_Id INT,
	CustomerName NVARCHAR(50),
	CustomerPhone NVARCHAR(15),
	CheckOutDate DATETIME,
	CheckInVoucher_Id INT,
	CountPrice DECIMAL (18,0),
	CreateDate DATETIME,
	CreateBy NCHAR(10),
	Status BIT

	FOREIGN KEY (BillDatail_Id) REFERENCES dbo.tbl_BillDetail(Id),
	FOREIGN KEY (CheckInVoucher_Id) REFERENCES dbo.tbl_CheckInVoucher (Id)
 )
 GO

