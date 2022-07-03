CREATE DATABASE HotelManagement
USE HotelManagement
-- create table Manager

create table Manager
(
	ManagerID varchar(6) primary key, 
	FullNameM nvarchar(20) not null, 
	Email nvarchar(40),
	Phone varchar(10) unique,
	CHECK (ManagerID LIKE 'M_____'),
	check(Phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
)
go
CREATE TABLE Customer
(
	CustomerID varchar(8),
	FullName nvarchar(20) NOT NULL,
	Email nvarchar(30),
	Phone varchar(10) UNIQUE, 
	Gender char(1) NOT NULL,
	CCCD varchar(12) UNIQUE,
	PRIMARY KEY(CustomerID),
	CHECK (CustomerID LIKE 'CU______'),
	CHECK (Phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
	CHECK (Gender IN( 'F', 'M')),
	CHECK (CCCD like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	 ManagerID varchar(6) foreign key (ManagerID) REFERENCES Manager (ManagerID)
)


go


CREATE TABLE Room
(
	RoomID varchar(6),
	NameRoom nvarchar(20) NOT NULL,
	Floor char(1) NOT NULL,
	Status char(1) NOT NULL,
	PRIMARY KEY(RoomID),
	CHECK (RoomID LIKE 'R_____'),
	CHECK (Floor like '[1-6]'), --Có từ tầng 1 đến tầng 6 
	CHECK (Status IN( 'Y', 'N')) --Phòng trống 'N' phòng có khách 'Y'

)
go
CREATE TABLE Resgiter
(	
	RoomID varchar(6) FOREIGN KEY REFERENCES Room(RoomID),
	CustomerID varchar(8) FOREIGN KEY REFERENCES Customer(CustomerID),
	Checkin date NOT NULL,
	Checkout date NOT NULL,
	CheckPrice MONEY NOT NULL ,
	CHECK(CheckPrice > 0)
	
)
go

CREATE TABLE Item
(
	ItemID varchar(6),
	NameItem nvarchar(15) NOT NULL,
	Content text,
	PRIMARY KEY(ItemID),
	CHECK (ItemID LIKE 'I_____'),
)
go


CREATE TABLE [Fix Detail]
(
	ItemID varchar(6) FOREIGN KEY REFERENCES Item(ItemID),
	RoomID varchar(6) FOREIGN KEY REFERENCES Room(RoomID),
	Quanlity int NOT NULL, --số lượng đồ bị hư
	DateReport date ,
	Price money ,
)
go

CREATE TABLE Penalize
(
	PenalizeID varchar(6),
	NamePenalize nvarchar(15) NOT NULL,
	Price money,
	PRIMARY KEY (PenalizeID),
	CHECK (PenalizeID LIKE 'P_____') 
)

go


create table [Customer Penalize]
(
	CustomerID varchar(8) foreign key references Customer(CustomerID), 
	PenalizeID varchar(6) foreign key references Penalize(PenalizeID),
	[Date] date,
	Quantity int not null,
)
go

create table Bill
(
	BillID varchar(6) primary key, 
	ManagerID varchar(6) FOREIGN KEY REFERENCES Manager(ManagerID),
	RoomID varchar(6) FOREIGN KEY REFERENCES Room(RoomID),
	BillName nvarchar(15) not null,
	Price money,
	Check(BillID Like 'B_____')
)

--data Resgiter
SELECT * FROM Resgiter

INSERT INTO Resgiter(RoomID,CustomerID,Checkin,Checkout,CheckPrice) VALUES
		('R00001','CU123456','6/10/2021','10/10/2021',1200000)
INSERT INTO Resgiter(RoomID,CustomerID,Checkin,Checkout,CheckPrice) VALUES
		('R00002','CU123459','3/1/2021','9/1/2021',900000)
INSERT INTO Resgiter(RoomID,CustomerID,Checkin,Checkout,CheckPrice) VALUES
		('R00003','CU123458','6/5/2021','8/5/2021',900000)
INSERT INTO Resgiter(RoomID,CustomerID,Checkin,Checkout,CheckPrice) VALUES
		('R00004','CU123459','1/3/2021','3/3/2021',600000)

--DATA ROOM
SELECT * FROM Room

INSERT INTO Room(RoomID,NameRoom,Floor,Status) VALUES('R00001','Vip','3','Y')
INSERT INTO Room(RoomID,NameRoom,Floor,Status) VALUES('R00002','Pro','2','N')
INSERT INTO Room(RoomID,NameRoom,Floor,Status) VALUES('R00003','Normal','2','Y')
INSERT INTO Room(RoomID,NameRoom,Floor,Status) VALUES('R00004','Vip','6','N')


--DATA Customer
SELECT * FROM Customer
INSERT INTO Customer VALUES('CU123456',N'Nguyễn Văn An','nvanan@gmail.com','0123456789','F','120033445566','M22223')
INSERT INTO Customer VALUES('CU123457',N'Quế Ngọc Hải','nngochai@gmail.com','0922456686','M','120033445577','M22224')
INSERT INTO Customer VALUES('CU123458',N'Công Phượng','congphuong@gmail.com','0924456780','F','120033445588','M22223')
INSERT INTO Customer VALUES('CU123459',N'Nguyễn Tiến Linh','ntienlinh@gmail.com','0933466781','M','120033445599','M22225')


--data fix detail
SELECT * FROM [Fix Detail]
INSERT INTO [Fix Detail](ItemID,RoomID,DateReport,Quanlity,Price) VALUES
		('I11112','R00001','10/20/2021','3',5500000)
INSERT INTO [Fix Detail](ItemID,RoomID,DateReport,Quanlity,Price) VALUES
		('I11113','R00002','09/23/2021',20,3300000)
INSERT INTO [Fix Detail](ItemID,RoomID,DateReport,Quanlity,Price) VALUES
		('I11114','R00003','10/10/2021','4',2200000)
INSERT INTO [Fix Detail](ItemID,RoomID,DateReport,Quanlity,Price) VALUES
		('I11115','R00004','1/9/2021','2',1100000)

--date item
SELECT * FROM Item

INSERT INTO Item(ItemID,NameItem,Content) VALUES('I11112','Tivi',NULL)
INSERT INTO Item(ItemID,NameItem,Content) VALUES('I11113','Chair',NULL)
INSERT INTO Item(ItemID,NameItem,Content) VALUES('I11114','Table',null)
INSERT INTO Item(ItemID,NameItem,Content) VALUES('I11115','Bed',NULL)
INSERT INTO Item(ItemID,NameItem,Content) VALUES('I11116','Curtain',NULL)
INSERT INTO Item(ItemID,NameItem,Content) VALUES('I11117','Door',NULL)
INSERT INTO Item(ItemID,NameItem,Content) VALUES('I11118','Glasses',NULL)

--Data manager
select * from Manager
INSERT INTO Manager VALUES('M22223',N'Nguyễn Văn Lí','ngvanli@gmail.com','0944556677')
INSERT INTO Manager VALUES('M22224',N'Trần Văn Hoàng',NULL,'0944556688')
INSERT INTO Manager VALUES('M22225',N'Hồ Hoàn Kiếm',null,'0944557799')


--DATA Penalize
SELECT * FROM Penalize

INSERT INTO Penalize VALUES('P42225',N'Phí sửa chữa',100000)
INSERT INTO Penalize VALUES('P42226',N'Phí hợp đồng',1000000)
INSERT INTO Penalize VALUES('P42227',N'Hút thuốc',200000)
--DATA Customer Penalize
SELECT * FROM [Customer Penalize]
INSERT INTO [Customer Penalize] VALUES('CU123456','P42225','07/10/2021','3')
INSERT INTO [Customer Penalize] VALUES('CU123456','P42226','07/10/2021','1')
INSERT INTO [Customer Penalize] VALUES('CU123457','P42226','07/10/2021','1')
INSERT INTO [Customer Penalize] VALUES('CU123458','P42227','07/10/2021','2')

--DATA BILL
SELECT * FROM Bill
INSERT INTO BIll VALUES('B54321','M22223','R00001',N'Tổng Cộng',20451000)
INSERT INTO BIll VALUES('B54322','M22224','R00002',N'Tổng Cộng',12461000)
INSERT INTO BIll VALUES('B54323','M22224','R00003',N'Tổng Cộng',70150000)
INSERT INTO BIll VALUES('B54324','M22225','R00004',N'Tổng Cộng',62441000)




