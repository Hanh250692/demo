CREATE DATABASE QuanLyQuanCafe
GO

USE QuanLyQuanCafe
GO
--FOOD
--TABLE
--FOODCATOLORY
--ACCOUT
--BILL
--BILLINFO

CREATE TABLE TableFood
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bàn chưa có tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'--Trống ||Có người
)
GO


CREATE TABLE Account
(
	UserName NVARCHAR(100)  PRIMARY KEY,
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Hanh',
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL DEFAULT N'Chưa đặt tên' --1:admin ,,0:staff
)
GO

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
GO

CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0

	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO


CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DataCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DataCheckOut DATE,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0 --trang thái đã thsnh toán|| chưa thanh toán

	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)
)
GO

CREATE TABLE BillInfor
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0  --Số lượng món ăn

	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(id)
)
GO
INSERT INTO dbo.Account
(	
	UserName,
	DisplayName,
	PassWord,
	Type
)
VALUES(
	N'Nguyễn Hồng Hạnh',
	N'Hanhnguyen1992',
	N'123',
	1
)

INSERT INTO dbo.Account
(	
	UserName,
	DisplayName,
	PassWord,
	Type
)
VALUES(
	N'Nguyễn Hồng Phúc',
	N'Hongphuc1993',
	N'124',
	0

)

GO

CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName= @userName
END
GO
EXEC dbo.USP_GetAccountByUserName @userName=N'Nguyễn Hồng Hạnh'



