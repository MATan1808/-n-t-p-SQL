use test
go
create table thu (
	tam char(5),
	thang char(4),
	luong int,
	ngaysinh date
)
---ky tu thi trong nhay don 
---kieu unicode thi N''
---nen la so nguyen thi chu can so 
insert dbo.thu (tam,thang,luong, ngaysinh)
values (
	N'tan',
	N'chin',
	123.23,
	'20030818'
)
--- insert kieu khac
use test
go 
create table nam (
	---unique duy nhat and k oco 2 gia tri trugn nhau 
	id char(12) not null primary key,
	ten varchar(100),
	ngaysinh date,
	tongiao varchar(20)
)
---ap dung cho insert all 
insert dbo.nam
values (
	70604,
	N'Ma Nguyen Nhat Tan',
	'20030818',
	N'Phat Giao'
)
---xoa
---delete dbo.nam, xoa het du lieu 
delete dbo.nam where id = 70604 and tongiao ='Phat Giao'

---UPDATE  du lieu 
update dbo.nam set tongiao ='khong co' ---update toan bo ton giao 
update dbo.nam set tongiao ='Thien Chua', id=1 ---update nheiu bang 
update dbo.nam set tongiao ='Phat Giao' where id = 800 ---update theo mon muon 

--- khoa chinh
--unique duy nhat 
--not null: ko dc phep trong
--default: gia tri mac dinh cua truong do neu k oco gia tri khi insert
use test
go
create table khoachinh (
	id int unique,
	name varchar(50) Default N'Ma Nguyen Nhat Tan ',
)
---thay doi gia tri table(sua table )
--- sua khi da tao bang 
alter table dbo.khoachinh add primary key (id)

---constraint pk ten table (khi xoa pk thi xoa lun dc pk)

go 
insert dbo.khoachinh (id)
values (
	5
)
--- khoa ngoai 
--- dieu kie ntao khao ngoai (tham trieu toi khao chinh, cung du lieu, cung so luong sap xep )
--- loi ich: dam bao toan ven du lieu , khong co truogn hop tham  chieu toi du lieu ko ton tai
use test
go 
create table GV (
	id int not null ,
	name varchar(100) default N'Tan Dep Trai',
	---FOREIGN KEY(id) references dbo.BM(ID)--tao khoa ngoai 
)
go
insert GV
values (
	2

)
GO 
ALTER TABLE dbo.GV ADD PRIMARY KEY (id)
--- khoa ngoai ngoai bang 
	ALTER TABLE dbo.GV ADD FOREIGN KEY(id) references dbo.BM(ID)
--- huy ten khoa 
--- alter table dbo.GV drop coustraint pk_GV
GO
use test
create table BM(
	ID INT NOT NULL,
	NAME VARCHAR(100) DEFAULT N'KHOA NGOAI 2',
)
insert BM
values (
	2,
	N'cong nghe phan mem'
)
---cau truc truy van 
use test
go 
create table truyvan (
	matv int,
	tendulieu varchar(100),
	dulieu varchar(50),
	ngaytruycap date
)
insert truyvan
values (
	123,
	N'Co So Du Lieu',
	N'truy van',
	'20221123'
)
go 
select *from dbo.truyvan ---lay het du lieu ra 
---lay matv trong bang truy van \
select matv,tendulieu from dbo.truyvan 
select matv=1,tendulieu from dbo.truyvan 
-- doi ten hien thi 
select matv as '1', tendulieu as '2' from dbo.truyvan
--||
select matv as 'mã', tendulieu as 'tên dữ liệu' from dbo.truyvan
-- truy van 2 ban cung 1 luc 
select * from dbo.BM, dbo.GV
---
select gv.id, bm.ID
from dbo.GV as gv, dbo.BM as bm

