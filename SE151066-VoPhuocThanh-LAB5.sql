CREATE DATABASE ABCCompany
USE ABCCompany
CREATE TABLE KHACHHANG
(
	MaKH nvarchar(5) NOT NULL PRIMARY KEY,
	TenKH nvarchar(30) NOT NULL,
	DiaChi nvarchar(50),
	DT nvarchar(10) ,
	Email nvarchar(30)
)
SELECT * FROM KHACHHANG

CREATE TABLE VATTU
(
	MaVT nvarchar(5) PRIMARY KEY NOT NULL,
	TenVT nvarchar(30) NOT NULL,
	DVT nvarchar(20),
	GiaMua int CHECK (GiaMua>0),
	SLTon int CHECK (SLTon>=0)
)

CREATE TABLE HOADON
(
	MaHD nvarchar(10) PRIMARY KEY NOT NULL,
	Ngay datetime CHECK(Ngay<getdate()),
	MaKH nvarchar(5) FOREIGN KEY REFERENCES KHACHHANG(MaKH),
	TongTG int
)

CREATE TABLE CHITIETHOADON
(
	MaHD nvarchar(10) FOREIGN KEY REFERENCES HOADON(MaHD),
	MaVT nvarchar(5) FOREIGN KEY REFERENCES VATTU(MaVT),
	PRIMARY KEY (MaHD,MaVT),
	SL int,
	KhuyenMai int,
	GiaBan int
)

INSERT VATTU
VALUES( 'VT01','XI MANG','BAO',50000,5000)
INSERT VATTU
VALUES( 'VT02','CAT' ,'KHOI', 45000, 50000)
INSERT VATTU
VALUES( 'VT03','GACH ONG', 'VIEN', 120, 800000)
INSERT VATTU
VALUES( 'VT04','GACH THE', 'VIEN', 110, 800000)
INSERT VATTU
VALUES( 'VT05','DA LON', 'KHOI', 25000, 100000)
INSERT VATTU
VALUES( 'VT06','DA NHO', 'KHOI', 33000, 100000)
INSERT KHACHHANG
VALUES( 'KH01','NGUYEN THI BE', 'TAN BINH', 8457895, 'bnt@yahoo.com')

INSERT KHACHHANG
VALUES( 'KH02','LE HOANG NAM', 'BINH CHANH', 9878987, 'namlehoang @abc.com.vn')
INSERT KHACHHANG
VALUES( 'KH03','TRAN THI CHIEU', 'TAN BINH', 8457895,null )
INSERT KHACHHANG
VALUES( 'KH04','MAI THI QUE ANH', 'BINH CHANH ',null,null)
INSERT KHACHHANG
VALUES( 'KH05','LE VAN SANG', 'QUAN 10', null ,'sanglv@hcm.vnn.vn')
INSERT KHACHHANG
VALUES( 'KH06','TRAN HOANG KHAI', 'TAN BINH', 8457897 ,null)
INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD001','2000-05-12', 'KH01')
INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD002','2000-05-25', 'KH02')
INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD003','2000-05-25','KH01')
INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD004','2000-05-25','KH04')
INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD005','2000-05-26','KH04')
INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD006','2000-05-02','KH03')
INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD007','2000-06-22','KH04')
INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD008','2000-06-25','KH03')
INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD009','2000-08-15','KH04')

INSERT HOADON([MaHD],[Ngay],[MaKH])
VALUES( 'HD010','2000-08-30','KH01')
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES('HD001','VT01',5,52000)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD001','VT05', 10, 30000)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD002','VT03', 10000, 150)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD003','VT02', 20, 55000)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD004','VT03', 50000, 150)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD004', 'VT04', 20000, 120)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD005', 'VT05', 10, 30000)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD006', 'VT04', 10000, 120)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD007', 'VT04', 20000, 125)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD008', 'VT01', 100, 55000)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD009', 'VT02', 25, 48000)
INSERT CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan])
VALUES( 'HD010', 'VT01', 25, 57000)


--1. Write function name: StudenID_ Func1 with parameter @mavt, return the sum of sl*giaban corresponding.
IF OBJECT_ID('dbo.StudenID_Func1','FS') IS NOT NULL
	DROP FUNCTION dbo.StudenID_Func1
