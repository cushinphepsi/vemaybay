create database QLVeMayBay
go
use QLVeMayBay
go
-- use master            drop database QLVeMayBay
create table SanBay(
	MaSanBay varchar(4) primary key not null,
	TenSanBay nvarchar(50) not null,
	DiaChi nvarchar(50) 
)
go

insert into SanBay values ('SB01',N'Tân Sơn Nhất',N'Đà Nẵng')
insert into SanBay values ('SB02',N'Nội Bài',N'Hà Nội')
insert into SanBay values ('SB03',N'Quảng Nam',N'Quảng Nam')
insert into SanBay values ('SB04',N'Quảng Bình',N'Quảng Bình')
insert into SanBay values ('SB05',N'Phú Yên',N'Phú Yên')
go

create table HangHangKhong(
	MaHang varchar(4) primary key not null,
	TenHang nvarchar(50) not null
)
go

insert into HangHangKhong values ('H001','VietJet Air')
insert into HangHangKhong values ('H002','VietNam AirLine')
insert into HangHangKhong values ('H003','Bamboo Airways')
insert into HangHangKhong values ('H004','Jetstar')
go

create table LoaiGhe(
	MaLoaiGhe varchar(4) primary key , 
	TenLoaiGhe nvarchar(10),
)
go

insert into LoaiGhe values ('LG01',N'Ghế thường')
insert into LoaiGhe values ('LG02',N'Ghế vip')

go

create table SoDoGhe(
	MaSoDo varchar(4) primary key not null,
	MaLoaiGhe varchar(4) foreign key references LoaiGhe(MaLoaiGhe),
	SLDayGhe int ,
	SLGheMoiDay int ,

)
go

insert into SoDoGhe values ('SD01','LG01',5,4)
insert into SoDoGhe values ('SD02','LG01',5,4)
insert into SoDoGhe values ('SD03','LG02',5,4)
insert into SoDoGhe values ('SD04','LG01',5,4)
insert into SoDoGhe values ('SD05','LG02',5,4)
go

create table Ghe(
	MaGhe int identity(100,1) primary key not null,
	MaSoDo varchar(4) foreign key references SoDoGhe(MaSoDo),
	TenGhe varchar(4),
	TinhTrangGhe nvarchar(20), 
)
go

insert into Ghe values ('SD01','A001',N'Chưa đặt')
insert into Ghe values ('SD01','A002',N'Chưa đặt')
insert into Ghe values ('SD01','A003',N'Chưa đặt')
insert into Ghe values ('SD01','A004',N'Chưa đặt')
insert into Ghe values ('SD01','B001',N'Chưa đặt')
insert into Ghe values ('SD01','B002',N'Chưa đặt')
insert into Ghe values ('SD01','B003',N'Chưa đặt')
insert into Ghe values ('SD01','B004',N'Chưa đặt')
insert into Ghe values ('SD01','C001',N'Chưa đặt')
insert into Ghe values ('SD01','C002',N'Chưa đặt')
insert into Ghe values ('SD01','C003',N'Chưa đặt')
insert into Ghe values ('SD01','C004',N'Chưa đặt')
insert into Ghe values ('SD01','D001',N'Chưa đặt')
insert into Ghe values ('SD01','D002',N'Chưa đặt')
insert into Ghe values ('SD01','D003',N'Chưa đặt')
insert into Ghe values ('SD01','D004',N'Chưa đặt')
insert into Ghe values ('SD01','E001',N'Chưa đặt')
insert into Ghe values ('SD01','E002',N'Chưa đặt')
insert into Ghe values ('SD01','E003',N'Chưa đặt')
insert into Ghe values ('SD01','E004',N'Chưa đặt')
go

create table MayBay(
	MaMayBay varchar(4) primary key not null,
	MaHang varchar(4) foreign key references HangHangKhong(MaHang),
	MaSoDo varchar(4) foreign key references SoDoGhe(MaSoDo),
	TenMayBay varchar(50) not null,
)
go

insert into MayBay values ('MB01','H001','SD01','VietJet Air 1')
insert into MayBay values ('MB02','H001','SD01','VietJet Air 2')
insert into MayBay values ('MB03','H001','SD01','VietJet Air 3')
insert into MayBay values ('MB04','H001','SD01','VietJet Air 4')
insert into MayBay values ('MB05','H001','SD01','VietJet Air 5')

insert into MayBay values ('MB06','H002','SD01','VietNam AirLine 1')
insert into MayBay values ('MB07','H002','SD01','VietNam AirLine 2')
insert into MayBay values ('MB08','H002','SD01','VietNam AirLine 3')
insert into MayBay values ('MB09','H002','SD01','VietNam AirLine 4')
insert into MayBay values ('MB10','H002','SD01','VietNam AirLine 5')

