create database QLVEMB
USE QLVEMB

create table DIEMDAU
(
MaDau nvarchar(50) primary key not null,
TenD nvarchar (100) not null,
)
insert into DIEMDAU
 values (N'DD01',N'Hà Nội'),
		(N'DD02',N'Hồ Chí Minh'),
		(N'DD03',N'Huế'),
		(N'DD04',N'Quy Nhơn'),
		(N'DD05',N'Đà Nẵng'),
		(N'DD06',N'Nha Trang'),
		(N'DD07',N'Côn Đảo'),
		(N'DD08',N'Phú Quốc'),
		(N'DD09',N'Buôn Ma Thuột'),
		(N'DD10',N'Cà Mau'),
		(N'DD11',N'Cần Thơ'),
		(N'DD12',N'Chu Lai'),
		(N'DD13',N'Đà Lạt'),
		(N'DD14',N'Điện Biên Phủ'),
		(N'DD15',N'Đồng Hới'),
		(N'DD16',N'Hải Phòng'),
		(N'DD17',N'Pleiku'),
		(N'DD18',N'Rạch Giá'),
		(N'DD19',N'Thanh Hóa'),
		(N'DD20',N'Tuy Hòa'),
		(N'DD21',N'Vân Đồn'),
		(N'DD22',N'Vinh');
select * from DIEMDAU

create table DIEMCUOI
(
	MaCuoi nvarchar (50) primary key not null,
	TenC NVARCHAR (100) NOT NULL,
)
insert into DIEMCUOI
 values (N'DD01',N'Hà Nội'),
		(N'DD02',N'Hồ Chí Minh'),
		(N'DD03',N'Huế'),
		(N'DD04',N'Quy Nhơn'),
		(N'DD05',N'Đà Nẵng'),
		(N'DD06',N'Nha Trang'),
		(N'DD07',N'Côn Đảo'),
		(N'DD08',N'Phú Quốc'),
		(N'DD09',N'Buôn Ma Thuột'),
		(N'DD10',N'Cà Mau'),
		(N'DD11',N'Cần Thơ'),
		(N'DD12',N'Chu Lai'),
		(N'DD13',N'Đà Lạt'),
		(N'DD14',N'Điện Biên Phủ'),
		(N'DD15',N'Đồng Hới'),
		(N'DD16',N'Hải Phòng'),
		(N'DD17',N'Pleiku'),
		(N'DD18',N'Rạch Giá'),
		(N'DD19',N'Thanh Hóa'),
		(N'DD20',N'Tuy Hòa'),
		(N'DD21',N'Vân Đồn'),
		(N'DD22',N'Vinh');
select *from DIEMCUOI

create table MAYBAY
(
	MaMayBay INT IDENTITY(1,1) PRIMARY KEY,
	TenMayBay nvarchar (50) not null,
	HangSanXuat nvarchar (50) null,
	SoGheLTG int not null,
	SoGheLT int Not null,
)
insert into MAYBAY
values (N'NNHP01 Airlines',N'Airbus',20,30),
		(N'NNHP02 Airlines',N'Airbus',30,40),
		(N'NNHP03 Airlines',N'Airbus',60,30),
		(N'NNHP04 Airlines',N'Airbus',35,65),
		(N'NNHP05 Airlines',N'Airbus Lite',50,100),
		(N'NNHP06 Airlines',N'Airbus Lite',50,100);
SELECT*FROM MAYBAY

create table CHUYENBAY
(
	MaChuyenBay INT IDENTITY(1,1) PRIMARY KEY,
	MaMayBay int foreign key references MAYBAY(MaMayBay) on delete cascade on update cascade,
	MaDau nvarchar (50) not null foreign key references DIEMDAU(MaDau) on delete cascade on update cascade,
	MaCuoi nvarchar(50)not null foreign key references DIEMCUOI(MaCuoi) on delete cascade on update cascade,
	NgayDi nvarchar(50) not null,
	NgayDen nvarchar(50) not null,
	GioBay nvarchar(50) not null,
	GioDen nvarchar(50)not null,
	GhiChu Nvarchar (50) null,
)

create table NHANVIEN
(
	MaNhanVien INT IDENTITY(1,1) PRIMARY KEY,
	TenNhanVien nvarchar (50) not null,
	NgaySinh nvarchar(50) not null,
	GioiTinh bit not null,
	DiaChi nvarchar (50) not null,
	SoDienThoai nvarchar (50) not null,
	ChucVu nvarchar (50) null,
	TenDangNhap nvarchar (50) not null,
	MatKhau nvarchar (50) not null,
	AnhNV nvarchar (50),
)
insert into NHANVIEN
values (N'Đinh Ngọc Hà','08/15/2001',0,N'Bình Định','0345816666',N'Quản lý','ha','8888','ha.jpg'),
		(N'Đặng Thành Chương','10/21/2001',1,N'Bình Định','0363698294',N'Quản lý','chuong','1111','chuong.jpg'),
		(N'Mạc Văn Khoa','07/14/2000',1,N'Phú Yên','0355810000',N'Nhân Viên','khoa','123','');
		
select * from NHANVIEN

create table KHACHHANG
(
	CMND varchar(10)primary key not null,
	TenKhachHang Nvarchar (50) not null,
	GioiTinh bit not null,
	Ngaysinh nvarchar(50) not null,
	SoDienThoai nvarchar (50) not null,
	DiaChi nvarchar (50) not null,
)
insert into KHACHHANG
values ('215473039',N'Bùi Văn Tình',1,'08/08/1992',0983454657,N'Phù Mỹ'),
		('215474545',N'Nguyễn Ngọc Ngạn',1,'05/15/1988',0934567890,N'Gia Lai'),
		('215474555',N'Phạm Trần Mỹ Diễm',0,'09/23/2001',01234566591,N'Vân Canh');
		
select * from KHACHHANG

create table LOAIVE 
(
	MaLoai varchar (10) primary key not null,
	TenLoai nvarchar(50) not null,
	Gia nvarchar (50) not null,
)
insert into LOAIVE
values  ('LV01',N'Hạng Thường',2000000),
		('LV02',N'Hạng Thương Gia',2500000);
select * from LOAIVE

create table VEBAN
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	MaLoai varchar (10) foreign key references LOAIVE(MaLoai) on delete cascade on update cascade  not null,
	SLVeBan int not null,
	MaNhanVien int foreign key references NHANVIEN(MaNhanVien) on delete cascade on update cascade not null,
	CMND varchar (10)  foreign key references KHACHHANG(CMND) on delete cascade on update cascade not null,
	MaChuyenBay int foreign key references CHUYENBAY(MaChuyenBay) on delete cascade on update cascade  not null,
	TongGia int not null,
)
create table THONGBAO
(
	MaThongBao INT IDENTITY(1,1) PRIMARY KEY,
	TieuDe nvarchar (50) not null,
	NoiDung nvarchar(1000),
)