GO
CREATE FUNCTION StudenID_Func1( @mavt nvarchar(5))
RETURNS INT 
AS 
	BEGIN
		DECLARE @sum INT 
		SELECT @sum  = sum (SL*GiaBan)
		FROM dbo.CHITIETHOADON 
		WHERE MaVT =@mavt
		RETURN @sum;
	END

SELECT dbo.StudenID_Func1('VT01') AS GIATIEN
SELECT * FROM CHITIETHOADON

--2. Write function to return a total of the HoaDon (@MahD is a parameter)
IF OBJECT_ID ('StudenID_Func2','FN') IS NOT NULL
    DROP FUNCTION StudenID_Func2
GO
CREATE FUNCTION StudenID_Func2(@MahD nvarchar(10))
RETURNS INT
AS
BEGIN
	DECLARE @TOTAL INT
	SELECT  @TOTAL = COUNT(c.MaHD) FROM CHITIETHOADON c left join HOADON h
	on c.MaHD = h.MaHD
	WHERE h.MaHD = @MahD
	RETURN @TOTAL 
END
GO

SELECT DBO.StudenID_Func2(N'HD001') AS Total
DROP FUNCTION DBO.StudenID_Func2

--3. Write procedure name: StudenId _Proc1, parameter @makh, @diachi. This procedure help user update @diachi corresponding @makh.
IF OBJECT_ID('dbo.StudenID_proc1','p') IS NOT NULL
	DROP PROCEDURE dbo.StudenID_Proc1
GO
CREATE PROCEDURE  StudenID_Proc1(@makh nvarchar(8),	@diachi nvarchar(15))
AS 
	UPDATE dbo.KHACHHANG
	SET DiaChi=@diachi
	WHERE MaKH=@makh
GO
EXEC StudenID_Proc1 'KH01', 'THU DUC'
GO
select * from KHACHHANG


--4. Write procedure to add an item into Hoadon

IF OBJECT_ID('dbo.StudenID_proc2','p') IS NOT NULL
	DROP PROCEDURE dbo.StudenID_Proc2
GO
CREATE PROCEDURE  StudenID_Proc2(@maHD nvarchar(8),	@ngay datetime,@makh nvarchar(8), @tongTG int)
AS 
	INSERT INTO HOADON VALUES(@maHD,@ngay,@makh,@tongTG);
GO
EXEC StudenID_Proc2 'HD011', '2000-10-23','KH04',NULL
select * from HOADON

--5. Write trigger name: StudenId_ Trig1 on table Chitiethoadon, when user insert data into Chitiethoadon, 
--the trigger will update the Tongtien in HoaDon(student should add Tongtien column into Hoadon, tongtien=sum(sl*giaban).


IF OBJECT_ID('StudenId_Trig1', 'TR') IS NOT NULL
	DROP TRIGGER StudenId_Trig1
GO
CREATE TRIGGER dbo.StudentID_Trig1 ON CHITIETHOADON AFTER INSERT AS
BEGIN 
	
	UPDATE HOADON
	SET TongTG= (SELECT SUM(SL*GiaBan) FROM CHITIETHOADON
	where MaHD=HOADON.MaHD
	group by MaHD)
	FROM HOADON JOIN CHITIETHOADON on HOADON.MaHD = CHITIETHOADON.MaHD
END

Insert into CHITIETHOADON([MaHD],[MaVT],[SL],[GiaBan]) VALUES('HD004','VT01',1,52000)
Select * from HOADON



--6. Write view name: StudentID_View1 to extract list of customers who bought ‘Gach Ong


IF OBJECT_ID('dbo.StudentID_View1','v') IS NOT NULL
	DROP VIEW dbo.StudentID_View1;
GO
CREATE VIEW StudentID_View1 
AS
	SELECT K.TENKH FROM VATTU V JOIN CHITIETHOADON C ON V.MAVT = C.MaVT JOIN HOADON H ON C.MaHD = H.MaHD JOIN KHACHHANG K ON H.MaKH = K.MAKH 
	WHERE V.TENVT=N'GACH ONG'
	GROUP BY K.TENKH
SELECT * FROM dbo.StudentID_View1