insert into MayBay values ('MB11','H003','SD01','Bamboo Airways 1')
insert into MayBay values ('MB12','H003','SD01','Bamboo Airways 2')
insert into MayBay values ('MB13','H003','SD01','Bamboo Airways 3')
insert into MayBay values ('MB14','H003','SD01','Bamboo Airways 4')
insert into MayBay values ('MB15','H003','SD01','Bamboo Airways 5')

insert into MayBay values ('MB16','H004','SD01','Jetstar 1')
insert into MayBay values ('MB17','H004','SD01','Jetstar 2')
insert into MayBay values ('MB18','H004','SD01','Jetstar 3')
insert into MayBay values ('MB19','H004','SD01','Jetstar 4')
insert into MayBay values ('MB20','H004','SD01','Jetstar 5')

go

create table TuyenBay(
	MaTuyenBay varchar(4) primary key not null,
	MaSanBayDi varchar(4) foreign key references SanBay(MaSanBay) ,
	MaSanBayDen varchar(4) foreign key references SanBay(MaSanBay) ,
	check (MaSanBayDi != MaSanBayDen )
)
go

insert into TuyenBay values ('TB01','SB01','SB02')
insert into TuyenBay values ('TB02','SB01','SB03')
insert into TuyenBay values ('TB03','SB01','SB04')
insert into TuyenBay values ('TB04','SB01','SB05')

insert into TuyenBay values ('TB05','SB02','SB01')
insert into TuyenBay values ('TB06','SB02','SB03')
insert into TuyenBay values ('TB07','SB02','SB04')
insert into TuyenBay values ('TB08','SB02','SB05')

insert into TuyenBay values ('TB09','SB03','SB01')
insert into TuyenBay values ('TB10','SB03','SB02')
insert into TuyenBay values ('TB11','SB03','SB04')
insert into TuyenBay values ('TB12','SB03','SB05')

insert into TuyenBay values ('TB13','SB04','SB01')
insert into TuyenBay values ('TB14','SB04','SB02')
insert into TuyenBay values ('TB15','SB04','SB03')
insert into TuyenBay values ('TB16','SB04','SB05')

insert into TuyenBay values ('TB17','SB05','SB01')
insert into TuyenBay values ('TB18','SB05','SB02')
insert into TuyenBay values ('TB19','SB05','SB03')

go

create table TuyenBay_Hang(
	MaTuyenBayHang int identity(1000,1) primary key not null,
	MaHang varchar(4) foreign key references HangHangKhong(MaHang) ,
	MaTuyenBay varchar(4) foreign key references TuyenBay(MaTuyenBay) ,
)
go

insert into TuyenBay_Hang values ('H001','TB01')
insert into TuyenBay_Hang values ('H001','TB02')
insert into TuyenBay_Hang values ('H001','TB03')
insert into TuyenBay_Hang values ('H001','TB04')
insert into TuyenBay_Hang values ('H001','TB05')
insert into TuyenBay_Hang values ('H001','TB06')
insert into TuyenBay_Hang values ('H001','TB07')
insert into TuyenBay_Hang values ('H001','TB08')
insert into TuyenBay_Hang values ('H001','TB09')
insert into TuyenBay_Hang values ('H001','TB10')
insert into TuyenBay_Hang values ('H001','TB11')
insert into TuyenBay_Hang values ('H001','TB12')
insert into TuyenBay_Hang values ('H001','TB13')
insert into TuyenBay_Hang values ('H001','TB14')
insert into TuyenBay_Hang values ('H001','TB15')
insert into TuyenBay_Hang values ('H001','TB16')
insert into TuyenBay_Hang values ('H001','TB17')
insert into TuyenBay_Hang values ('H001','TB18')
insert into TuyenBay_Hang values ('H001','TB19')

insert into TuyenBay_Hang values ('H002','TB01')
insert into TuyenBay_Hang values ('H002','TB02')
insert into TuyenBay_Hang values ('H002','TB03')
insert into TuyenBay_Hang values ('H002','TB04')
insert into TuyenBay_Hang values ('H002','TB05')
insert into TuyenBay_Hang values ('H002','TB06')
insert into TuyenBay_Hang values ('H002','TB07')
insert into TuyenBay_Hang values ('H002','TB08')
insert into TuyenBay_Hang values ('H002','TB09')
insert into TuyenBay_Hang values ('H002','TB10')
insert into TuyenBay_Hang values ('H002','TB11')
insert into TuyenBay_Hang values ('H002','TB12')
insert into TuyenBay_Hang values ('H002','TB13')
insert into TuyenBay_Hang values ('H002','TB14')
insert into TuyenBay_Hang values ('H002','TB15')
insert into TuyenBay_Hang values ('H002','TB16')
insert into TuyenBay_Hang values ('H002','TB17')
insert into TuyenBay_Hang values ('H002','TB18')
insert into TuyenBay_Hang values ('H002','TB19')

insert into TuyenBay_Hang values ('H003','TB01')
insert into TuyenBay_Hang values ('H003','TB02')
insert into TuyenBay_Hang values ('H003','TB03')
insert into TuyenBay_Hang values ('H003','TB04')
insert into TuyenBay_Hang values ('H003','TB05')
insert into TuyenBay_Hang values ('H003','TB06')
insert into TuyenBay_Hang values ('H003','TB07')
insert into TuyenBay_Hang values ('H003','TB08')
insert into TuyenBay_Hang values ('H003','TB09')
insert into TuyenBay_Hang values ('H003','TB10')
insert into TuyenBay_Hang values ('H003','TB11')
insert into TuyenBay_Hang values ('H003','TB12')
insert into TuyenBay_Hang values ('H003','TB13')
insert into TuyenBay_Hang values ('H003','TB14')
insert into TuyenBay_Hang values ('H003','TB15')
insert into TuyenBay_Hang values ('H003','TB16')
insert into TuyenBay_Hang values ('H003','TB17')
insert into TuyenBay_Hang values ('H003','TB18')
insert into TuyenBay_Hang values ('H003','TB19')


insert into TuyenBay_Hang values ('H004','TB01')
insert into TuyenBay_Hang values ('H004','TB02')
insert into TuyenBay_Hang values ('H004','TB03')
insert into TuyenBay_Hang values ('H004','TB04')
insert into TuyenBay_Hang values ('H004','TB05')
insert into TuyenBay_Hang values ('H004','TB06')
insert into TuyenBay_Hang values ('H004','TB07')
insert into TuyenBay_Hang values ('H004','TB08')
insert into TuyenBay_Hang values ('H004','TB09')
insert into TuyenBay_Hang values ('H004','TB10')
insert into TuyenBay_Hang values ('H004','TB11')
insert into TuyenBay_Hang values ('H004','TB12')
insert into TuyenBay_Hang values ('H004','TB13')
insert into TuyenBay_Hang values ('H004','TB14')
insert into TuyenBay_Hang values ('H004','TB15')
insert into TuyenBay_Hang values ('H004','TB16')
insert into TuyenBay_Hang values ('H004','TB17')
insert into TuyenBay_Hang values ('H004','TB18')
insert into TuyenBay_Hang values ('H004','TB19')

go
create table LichBay(
	MaLichBay int identity(1000,1) primary key not null,
	MaTuyenBayHang int foreign key references TuyenBay_Hang(MaTuyenBayHang) ,
	NgayDi date ,
)
go

insert into LichBay values (1000,'2019-03-11')
insert into LichBay values (1001,'2019-03-15')
insert into LichBay values (1002,'2019-03-12')
insert into LichBay values (1003,'2019-03-12')
insert into LichBay values (1004,'2019-03-12')
insert into LichBay values (1005,'2019-03-12')
insert into LichBay values (1006,'2019-03-12')
insert into LichBay values (1007,'2019-03-12')
insert into LichBay values (1008,'2019-03-12')
insert into LichBay values (1009,'2019-03-12')
insert into LichBay values (1010,'2019-03-12')
insert into LichBay values (1011,'2019-03-12')
insert into LichBay values (1012,'2019-03-12')
insert into LichBay values (1013,'2019-03-12')
insert into LichBay values (1014,'2019-03-12')
insert into LichBay values (1015,'2019-03-12')
insert into LichBay values (1016,'2019-03-12')
insert into LichBay values (1017,'2019-03-12')
insert into LichBay values (1018,'2019-03-12')
insert into LichBay values (1019,'2019-03-12')
insert into LichBay values (1020,'2019-03-12')

insert into LichBay values (1021,'2019-03-12')
insert into LichBay values (1022,'2019-03-12')
insert into LichBay values (1023,'2019-03-12')
insert into LichBay values (1024,'2019-03-12')
insert into LichBay values (1025,'2019-03-12')
insert into LichBay values (1026,'2019-03-12')
insert into LichBay values (1027,'2019-03-12')
insert into LichBay values (1028,'2019-03-12')
insert into LichBay values (1029,'2019-03-12')
insert into LichBay values (1030,'2019-03-12')
insert into LichBay values (1031,'2019-03-12')
insert into LichBay values (1032,'2019-03-12')
insert into LichBay values (1033,'2019-03-12')
insert into LichBay values (1034,'2019-03-12')
insert into LichBay values (1035,'2019-03-12')
insert into LichBay values (1036,'2019-03-12')
insert into LichBay values (1037,'2019-03-12')
insert into LichBay values (1038,'2019-03-12')
insert into LichBay values (1039,'2019-03-12')
insert into LichBay values (1040,'2019-03-12')

insert into LichBay values (1041,'2019-03-12')
insert into LichBay values (1042,'2019-03-12')
insert into LichBay values (1043,'2019-03-12')
insert into LichBay values (1044,'2019-03-12')
insert into LichBay values (1045,'2019-03-12')
insert into LichBay values (1046,'2019-03-12')
insert into LichBay values (1047,'2019-03-12')
insert into LichBay values (1048,'2019-03-12')
insert into LichBay values (1049,'2019-03-12')
insert into LichBay values (1050,'2019-03-12')
insert into LichBay values (1051,'2019-03-12')
insert into LichBay values (1052,'2019-03-12')
insert into LichBay values (1053,'2019-03-12')
insert into LichBay values (1054,'2019-03-12')
insert into LichBay values (1055,'2019-03-12')
insert into LichBay values (1056,'2019-03-12')
insert into LichBay values (1057,'2019-03-12')
insert into LichBay values (1058,'2019-03-12')
insert into LichBay values (1059,'2019-03-12')
insert into LichBay values (1060,'2019-03-12')

insert into LichBay values (1061,'2019-03-12')
insert into LichBay values (1062,'2019-03-12')
insert into LichBay values (1063,'2019-03-12')
insert into LichBay values (1064,'2019-03-12')
insert into LichBay values (1065,'2019-03-12')
insert into LichBay values (1066,'2019-03-12')
insert into LichBay values (1067,'2019-03-12')
insert into LichBay values (1068,'2019-03-12')
insert into LichBay values (1069,'2019-03-12')
insert into LichBay values (1070,'2019-03-12')
insert into LichBay values (1071,'2019-03-12')
insert into LichBay values (1072,'2019-03-12')
insert into LichBay values (1073,'2019-03-12')
insert into LichBay values (1074,'2019-03-12')
insert into LichBay values (1075,'2019-03-12')

go
create table ChuyenBay(
	MaChuyenBay int identity(1,1) primary key not null,
	MaLichBay int foreign key references LichBay(MaLichBay),
	MaMayBay varchar(4) foreign key references MayBay(MaMayBay),
	GioDi time ,
	GioDen time ,
	TongTien int,
)
go

insert into ChuyenBay values (1000,'MB01','07:30','08:45',1000000)
insert into ChuyenBay values (1000,'MB02','08:30','09:30',2000000)
insert into ChuyenBay values (1000,'MB03','11:20','12:45',3000000)
insert into ChuyenBay values (1000,'MB04','15:00','15:50',1000000)
insert into ChuyenBay values (1000,'MB05','12:45','13:45',2000000)
insert into ChuyenBay values (1000,'MB01','16:00','17:00',3000000)
insert into ChuyenBay values (1000,'MB02','19:30','20:45',2000000)
insert into ChuyenBay values (1000,'MB03','22:00','23:00',1000000)
insert into ChuyenBay values (1000,'MB04','23:45','00:50',2000000)
insert into ChuyenBay values (1000,'MB05','09:45','10:20',3000000)

insert into ChuyenBay values (1001,'MB06','07:30','08:45',2000000)
insert into ChuyenBay values (1001,'MB07','08:30','09:30',2000000)
insert into ChuyenBay values (1001,'MB08','11:20','12:45',3000000)
insert into ChuyenBay values (1001,'MB09','15:00','15:50',1000000)
insert into ChuyenBay values (1001,'MB10','12:45','13:45',2000000)
insert into ChuyenBay values (1001,'MB06','16:00','17:00',3000000)
insert into ChuyenBay values (1001,'MB07','19:30','20:45',2000000)
insert into ChuyenBay values (1001,'MB08','22:00','23:00',1000000)
insert into ChuyenBay values (1001,'MB09','23:45','00:50',2000000)
insert into ChuyenBay values (1001,'MB10','09:45','10:20',3000000)

insert into ChuyenBay values (1002,'MB11','07:30','08:45',3000000)
insert into ChuyenBay values (1002,'MB12','08:30','09:30',2000000)
insert into ChuyenBay values (1002,'MB13','11:20','12:45',3000000)
insert into ChuyenBay values (1002,'MB14','15:00','15:50',1000000)
insert into ChuyenBay values (1002,'MB15','12:45','13:45',2000000)
insert into ChuyenBay values (1002,'MB11','16:00','17:00',3000000)
insert into ChuyenBay values (1002,'MB12','19:30','20:45',2000000)
insert into ChuyenBay values (1002,'MB13','22:00','23:00',1000000)
insert into ChuyenBay values (1002,'MB14','23:45','00:50',2000000)
insert into ChuyenBay values (1002,'MB15','09:45','10:20',3000000)

insert into ChuyenBay values (1003,'MB16','07:30','08:45',3000000)
insert into ChuyenBay values (1003,'MB17','08:30','09:30',2000000)
insert into ChuyenBay values (1003,'MB18','11:20','12:45',3000000)
insert into ChuyenBay values (1003,'MB19','15:00','15:50',1000000)
insert into ChuyenBay values (1003,'MB20','12:45','13:45',2000000)
insert into ChuyenBay values (1003,'MB16','16:00','17:00',3000000)
insert into ChuyenBay values (1003,'MB17','19:30','20:45',2000000)
insert into ChuyenBay values (1003,'MB18','22:00','23:00',1000000)
insert into ChuyenBay values (1003,'MB19','23:45','00:50',2000000)
insert into ChuyenBay values (1003,'MB20','09:45','10:20',3000000)


go

--insert into ChuyenBay values ('CB041','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB042','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB043','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB044','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB045','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB046','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB047','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB048','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB049','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB050','LB05','MB05','07:30','08:45',1500000)

--insert into ChuyenBay values ('CB051','LB06','MB06','07:30','08:45',1000000)
--insert into ChuyenBay values ('CB052','LB06','MB06','07:30','08:45',1000000)
--insert into ChuyenBay values ('CB053','LB06','MB06','07:30','08:45',1000000)
--insert into ChuyenBay values ('CB054','LB06','MB06','07:30','08:45',1000000)
--insert into ChuyenBay values ('CB055','LB06','MB06','07:30','08:45',1000000)
--insert into ChuyenBay values ('CB056','LB06','MB06','07:30','08:45',1000000)
--insert into ChuyenBay values ('CB057','LB06','MB06','07:30','08:45',1000000)
--insert into ChuyenBay values ('CB058','LB06','MB06','07:30','08:45',1000000)
--insert into ChuyenBay values ('CB059','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB060','LB05','MB05','07:30','08:45',1500000)

--insert into ChuyenBay values ('CB061','LB07','MB01','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB062','LB07','MB01','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB063','LB07','MB01','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB064','LB07','MB01','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB065','LB07','MB01','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB066','LB07','MB01','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB067','LB07','MB01','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB068','LB07','MB01','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB069','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB070','LB05','MB05','07:30','08:45',1500000)

--insert into ChuyenBay values ('CB071','LB08','MB02','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB072','LB08','MB02','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB073','LB08','MB02','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB074','LB08','MB02','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB075','LB08','MB02','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB076','LB08','MB02','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB077','LB08','MB02','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB078','LB08','MB02','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB079','LB05','MB05','07:30','08:45',1500000)
--insert into ChuyenBay values ('CB080','LB05','MB05','07:30','08:45',1500000)

--insert into ChuyenBay values ('CB081','LB09','MB03','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB082','LB09','MB03','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB083','LB09','MB03','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB084','LB09','MB03','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB085','LB09','MB03','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB086','LB09','MB03','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB087','LB09','MB03','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB088','LB09','MB03','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB089','LB09','MB03','07:30','08:45',3000000)
--insert into ChuyenBay values ('CB090','LB05','MB05','07:30','08:45',1500000)

--insert into ChuyenBay values ('CB091','LB10','MB04','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB092','LB10','MB04','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB093','LB10','MB04','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB094','LB10','MB04','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB095','LB10','MB04','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB096','LB10','MB04','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB097','LB10','MB04','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB098','LB10','MB04','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB099','LB10','MB04','07:30','08:45',2500000)
--insert into ChuyenBay values ('CB100','LB05','MB05','07:30','08:45',1500000)


--insert into ChuyenBay values ('CB101','LB11','MB05','07:30','08:45',2000000)
--insert into ChuyenBay values ('CB102','LB11','MB05','07:30','08:45',2000000)
--insert into ChuyenBay values ('CB103','LB11','MB05','07:30','08:45',2000000)
--insert into ChuyenBay values ('CB104','LB11','MB05','07:30','08:45',2000000)
--insert into ChuyenBay values ('CB105','LB11','MB05','07:30','08:45',2000000)
--insert into ChuyenBay values ('CB106','LB11','MB05','07:30','08:45',2000000)
--insert into ChuyenBay values ('CB107','LB11','MB05','07:30','08:45',2000000)
--insert into ChuyenBay values ('CB108','LB11','MB05','07:30','08:45',2000000)
--insert into ChuyenBay values ('CB109','LB11','MB05','07:30','08:45',2000000)
--insert into ChuyenBay values ('CB110','LB11','MB05','07:30','08:45',2000000)

--insert into ChuyenBay values ('CB111','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB112','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB113','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB114','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB115','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB116','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB117','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB118','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB119','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB120','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB121','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB122','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB123','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB124','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB125','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB126','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB127','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB128','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB129','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB130','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB131','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB132','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB133','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB134','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB135','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB136','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB137','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB138','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB139','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB140','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB141','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB142','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB143','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB144','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB145','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB146','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB147','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB148','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB149','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB150','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB151','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB152','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB153','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB154','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB155','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB156','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB157','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB158','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB159','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB160','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB161','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB162','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB163','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB164','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB165','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB166','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB167','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB168','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB169','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB170','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB171','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB172','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB173','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB174','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB175','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB176','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB177','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB178','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB179','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB180','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB181','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB182','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB183','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB184','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB185','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB186','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB187','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB188','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB189','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB190','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB191','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB192','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB193','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB194','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB195','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB196','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB197','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB198','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB199','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB200','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB201','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB202','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB203','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB204','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB205','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB206','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB207','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB208','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB209','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB210','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB211','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB212','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB213','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB214','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB215','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB216','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB217','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB218','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB219','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB220','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB221','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB222','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB223','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB224','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB225','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB226','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB227','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB228','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB229','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB230','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB231','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB232','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB233','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB234','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB235','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB236','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB237','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB238','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB239','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB240','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB241','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB242','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB243','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB244','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB245','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB246','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB247','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB248','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB249','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB250','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB251','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB252','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB253','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB254','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB255','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB256','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB257','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB258','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB259','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB260','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB261','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB262','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB263','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB264','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB265','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB266','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB267,'LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB268','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB269','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB270','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB271','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB272','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB273','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB274','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB275','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB276','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB277','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB278','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB279','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB280','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB281','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB282','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB283','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB284','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB285','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB286','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB287','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB288','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB289','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB290','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB291','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB292','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB293','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB294','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB295','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB296','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB297','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB298','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB299','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB300','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB301','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB302','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB303','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB304','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB305','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB306','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB307','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB308','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB309','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB310','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB311','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB312','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB313','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB314','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB315','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB316','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB317','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB318','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB319','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB320','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB321','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB322','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB323','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB324','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB325','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB326','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB327','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB328','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB329','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB330','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB331','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB332','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB333','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB334','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB335','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB336','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB337','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB338','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB339','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB340','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB341','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB342','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB343','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB344','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB345','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB346','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB347','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB348','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB349','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB350','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB351','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB352,'LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB353','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB354','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB355','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB356','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB357','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB358','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB359','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB360','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB161','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB362','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB363','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB364','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB365','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB366','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB367','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB368','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB369','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB370','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB371','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB372','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB373','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB374','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB375','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB376','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB377','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB378','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB379','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB380','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB381','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB382','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB383','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB384','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB385','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB386','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB387','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB388','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB389','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB390','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB391','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB392','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB393','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB394','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB395','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB396','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB397','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB398','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB399','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB400','LB12','MB06','07:30','08:45',5000000)

--insert into ChuyenBay values ('CB401','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB402','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB403','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB404','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB405','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB406','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB407','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB408','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB409','LB12','MB06','07:30','08:45',5000000)
--insert into ChuyenBay values ('CB400','LB12','MB06','07:30','08:45',5000000)

go

create table HangVe(
	MaHangVe int identity(1000,1) primary key not null,
	TenHangVe nvarchar(100) not null,
	GiaTien int,
)
go

insert into HangVe values (N'Vé bình thường',1000000)
insert into HangVe values (N'Vé cao cấp',5000000)

go 

create table DanhSachChuyenBay(
		MaDSChuyenBay int identity(1,1) primary key,
		MaChuyenBay int foreign key references ChuyenBay(MaChuyenBay), 
		MaHangVe int foreign key references HangVe(MaHangVe),
		SoLuongVe int,
		SoLuongVeCon int,
		TongTien int null,
)
go

create table NganHang(
	MaNganHang varchar(4) primary key not null,
	TenNganHang nvarchar(50) not null
)
go

insert into NganHang values ('NH01',N'VietinkBank')
insert into NganHang values ('NH02',N'VietA')
insert into NganHang values ('NH03',N'VPBank')
insert into NganHang values ('NH04',N'VietComBank')

go

create table KhachHang(
	CMND int primary key not null,
	Ho nvarchar(20) not null,
	Ten nvarchar(20) not null,
	GioiTinh nvarchar(4) check(GioiTinh in (N'Nam',N'Nữ',N'Khác')) not null,
	DiaChi nvarchar(100) not null,
	Email varchar(50) ,
	SDT varchar(11),
)
go

insert into KhachHang values(206144301,N'Nguyễn Huy', N'Đức','Nam',N'Quảng Nam','huyduc@email.com','0123456789')
insert into KhachHang values(206144302,N'Nguyễn Đức', N'Huy','Nam',N'Đà Nẵng','duchuy@email.com','0124456789')
insert into KhachHang values(206144303,N'Trần Thị', N'Thảo', N'Nữ',N'Phú Yên','thithao@email.com','0125456789')
insert into KhachHang values(206144304,N'Trương Văn', N'Hùng',N'Khác',N'Hà Nội','vanhung@email.com','0126456789')

go
create table The(
	MaThe int primary key ,
	CMND int foreign key references KhachHang(CMND),
	MaNganHang varchar(4) foreign key references NganHang(MaNganHang),
	SoDu int,
)
go

insert into The values (1234567890,206144301,'NH01',10000000)
insert into The values (1134567890,206144302,'NH02',15000000)
insert into The values (1124567890,206144303,'NH03',20000000)
insert into The values (1144567890,206144304,'NH04',30000000)

go

create table DichVu(
	MaDichVu int identity(1000,1) primary key not null,
	TenDichVu nvarchar(100) not null,
	GiaTien decimal(18,0),
)
go

insert into DichVu values (N'Đồ ăn',200000)
insert into DichVu values (N'Nước uống',50000)

go
create table Ve(
	MaVe int identity(1000,1) primary key not null,
	MaThe int foreign key references The(MaThe) null,
	CMND int foreign key references KhachHang(CMND),
	TongTien int default(0),
)
go

--insert into Ve (MaThe,CMND) values (1234567890,206144301)
--insert into Ve (MaThe,CMND) values (1134567890,null)

--go

create table VeChuyenBay(
	MaVeCB int identity(100,1) primary key not null,
	MaVe int foreign key references Ve(MaVe),
	MaDSChuyenBay int foreign key references DanhSachChuyenBay(MaDSChuyenBay),
	MaDichVu int foreign key references DichVu(MaDichVu) null,
	NgayDat date , 
	ThoiGianBay int null,
	ChoNgoiSo varchar(4) null,
	SoTien int null,
)
go

--insert into VeChuyenBay values(1000,1000,'CB01',1000,'2018-11-11',null,null,null)
--insert into VeChuyenBay values(1000,1001,'CB02',1001,'2018-11-11',null,null,null)
--insert into VeChuyenBay values(1001,1001,'CB01',1000,'2018-11-12',null,null,null)

--go

create trigger TongTien on DanhSachChuyenBay for insert
as 
begin
	Declare @MaDSCB int, @MaHangVe int , @GiaHV int , @MaChuyenBay int ,@GiaCB int ,@SoTien int
	Select @MaDSCB = MaDSChuyenBay from inserted
	Select @MaChuyenBay = MaChuyenBay from inserted
	Select @MaHangVe = MaHangVe from inserted
	Select @GiaCB = TongTien from ChuyenBay where MaChuyenBay = @MaChuyenBay
	Select @GiaHV = GiaTien from HangVe where MaHangVe = @MaHangVe
	Update DanhSachChuyenBay set TongTien = @GiaCB + @GiaHV where MaDSChuyenBay = @MaDSCB
	
end
go

insert into DanhSachChuyenBay values (1,1000,100,100,null)
insert into DanhSachChuyenBay values (1,1001,100,100,null)
insert into DanhSachChuyenBay values (20,1000,100,100,null)
insert into DanhSachChuyenBay values (20,1001,100,100,null)
insert into DanhSachChuyenBay values (39,1000,100,100,null)
insert into DanhSachChuyenBay values (39,1001,100,100,null)

insert into DanhSachChuyenBay values (10,1000,100,90,null)
insert into DanhSachChuyenBay values (2,1001,100,90,null)
insert into DanhSachChuyenBay values (3,1000,100,90,null)
insert into DanhSachChuyenBay values (4,1001,100,90,null)
insert into DanhSachChuyenBay values (5,1000,100,90,null)
insert into DanhSachChuyenBay values (6,1001,100,90,null)
insert into DanhSachChuyenBay values (7,1000,100,90,null)
insert into DanhSachChuyenBay values (8,1001,100,90,null)
insert into DanhSachChuyenBay values (9,1001,100,90,null)



Select dscb.MaDSChuyenBay , cb.MaChuyenBay ,Tenhang ,sb1.TenSanBay as SBDi ,sb2.TenSanBay ,GioDi,NgayDi,hv.MaHangVe 
 from SanBay sb1 , SanBay sb2 , MayBay mb ,LichBay lb , TuyenBay_Hang tbh , TuyenBay tb ,HangHangKhong hhk ,ChuyenBay cb , DanhSachChuyenBay dscb , HangVe hv
 where sb1.MaSanBay = tb.MaSanBayDi and sb2.MaSanBay = tb.MaSanBayDen
	and tbh.MaTuyenBay = tb.MaTuyenBay  and hhk.MaHang = tbh.MaHang 
	and lb.MaTuyenBayHang = tbh.MaTuyenBayHang and cb.MaLichBay = lb.MaLichBay and mb.MaMayBay = cb.MaMayBay
	and cb.MaChuyenBay = dscb.MaChuyenBay and dscb.MaHangVe = hv.MaHangVe
	and sb1.TenSanBay = N'Nội Bài' and sb2.TenSanBay = N'Tân Sơn Nhất' and NgayDi = '2019-05-02' and dscb.SoLuongVeCon >0


--Select TenGhe from MayBay mb inner join SoDoGhe sdg on mb.MaSoDo = sdg.MaSoDo 
--			inner join Ghe g on g.MaSoDo = sdg.MaSoDo
--			where mb.MaMayBay ='MB01'
go

create procedure TaoChuyenBay ( @TenSanBayDi nvarchar(50) , @TenSanBayDen nvarchar(50) , @NgayDi date , @KetQua int out)
as
begin
	set @KetQua = 0
	declare @dem int
	Select @dem = count(tbh.MaTuyenBayHang) from TuyenBay_Hang tbh ,TuyenBay tb ,SanBay sb1 ,SanBay sb2, LichBay lb
	    where sb1.MaSanBay = tb.MaSanBayDi and sb2.MaSanBay = tb.MaSanBayDen and tb.MaTuyenBay = tbh.MaTuyenBay 
		  and lb.MaTuyenBayHang = tbh.MaTuyenBayHang and sb1.TenSanBay = @TenSanBayDi and sb2.TenSanBay = @TenSanBayDen
		  and NgayDi = @NgayDi
	if(@dem = 0)
	begin
		declare CursorChuyenBay Cursor for
			Select MaTuyenBayHang from TuyenBay_Hang tbh ,TuyenBay tb ,SanBay sb1 ,SanBay sb2 
			where sb1.MaSanBay = tb.MaSanBayDi and sb2.MaSanBay = tb.MaSanBayDen
			  and tb.MaTuyenBay = tbh.MaTuyenBay and sb1.TenSanBay = @TenSanBayDi and sb2.TenSanBay = @TenSanBayDen
		open CursorChuyenBay 
		declare @MaTuyenBayHang int  , @MaLichBay int , @MaChuyenBay int
		Fetch next from CursorChuyenBay into @MaTuyenBayHang
		while @@FETCH_STATUS = 0
		begin
			insert into LichBay values (@MaTuyenBayHang,@NgayDi)
			if(@@ROWCOUNT = 1)
			begin
				set @MaLichBay = SCOPE_IDENTITY() 

				insert into ChuyenBay values(@MaLichBay,'MB01','07:30','08:45',1000000)	
				set @MaChuyenBay = SCOPE_IDENTITY() 
				insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)

				insert into ChuyenBay values(@MaLichBay,'MB02','08:30','09:30',2000000)
				set @MaChuyenBay = SCOPE_IDENTITY() 
				insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)
				
-----------------------------------------------------------------------------------------
				--insert into ChuyenBay values(@MaLichBay,'MB03','11:20','12:45',3000000)
				--set @MaChuyenBay = SCOPE_IDENTITY() 
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)

				--insert into ChuyenBay values(@MaLichBay,'MB04','15:00','15:50',1000000)
				--set @MaChuyenBay = SCOPE_IDENTITY() 
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)

				--insert into ChuyenBay values(@MaLichBay,'MB05','12:45','13:45',2000000)
				--set @MaChuyenBay = SCOPE_IDENTITY() 
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)

				--insert into ChuyenBay values(@MaLichBay,'MB01','16:00','17:00',3000000)
				--set @MaChuyenBay = SCOPE_IDENTITY() 
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)

				--insert into ChuyenBay values(@MaLichBay,'MB02','19:30','20:45',2000000)
				--set @MaChuyenBay = SCOPE_IDENTITY() 
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)

				--insert into ChuyenBay values(@MaLichBay,'MB03','22:00','23:00',1000000)
				--set @MaChuyenBay = SCOPE_IDENTITY() 
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)

				--insert into ChuyenBay values(@MaLichBay,'MB04','23:45','00:50',2000000)	
				--set @MaChuyenBay = SCOPE_IDENTITY() 
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)

				--insert into ChuyenBay values(@MaLichBay,'MB05','09:45','10:20',3000000)
				--set @MaChuyenBay = SCOPE_IDENTITY() 
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1000,100,100,null)
				--insert into DanhSachChuyenBay values (@MaChuyenBay,1001,100,100,null)
				Fetch next from CursorChuyenBay into @MaTuyenBayHang
			end
		end
		close CursorChuyenBay
		deallocate CursorChuyenBay
		set @KetQua = 1
	end
	else  set @KetQua = 0
end
go

--declare @acc int
--exec TaoChuyenBay N'Nội Bài' , N'Quảng Nam' , '2019-11-01' , @acc out
--print @acc
--go

