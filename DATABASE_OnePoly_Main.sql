use master
go

create database PRO1014_OnePoly
go

use PRO1014_OnePoly

go


create table nha_san_xuat (
	id int primary key identity(1,1),
	ten_nha_san_xuat varchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1 
)
go



create table he_dieu_hanh (
	id int primary key identity(1,1),
	ten_he_dieu_hanh varchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table mau_sac (
	id int primary key identity(1,1),
	ten_mau_sac nvarchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table chat_lieu (
	id int primary key identity(1,1),
	ten_chat_lieu nvarchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table dung_luong (
	id int primary key identity(1,1),
	dung_luong varchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table imei (
	id int primary key identity(1,1),
	ma_imei varchar(15) unique,
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table gpu (
	id int primary key identity(1,1),
	nha_cung_cap varchar(50),
	loai_gpu varchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table man_hinh (
	id int primary key identity(1,1),
	loai_man_hinh nvarchar(50),
	do_phan_giai varchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table cpu (
	id int primary key identity(1,1),
	nha_cung_cap varchar(50),
	loai_cpu varchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table ram (
	id int primary key identity(1,1),
	dung_luong_ram int,
	loai_ram varchar(20),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table san_pham (
	id int primary key identity(1,1),
	ten_san_pham nvarchar(50),
	loai_san_pham nvarchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table dia_chi (
	id int primary key identity(1,1),
	dia_chi_cu_the nvarchar(100),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table phuong_thuc_thanh_toan (
	id int primary key identity(1,1),
	ten_phuong_thuc nvarchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table voucher (
	id int primary key identity(1,1),
	ten_voucher nvarchar(50),
	ma_voucher varchar(50) unique,
	loai_giam_gia bit,
	gia_tri float,
	so_luong int,
	trang_thai nvarchar(50),
	giam_toi_da float,
	ngay_bat_dau date,
	ngay_ket_thuc date,
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table trang_thai (
	id int primary key identity(1,1),
	ten_trang_thai nvarchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table khach_hang (
	id int primary key identity(1,1),
	dia_chi int ,--liene keet
	ten_khach_hang nvarchar(50),
	gioi_tinh bit,
	ngay_sinh date,
	so_dien_thoai varchar(10) unique,
	email nvarchar(100),
	dia_chi_nguoi_nhan nvarchar(500),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go



select * from khach_hang
create table lich_su_mua_hang (
	id int primary key identity(1,1),
	id_hoa_don int,
	thoi_gian time default getdate(),
	hanh_dong nvarchar(50),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table uu_dai (
	id int primary key identity(1,1),
	id_voucher int ,
	id_khach_hang int,
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

--Chỗ này là hàm sinh tự động không cần quan tâm
CREATE VIEW vw_getRANDValue AS
SELECT RAND() AS Value
go

CREATE FUNCTION dbo.RandomString()
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @CharPool VARCHAR(36) = 'abcdefghijklmnopqrstuvwxyz0123456789'
    DECLARE @PoolLength INT = LEN(@CharPool)
    DECLARE @RandomString VARCHAR(10) = ''
    DECLARE @Index INT = 0
    WHILE @Index < 10
    BEGIN
        SELECT @RandomString = @RandomString + SUBSTRING(@CharPool, CONVERT(INT, (SELECT Value FROM vw_getRANDValue) * @PoolLength) + 1, 1)
        SELECT @Index = @Index + 1
    END
    RETURN @RandomString
END
go

create table thanh_toan (
	id int primary key identity(1,1),
	id_phuong_thuc_thanh_toan int ,
	id_hoa_don int,
	ma_giao_dich varchar(10) DEFAULT (dbo.RandomString()),
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table nhan_vien (
	id int primary key identity(1,1),
	ma_nhan_vien varchar(10),
	ten_nhan_vien nvarchar(50) ,
	ngay_sinh date,
	dia_chi int,
	gioi_tinh bit,
	luong float,
	email varchar(100),
	so_dien_thoai varchar(11) ,
	mat_khau varchar(50),
	so_cccd varchar(12) ,
	vai_tro bit,
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table hoa_don_chi_tiet (
	id int primary key identity(1,1),
	id_hoa_don int ,
	id_chi_tiet_san_pham int unique,
	gia float,
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

create table chi_tiet_san_pham (
	id int primary key identity(1,1),
	san_pham int ,
	ram int,
	cpu int,
	man_hinh int,
	gpu int,
	he_dieu_hanh int,
	mau_sac int,
	chat_lieu int,
	dung_luong int,
	imei int unique,
	nha_san_xuat int,
	trong_luong float,
	gia float,
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go


create table hoa_don (
	id int primary key identity(1,1),
	ten_nhan_vien int ,
	ten_khach_hang int,
	ma_voucher int,
	trang_thai int,
	loai_hoa_don nvarchar(50),
	dia_chi_nguoi_nhan nvarchar(100),
	ten_nguoi_nhan nvarchar(50),
	so_dien_thoai varchar(10),
	tien_ship float,
	tien_mat float,
	tien_chuyen_khoan float,
	tong_tien float,
	nguoi_tao int,
	ngay_tao date default getdate(),
	nguoi_sua int,
	ngay_sua date default getdate(),
	deleted bit default 1
)
go

ALTER TABLE khach_hang ADD FOREIGN KEY (dia_chi) REFERENCES dia_chi (id);
ALTER TABLE khach_hang ADD FOREIGN KEY (nguoi_tao) REFERENCES nhan_vien (id);
ALTER TABLE khach_hang ADD FOREIGN KEY (nguoi_sua) REFERENCES nhan_vien (id);

ALTER TABLE uu_dai ADD FOREIGN KEY (id_khach_hang) REFERENCES khach_hang (id);
ALTER TABLE uu_dai ADD FOREIGN KEY (id_voucher) REFERENCES voucher (id);
ALTER TABLE uu_dai ADD FOREIGN KEY (nguoi_tao) REFERENCES nhan_vien (id);
ALTER TABLE uu_dai ADD FOREIGN KEY (nguoi_sua) REFERENCES nhan_vien (id);

ALTER TABLE thanh_toan ADD FOREIGN KEY (id_phuong_thuc_thanh_toan) REFERENCES phuong_thuc_thanh_toan (id);
ALTER TABLE thanh_toan ADD FOREIGN KEY (id_hoa_don) REFERENCES hoa_don (id);
ALTER TABLE thanh_toan ADD FOREIGN KEY (nguoi_tao) REFERENCES nhan_vien (id);
ALTER TABLE thanh_toan ADD FOREIGN KEY (nguoi_sua) REFERENCES nhan_vien (id);

ALTER TABLE nhan_vien ADD FOREIGN KEY (dia_chi) REFERENCES dia_chi (id);

ALTER TABLE hoa_don ADD FOREIGN KEY (ten_nhan_vien) REFERENCES nhan_vien (id);
ALTER TABLE hoa_don ADD FOREIGN KEY (ten_khach_hang) REFERENCES khach_hang (id);
ALTER TABLE hoa_don ADD FOREIGN KEY (ma_voucher) REFERENCES voucher (id);
ALTER TABLE hoa_don ADD FOREIGN KEY (trang_thai) REFERENCES trang_thai (id);
ALTER TABLE hoa_don ADD FOREIGN KEY (nguoi_tao) REFERENCES nhan_vien (id);
ALTER TABLE hoa_don ADD FOREIGN KEY (nguoi_sua) REFERENCES nhan_vien (id);

ALTER TABLE lich_su_mua_hang ADD FOREIGN KEY (id_hoa_don) REFERENCES hoa_don (id);
ALTER TABLE lich_su_mua_hang ADD FOREIGN KEY (nguoi_tao) REFERENCES nhan_vien (id);
ALTER TABLE lich_su_mua_hang ADD FOREIGN KEY (nguoi_sua) REFERENCES nhan_vien (id);

ALTER TABLE hoa_don_chi_tiet ADD FOREIGN KEY (id_hoa_don) REFERENCES hoa_don (id);
ALTER TABLE hoa_don_chi_tiet ADD FOREIGN KEY (id_chi_tiet_san_pham) REFERENCES chi_tiet_san_pham (id);
ALTER TABLE hoa_don_chi_tiet ADD FOREIGN KEY (nguoi_tao) REFERENCES nhan_vien (id);
ALTER TABLE hoa_don_chi_tiet ADD FOREIGN KEY (nguoi_sua) REFERENCES nhan_vien (id);

ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (san_pham) REFERENCES san_pham (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (ram) REFERENCES ram (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (cpu) REFERENCES cpu (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (man_hinh) REFERENCES man_hinh (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (gpu) REFERENCES gpu (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (he_dieu_hanh) REFERENCES he_dieu_hanh (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (mau_sac) REFERENCES mau_sac (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (chat_lieu) REFERENCES chat_lieu (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (dung_luong) REFERENCES dung_luong (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (nha_san_xuat) REFERENCES nha_san_xuat (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (imei) REFERENCES imei(id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (nguoi_tao) REFERENCES nhan_vien (id);
ALTER TABLE chi_tiet_san_pham ADD FOREIGN KEY (nguoi_sua) REFERENCES nhan_vien (id);

insert into nha_san_xuat(ten_nha_san_xuat) values 
('Acer'),
('Dell'),
('Hp'),
('Asus'),
('Msi'),
('Lenovo'),
('Itel'),
('Apple')
go

insert into he_dieu_hanh(ten_he_dieu_hanh) values 
('Window'),
('Mac OS'),
('Linux'),
('Ubuntu'),
('FreeBSD')
go

insert into mau_sac(ten_mau_sac) values 
(N'Đỏ'),
(N'Đen'),
(N'Trắng'),
(N'Xám'),
(N'Hồng')
go

insert into chat_lieu(ten_chat_lieu) values 
(N'Nhựa'),
(N'Nhôm'),
(N'Cacbon'),
(N'Titan'),
(N'Thép')
go

insert into dung_luong(dung_luong) values 
('128GB'),
('256GB'),
('512GB'),
('1T'),
('2T')
go

insert into imei(ma_imei) values 
('938439130573925'),
('912839747362347'),
('323248238472836'),
('512631387283823'),
('327682684328746'),
('269563805493572'),
('124578954673547'),
('765947453734246'),
('565687697957456'),
('576979057564644'),
('464759569574646'),
('374757585854645'),
('537485856465345'),
('364757585656537'),
('464758548436464'),
('252434673283685'),
('746324219484635'),
('163645856946353'),
('625176129845937'),
('165374846335356')
go

insert into gpu(nha_cung_cap, loai_gpu) values 
('NVIDIA', 'GTX 3070'),
('NVIDIA', 'GTX 3040'),
('NVIDIA', 'GTX 3050'),
('NVIDIA', 'GTX 3060'),
('AMD', 'Radeon RX 7000'),
('AMD', 'Radeon RX 5000'),
('AMD', 'Radeon RX 6000'),
('Apple', 'Card tích hợp')
go

insert into man_hinh(loai_man_hinh, do_phan_giai) values 
('IPS LCD', 'HD'),
('IPS LCD', 'FULL HD'),
('IPS LCD', '2K'),
('IPS LCD', '4k'),
('AMOLED', 'HD'),
('AMOLED', 'FULL HD'),
('AMOLED', '2K'),
('AMOLED', '4K')
go

insert into cpu(nha_cung_cap, loai_cpu) values 
('Intel', 'intel core i5'),
('Intel', 'intel core i7'),
('Intel', 'intel core i9'),
('AMD', 'ryezen 7'),
('AMD', 'ryezen 5'),
('AMD', 'ryezen 9'),
('Apple', 'M1'),
('Apple', 'M2'),
('Apple', 'M3')
go

insert into ram(dung_luong_ram, loai_ram) values 
(4, 'DDR4'),
(8, 'DDR5'),
(16, 'DDR6'),
(32, 'DDR7'),
(64, 'DDR8'),
(128, 'DDR9')
go

insert into san_pham(ten_san_pham, loai_san_pham) values 
('Nitro 5', 'Gaming'),
('MacBook Air 13', 'Sang trọng'),
('Ideapad 3', 'Văn phòng'),
('Vivobook X515EA', 'Mỏng nhẹ'),
('Asus TUF Gaming F15 FX506HF i5 (HN014W)', 'Gaming'),
('Asus Vivobook X515EA i3 (EJ3948W)', 'Mỏng nhẹ'),
('HP 15s fq2716TU i3 (7C0X3PA)', 'Mỏng nhẹ'),
('HP Pavilion 15 eg2082TU i5', 'Mỏng nhẹ'),
('Laptop Lenovo Ideapad 3 15ITL6 i5 ', 'Mỏng nhẹ'),
(' Dell Inspiron 15 3520 i5', 'Mỏng nhẹ'),
(' Asus Vivobook 15 OLED A1505VA i5', 'Mỏng nhẹ'),
('Acer Aspire 3 A315 58 54XF i5', 'Mỏng nhẹ'),
('Dell Vostro 15 3520 i3', 'Mỏng nhẹ'),
(' MSI Gaming GF63 Thin 11SC i5', 'Gaming'),
(' Lenovo IdeaPad Slim 3 14IAH8 83EQ0005VN', 'Mỏng nhẹ'),
('Asus VivoBook 14 OLED M1405YA-KM047W', 'Mỏng nhẹ'),
(' Lenovo IdeaPad 3 14ITL6 82H701QWVN', 'Mỏng nhẹ'),
('HP Envy X360 2IN1 14-ES0013', 'Mỏng nhẹ'),
('Asus Vivobook X415MA-BV451W', 'Mỏng nhẹ'),
('HP Pavilion 15 eg2082TU i5', 'Mỏng nhẹ')
go
insert into phuong_thuc_thanh_toan(ten_phuong_thuc) values
(N'Tiền mặt'),
(N'Chuyển khoản'),
(N'Thẻ tín dụng'),
(N'Ví điện tử và thanh toán trực tuyến'),
(N'Thanh toán qua cổng thanh toán trực tuyến'),
(N'Trả góp'),
(N'Chứng nhận quà tặng hoặc thẻ quà tặng')
go

insert into trang_thai(ten_trang_thai) values
(N'Đã thanh toán'),
(N'Chờ thanh toán'),
(N'Đã hủy')
go

insert into dia_chi(dia_chi_cu_the) values 
(N'Số 12, đường Nguyễn Văn Cừ, phường An Bình, thị xã Tân Uyên, tỉnh Bình Dương'),
(N'Số 25, đường Lê Lợi, phường 1, thành phố Vĩnh Long, tỉnh Vĩnh Long'),
(N'Số 34, đường Trần Phú, phường Hòa An, thành phố Cao Bằng, tỉnh Cao Bằng'),
(N'Số 45, đường Nguyễn Thị Minh Khai, phường Ninh Hiệp, thị xã Ninh Hòa, tỉnh Khánh Hòa'),
(N'Số 7, đường Phú Diễn, Quận Nam Từ Liêm ,Thành phố Hà Nội'),
(N'Số 26, đường Xuân Tảo,Quận Cầu Giấy thành phố Hà Nội'),
(N'Số 4, đường Xuân Nham, Quận Nam Từ Liêm, thành phố Hà Nội'),
(N'Số 11, đường Phan Kế Toại,Quận Hà Đông, thành phố Hà Nội'),
(N'Số 21, đường Đỗ Mười, Quận Hoàng Mai,  thành phố Hà Nội'),
(N'Số 1, đường Xuân Khôi, Quận Long Biên, thành phố Hà Nội'),
(N'Số 09, đường An Bình, Quận 5,  thành phố Hồ Chí Minh'),
(N'Số 14, đường Bạch Đằng, Quận 3, thành phố Hồ Chí Minh'),
(N'Số 04, đường Phong Phú ,Quận 11, thành phố Hồ Chí Minh'),
(N'Số 67, đường Quang Trung, Quận Giò Vấp,  thành phố Hồ Chí Minh'),
(N'Số 85, đường Lý Chính Thắng ,Quận 10, thành phố Hồ Chí Minh'),
(N'Số 5, đường Vạn Kiếp,Quận Bình Thạnh,  thành phố Hồ Chí Minh'),
(N'Số 67, đường Nguyễn Gia TrÍ, Quận 9,  thành phố Hồ Chí Minh'),
(N'Số 11, đường Phan Xích Long,Quận Phú Nhuận,  thành phố Hồ Chí Minh'),
(N'Số 56, đường Lý Thường Kiệt, phường Đông Thọ, thành phố Thanh Hóa, tỉnh Thanh Hóa'),
(N'Số 1, đường Nguyễn Văn Linh, Quận Hoàng Kiếm, thành phố Hà Nội')

go

insert into khach_hang(dia_chi, ten_khach_hang, gioi_tinh, ngay_sinh, so_dien_thoai,email) values 
(1, N'Nguyễn Khắc Kiên', 1, '2004-02-04', '0973728562','nguyenkhackien@gmail.com'),
(2, N'Nguyễn Trung Dũng', 1, '2004-07-14', '0364780741','nguyenquangdung@gmail.com'),
(3, N'Nguyễn Quang Vinh', 1, '2004-08-05', '0347847384','nguyenquangvinh@gmail.com'),
(4, N'Trần Thị Quế', 0, '2004-02-15', '0374289744','tranthique@gmail.com'),
(5, N'Nguyễn Tuấn Anh', 1, '2004-07-23', '0379237488','nguyentuananh@gmail.com'),
(6, N'Hoàng Hoài Phương', 0, '2004-05-17', '0352874387','hoanghoaiphuong@gmail.com'),
(7, N'Vũ Huyền Anh', 0, '2004-05-01', '0357779457','vuhuyenanh@gmail.com'),
(8, N'Lê Tú Anh', 0, '2004-04-12', '0702535812','letuanh@gmail.com'),
(9, N'Lê Hoàng Diệu', 0, '2004-04-11', '0979190626','lehoangdieu@gmail.com'),
(10, N'Trần Bảo Ngọc', 0, '2004-05-13', '0974797278','tranbaongoc@gmail.com'),
(11, N'Nguyễn Anh Khôi', 1, '2004-11-01', '0971896307','nguyenanhkhoi@gmail.com'),
(12, N'Hoàng Minh Quân', 1, '2004-05-07', '0397935052','hoangminhquan@gmail.com'),
(13, N'Nguyễn Ngọc Ánh', 0, '2004-09-13', '0356466385','nguyenngocanh@gmail.com'),
(14, N'Nguyễn Đức Trung', 1, '2004-11-09', '0333641746','nguyenductrung@gmail.com'),
(15, N'Vũ Bích Duyên', 0, '2004-09-01', '0335896839','vubichduyen@gmail.com'),
(16, N'Lê Đức Toàn', 1, '2004-04-17', '0981536443','leductoan@gmail.com'),
(17, N'Trần Quỳnh Anh', 0, '2004-05-17', '0796501176','tranquynhanh@gmail.com'),
(18, N'Trinh Minh Quang', 1, '2004-05-15', '0586500510','trinhminhquanh@gmail.com'),
(19, N'Lê Thanh Hằng', 0, '2004-06-06', '0784336837','lethanhhang@gmail.com'),
(20, N'Nguyễn Ngọc Trâm', 0, '2004-05-17', '0982559824','nguyenngoctram@gmail.com')



go

insert into nhan_vien ( ma_nhan_vien,ten_nhan_vien,ngay_sinh,dia_chi,gioi_tinh, luong,email, so_dien_thoai,mat_khau, so_cccd,vai_tro) values
('NV01', N'Nguyễn Khắc Kiên','2004-02-04',1,1,15000000, 'nguyenkhackien@gmail.com','0973728562','kiennk','027432948834',1),
('NV02', N'Nguyễn Trung Dũng', '2004-07-12',2,1,13000000, 'nguyentrungdung@gmail.com','0364780741','dungnt','037356789637',0),
('NV03', N'Nguyễn Quang Vinh', '2004-08-05',3,1,20000000, 'nguyenquangvinh@gmail.com','0347847384','vinhnq','037367893456',1),
('NV04', N'Trần Thị Quế', '2004-02-12',4,0,15000000, 'tranthique@gmail.com','0374289744','quett','037378653456',1),
('NV05', N'Nguyễn Tuấn Anh', '2004-07-06',5,1,100000000,'nguyentuananh@gmail.com', '0379237488','anhnt','037634534567',0),
('NV06', N'Hoàng Hoài Phương', '2004-05-12',6,0,15000000, 'hoanghoaiphuong@gmail.com','0352874387','phuonghh','037345678765',1),
('NV07', N'Vũ Huyền Anh', '2004-05-01',7,0,12000000, 'vuhuyenanh@gmail.com','0357779457','anhvh','008458972349',1),
('NV08', N'Lê Tú Anh', '2004-04-12',8,0,20000000, 'letuanh@gmail.com','0702535812','anhlt','015345798422',1),
('NV09', N'Lê Hoàng Diệu', '2004-04-11',9,0,30000000,'lehoangdieu@gmail.com', '0979190626','dieulh','019445679246',0),
('NV10', N'Trần Bảo Ngọc', '2004-05-03',10,0,25000000, 'tranbaongoc@gmail.com','0974797278','ngoctb','025678469021',1),
('NV11', N'Nguyễn Anh Khôi', '2004-11-01',11,1,15000000,'nguyenanhkhoi@gmail.com', '0971896307','khoina','052345679312',1),
('NV12', N'Hoàng Minh Quân', '2004-05-07',12,1,15000000, 'hoangminhquan@gmail.com','0397935052','quanhm','002345678245',0),
('NV13', N'Nguyễn Ngọc Ánh', '2004-09-11',13,0,15000000 ,'nguyenngocanh@gmail.com','0356466385','anhnn','017453794180',1),
('NV14', N'Nguyễn Đức Trung', '2004-11-09',14,1,14000000, 'nguyenductrung@gmail.com','0333641746','trungnd','032412895370',0),
('NV15', N'Vũ Bích Duyên', '2004-09-01',15,0,14000000, 'vubichduyen@gmail.com','0335896839','duyenvb','07213573690',0),
('NV16', N'Lê Đức Toàn', '2004-04-07',16, 1,20000000,'leductoan@gmail.com','0981536443','toanld','037378994567',1),
('NV17', N'Trần Quỳnh Anh', '2004-05-07',17,0,15000000, 'tranquynhanh@gmail.com','0796501176','anhtq','061348905432',1),
('NV18', N'Trinh Minh Quang', '2004-05-05',18,1,20000000 ,'trinhminhquanh@gmail.com','0586500510','quangtm','022426894527',1),
('NV19', N'Lê Thanh Hằng', '2004-06-06',19,0,15000000, 'lethanhhang@gmail.com','0784336837','hanglt','037308556737',0),
('NV20', N'Nguyễn Ngọc Trâm', '2004-05-07',20,0,20000000, 'nguyenngoctram@gmail.com','0982559824','tramnn','037304557932',1)
go

insert into voucher(ten_voucher, ma_voucher, loai_giam_gia, so_luong, giam_toi_da) values
(N'Mừng sinh nhật', 'dnau8743dh', 0, 1000, 10),
(N'Mừng quốc khánh', '783dhusy8c', 1, 2500, 100000),
(N'Ưu đãi xuân về', 's9fs83dhis', 0, 3000, 15),
(N'Ưu đãi sinh viên', 'bcjds7rnfj', 0, 5000, 5),
(N'Khách hàng thân thiết', 'dsiu9r3end', 1, 500, 1000000),
(N'Khách hàng mới', 'dgrh356dh', 0, 5000, 5)
go

INSERT INTO voucher (ten_voucher, ma_voucher, loai_giam_gia, gia_tri, so_luong, giam_toi_da, ngay_bat_dau, ngay_ket_thuc, trang_thai, nguoi_tao, nguoi_sua)
VALUES
('Voucher 5', 'KienBAnq11', 1, 10.5, 100, 50.0, '2023-11-01', '2023-11-30', N'Đang áp dụng', 1, 1),
('Voucher 6', 'VOUCHER01022', 0, 20.0, 50, 30.0, '2023-12-05', '2023-12-25', N'Sắp áp dụng', 2, 2),
('Voucher 7', 'VOUCHER01133', 1, 15.0, 200, 70.0, '2023-11-10', '2023-12-10', N'Đang áp dụng', 1, 1),
('Voucher 8', 'VOUCHER01233', 0, 30.0, 75, 40.0, '2023-11-15', '2023-12-15', 'Đàng áp dụng', 3, 3),
('Voucher 9', 'KienBAnq55', 1, 10.5, 100, 50.0, '2023-11-01', '2023-11-30', N'Đang áp dụng', 1, 1),
('Voucher 10', 'VOUCHER01066', 0, 20.0, 50, 30.0, '2023-12-05', '2023-12-25', N'Sắp áp dụng', 2, 2),
('Voucher 11', 'VOUCHER01177', 1, 15.0, 200, 70.0, '2023-11-10', '2023-12-10', N'Đang áp dụng', 1, 1),
('Voucher 12', 'VOUCHER01288', 0, 30.0, 75, 40.0, '2023-11-15', '2023-12-15', 'Đàng áp dụng', 3, 3),
('Voucher 13', 'KienBAnq99', 1, 10.5, 100, 50.0, '2023-11-01', '2023-11-30', N'Đang áp dụng', 1, 1)

insert into uu_dai(id_khach_hang, id_voucher) values
(1, 5),
(2, 5),
(4, 5)
go



insert into chi_tiet_san_pham(san_pham, ram, cpu, man_hinh, gpu, he_dieu_hanh, mau_sac, chat_lieu, dung_luong,imei, nha_san_xuat, trong_luong, gia) values
(1, 2, 5, 4, 2, 1, 2, 2, 3,1, 1, 2.2, 23000000),
(2, 2, 5, 3, 5, 2, 5, 2, 4,2, 8, 1.3, 30000000),
(3, 1, 3, 4, 2, 1, 3, 1, 5,3, 2, 1.5 , 16500000),
(4, 2, 1, 4, 2, 2, 2, 1, 5,4, 2, 2.2 , 17500000),
(5, 1, 3, 3, 3, 1, 3, 2, 5,5, 1, 1.5 , 18500000),
(6, 4, 1, 4, 2, 1, 3, 2, 3,6, 2, 2.4 , 10000000),
(7, 3, 3, 3, 2, 2, 5, 1, 4,7, 8, 1.5 , 12000000),
(8, 3, 2, 4, 4, 1, 3, 2, 5,8, 2, 1.3 , 16000000),
(9, 3, 3, 4, 2, 1, 3, 1, 5,9, 8, 1.5 , 20000000),
(10, 2, 3, 3, 2, 2, 2, 2, 4,10, 1, 1.5 , 17500000),
(11, 2, 1, 4, 5, 2, 3, 1, 3,11, 2, 2.2 , 16500000),
(12, 1, 3, 3, 4, 1, 3, 2, 5,12, 2, 1.5 , 11500000),
(13, 1, 2, 1, 2, 2, 5, 1, 4,13, 8, 1.3 , 10500000),
(14, 1, 3, 4, 5, 1, 5, 2, 5, 14,2, 1.5 , 10000000),
(15, 4, 5, 3, 2, 1, 3, 1, 3,15, 8, 2.5 , 17000000),
(16, 3, 3, 4, 5, 2, 2, 2, 4,16, 2, 3.5 , 13000000),
(17, 2, 2, 4, 2, 1, 3, 1, 5,17, 1, 1.8 , 17500000),
(18, 2, 1, 3, 1, 1, 5, 1, 3,18, 2, 3.5 , 17000000),
(19, 3, 3, 4, 2, 2, 3, 2, 5,19, 2, 2.5 , 19500000),
(20, 3, 3, 4, 5, 1, 3, 1, 4,20, 1, 1.5 , 13500000)
go
INSERT INTO hoa_don (ten_nhan_vien, ten_khach_hang, ma_voucher, trang_thai, loai_hoa_don, dia_chi_nguoi_nhan, ten_nguoi_nhan, so_dien_thoai, tien_ship, tong_tien, ngay_tao) VALUES
(1, 1, 1, 1, N'Bán tại quầy', N'Phú Diễn', N'Hoài Phương', '0562978049', 20000, 3000000, '2023-08-13'),
(7, 2, 1, 1, N'Bán tại quầy', N'Nguyên Xá', N'Minh Quang', '0563345892', 50000, 1700000, '2023-03-13'),
(8, 3, 1, 1, N'Khách đặt hàng', N'Phan Xích Long', N'Anh Khôi', '0343569244', 40000, 3000000, '2022-04-13'),
(9, 4, 1, 1, N'Bán tại quầy', N'Quang Trung', N'Anh Khôi', '0563576025', 70000, 3000000, '2023-05-13'),
(10, 5, 1, 1, N'Bán tại quầy', N'Văn Trì', N'Minh Quang', '0563896456', 60000, 10000000, '2019-06-19'),
(11, 6, 1, 1, N'Bán tại quầy', N'Đỗ Mười', N'Bảo Ngọc', '0563893478', 50000, 22000000, '2023-08-28'),
(12, 7, 1, 1, N'Khách đặt hàng', N'Hoàng Hoa Thám', N'Thanh Hằng', '0563489025', 50000, 1300000, '2018-07-13'),
(13, 8, 1, 1, N'Khách đặt hàng', N'Tây Hồ', N'Đức Trung', '0549767025', 20000, 10000000, '2023-12-05'),
(14, 9, 1, 1, N'Bán tại quầy', N'Xuân Thủy', N'Minh Quang', '0979896025', 70000, 14000000, '2019-12-06'),
(15, 10, 1, 1, N'Khách đặt hàng', N'Long Biên', N'Hương Quế', '0673896025', 80000, 21000000, '2023-12-07'),
(11, 11, 1, 1, N'Bán tại quầy', N'Đỗ Mười', N'Bảo Ngọc', '0563893478', 50000, 3000000, '2023-12-08'),
(12, 12, 1, 1, N'Khách đặt hàng', N'Hoàng Hoa Thám', N'Thanh Hằng', '0563489025', 50000, 3000000, '2013-12-09'),
(13, 13, 1, 1, N'Khách đặt hàng', N'Tây Hồ', N'Đức Trung', '0549767025', 20000, 18000000, '2023-12-10'),
(14, 14, 1, 1, N'Bán tại quầy', N'Xuân Thủy', N'Minh Quang', '0979896025', 70000, 37000000, '2023-12-11'),
(15, 15, 1, 1, N'Khách đặt hàng', N'Long Biên', N'Hương Quế', '0673896025', 80000, 3000000, '2023-12-12'),
(14, 1, 1, 1, N'Bán tại quầy', N'Xuân Thủy', N'Minh Quang', '0979896025', 70000, 43000000, '2019-11-06'),
(15, 2, 1, 1, N'Khách đặt hàng', N'Long Biên', N'Hương Quế', '0673896025', 80000, 8000000, '2023-10-07'),
(11, 5, 1, 1, N'Bán tại quầy', N'Đỗ Mười', N'Bảo Ngọc', '0563893478', 50000, 5000000, '2023-09-08'),
(12, 4, 1, 1, N'Khách đặt hàng', N'Hoàng Hoa Thám', N'Thanh Hằng', '0563489025', 50000, 14000000, '2013-08-09'),
(13, 6, 1, 1, N'Khách đặt hàng', N'Tây Hồ', N'Đức Trung', '0549767025', 20000, 3000000, '2023-07-10'),
(14, 7, 1, 1, N'Bán tại quầy', N'Xuân Thủy', N'Minh Quang', '0979896025', 70000, 41000000, '2023-06-11'),
(15, 8, 1, 1, N'Khách đặt hàng', N'Long Biên', N'Hương Quế', '0673896025', 80000, 24000000, '2023-05-12'),
(12, 9, 1, 1, N'Khách đặt hàng', N'Hoàng Hoa Thám', N'Thanh Hằng', '0563489025', 50000, 21000000, '2013-04-09'),
(13, 10, 1, 1, N'Khách đặt hàng', N'Tây Hồ', N'Đức Trung', '0549767025', 20000, 19000000, '2023-05-30'),
(14, 1, 1, 1, N'Bán tại quầy', N'Xuân Thủy', N'Minh Quang', '0979896025', 70000, 10000000, '2023-04-20'),
(15, 10, 1, 1, N'Khách đặt hàng', N'Long Biên', N'Hương Quế', '0673896025', 80000, 3560000, '2023-03-15');

select * from hoa_don
select * from hoa_don
select * from trang_thai

go

insert into hoa_don_chi_tiet(id_hoa_don, id_chi_tiet_san_pham) values
(1,	1),
(1,	3),
(1,	5),
(1,	7),
(1,	9),
(1,	11),
(1,	13),
(2,2),
(2,4),
(2,6),
(2,8),
(2,10),
(2,12),
(3,14),
(3,15),
(3,16),
(3,17),
(3,18),
(3,19),
(3,20)
go

insert into lich_su_mua_hang(id_hoa_don, hanh_dong, nguoi_tao) values
(1, N'Tạo hóa đơn', 1),
(1, N'Đơn hàng đã giao thành công', 1),
(2, N'Tạo hóa đơn', 1),
(2, N'Cập nhật trạng thái hóa đơn', 1),
(3, N'Giao hàng không thành công',1 ),
(4, N'Đang giao hàng', 1),
(5, N'Giao hàng thành công', 1),
(6, N'Đang giao hàng', 1),
(7, N'Giao hàng thành công', 1),
(8, N'Giao hàng không thành công', 1),
(9, N'Giao hàng không thành công', 1),
(10, N'Đang giao hàng', 1),
(11, N'Giao hàng thành công', 1),
(12, N'Giao hàng không thành công', 1),
(13, N'Đang giao hàng', 1),
(14, N'Giao hàng thành công', 1),
(15, N'Giao hàng không thành công', 1)
go

select ten_khach_hang ,gioi_tinh,ngay_sinh,so_dien_thoai,email,dia_chi.dia_chi_cu_the,dia_chi_nguoi_nhan from khach_hang		
join dia_chi on dia_chi.id=khach_hang.dia_chi
select * from dia_chi
 select id from voucher where ma_voucher like ?
 select * from voucher

 select * from uu_dai

	SELECT * FROM khach_hang

SELECT
    kh.ten_khach_hang,
    kh.gioi_tinh,
    kh.ngay_sinh,
    kh.so_dien_thoai,
    kh.email,
    dc.dia_chi_cu_the,
    kh.dia_chi_nguoi_nhan
FROM (
    SELECT *,
        ROW_NUMBER() OVER (ORDER BY id) AS RowNum
    FROM chi_tiet_san_pham
    WHERE deleted = 1
)
ORDER BY kh.id
OFFSET 1 ROWS FETCH NEXT 5 ROWS ONLY



select * from khach_hang
 

 select id , dia_chi_cu_the from dia_chi
 select * from dia_chi

 select dia_chi.dia_chi_cu_the from dia_chi
 join  khach_hang on dia_chi.id=khach_hang.dia_chi
  where khach_hang.id=1;



SELECT ten_voucher, ma_voucher, loai_giam_gia, gia_tri, so_luong, ngay_bat_dau, ngay_ket_thuc, trang_thai
FROM voucher
WHERE deleted = 1
ORDER BY id
OFFSET 1  ROWS FETCH NEXT 3 ROWS ONLY;


 select * from voucher where deleted = 1


select * from hoa_don
select sum(tong_tien) from hoa_don

update hoa_don set tong_tien = 5000000	

SELECT top 8 ngay_tao AS Ngay, SUM(tong_tien) AS TongTien_Theo_Ngay
FROM hoa_don
WHERE deleted = 1 
GROUP BY ngay_tao
ORDER BY ngay_tao DESC

select * from trang_thai

--
SELECT Year( hoa_don.ngay_tao), SUM(hoa_don.tong_tien)
FROM hoa_don
JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
WHERE hoa_don.trang_thai = 1 
GROUP BY hoa_don.ngay_tao


-- Select  doanh thhhu năm
SELECT Year( hoa_don.ngay_tao), SUM(hoa_don.tong_tien) from hoa_don 
JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
WHERE hoa_don.trang_thai = 1 
Group by Year( hoa_don.ngay_tao)
order by Year( hoa_don.ngay_tao) desc 


 --Select tháng trong năm
	SELECT MONTH(hoa_don.ngay_tao) AS Thang ,SUM(hoa_don.tong_tien) AS TongTien
	FROM hoa_don
	JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
	WHERE hoa_don.trang_thai = 1 and  YEAR(hoa_don.ngay_tao) = 2023
	GROUP BY YEAR(hoa_don.ngay_tao), MONTH(hoa_don.ngay_tao)  
	ORDER BY YEAR(hoa_don.ngay_tao) DESC, MONTH(hoa_don.ngay_tao) DESC

	SELECT MONTH(hoa_don.ngay_tao) AS Thang ,SUM(hoa_don.tong_tien) AS TongTien
              	FROM hoa_don
              	JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
              	WHERE hoa_don.trang_thai = 1 and  YEAR(hoa_don.ngay_tao) = 2018
              	GROUP BY YEAR(hoa_don.ngay_tao), MONTH(hoa_don.ngay_tao)  
              	ORDER BY YEAR(hoa_don.ngay_tao) DESC, MONTH(hoa_don.ngay_tao) DESC

--Select ngày trong tháng
SELECT DAY(hoa_don.ngay_tao) AS NgayTrongThang , MONTH(hoa_don.ngay_tao) AS Thang,SUM(hoa_don.tong_tien) AS TongTien
FROM hoa_don
JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
WHERE hoa_don.trang_thai = 1 and  DAY(hoa_don.ngay_tao) = 27 and MONTH(hoa_don.ngay_tao) = 11
GROUP BY MONTH(hoa_don.ngay_tao), DAY(hoa_don.ngay_tao)
ORDER BY MONTH(hoa_don.ngay_tao) DESC, DAY(hoa_don.ngay_tao) DESC
--Select ngày đến ngày
SELECT hoa_don.ngay_tao, SUM(hoa_don.tong_tien) AS TongTien
FROM hoa_don
JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
WHERE hoa_don.trang_thai = 1 and hoa_don.ngay_tao >= ?and hoa_don.ngay_tao <= ?
GROUP BY hoa_don.ngay_tao
ORDER BY hoa_don.ngay_tao DESC

select so_dien_thoai,mat_khau,vai_tro from nhan_vien where so_dien_thoai=?

select so_dien_thoai,mat_khau,vai_tro from nhan_vien

	select count(id) from voucher where deleted = 1
	insert into nhan_vien (so_dien_thoai, mat_khau, vai_tro	) values('0174441985','anhnt',0)

		insert into nhan_vien (so_dien_thoai, mat_khau) values('09765263622','12345433')

		select * from nhan_vien

		select so_dien_thoai,mat_khau from nhan_vien where id=1
		


		select ten_khach_hang,gioi_tinh,ngay_sinh,so_dien_thoai,email,dia_chi.dia_chi_cu_the,dia_chi_nguoi_nhan from khach_hang
		join dia_chi on dia_chi.id = khach_hang.dia_chi where khach_hang.deleted = 1
		Order by khach_hang.id 
		OFFSET 1 ROWS FETCH NEXT 5 ROW ONLY
		
		select count(*) from  khach_hang

		select * from dia_chi

	delete from dia_chi where id =21

UPDATE dia_chi
SET dia_chi_cu_the = N'Số 25, đường Lê Lợi, phường 1, thành phố Vĩnh Long, tỉnh Vĩnh Long'
FROM dia_chi
INNER JOIN khach_hang ON dia_chi.id = khach_hang.dia_chi
where khach_hang.id=1


select * from dia_chi
select * from khach_hang

SELECT dia_chi.id
FROM dia_chi
JOIN khach_hang ON khach_hang.dia_chi = dia_chi.id
WHERE khach_hang.id = 43

	select ten_khach_hang,gioi_tinh,ngay_sinh,so_dien_thoai,email,dia_chi.dia_chi_cu_the,dia_chi_nguoi_nhan from khach_hang
	join dia_chi on dia_chi.id = khach_hang.dia_chi 
	where khach_hang.deleted = 1 and gioi_tinh =0


	SELECT top 8 ngay_tao AS Ngay, SUM(tong_tien) AS TongTien_Theo_Ngay
              FROM hoa_don
              WHERE deleted = 1 
              GROUP BY ngay_tao
              ORDER BY ngay_tao DESC


			  select YEAR(hoa_don.ngay_tao) from hoa_don 
			 order by  YEAR(hoa_don.ngay_tao) desc 
        
			SELECT Year( hoa_don.ngay_tao) from hoa_don 
			JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
			WHERE hoa_don.trang_thai = 1
			order by hoa_don.ngay_tao desc 

	
	SELECT Year( hoa_don.ngay_tao), SUM(hoa_don.tong_tien)
              FROM hoa_don
              JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
              WHERE hoa_don.trang_thai = 1 
                Group by  Year( hoa_don.ngay_tao)

	select * from hoa_don

	select sum(tong_tien) from hoa_don   JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai where hoa_don.trang_thai=1 

 SELECT ten_voucher, ma_voucher, loai_giam_gia, gia_tri, so_luong, ngay_bat_dau, ngay_ket_thuc, trang_thai 
                    FROM voucher 
                    WHERE deleted = 1 AND
                    (ten_voucher LIKE '' OR ma_voucher LIKE '') AND
                    trang_thai LIKE N'%Sắp áp dụng%'

SELECT ten_voucher, ma_voucher, loai_giam_gia, gia_tri, so_luong, ngay_bat_dau, ngay_ket_thuc, trang_thai 
FROM voucher 
WHERE deleted = 1 
AND trang_thai LIKE N'%Sắp áp dụng%'	
AND (ten_voucher LIKE N'%v%' OR ma_voucher LIKE N'%từ_khóa%')

SELECT TOP 8 ngay_tao AS Ngay, SUM(tong_tien) AS TongTien_Theo_Ngay
FROM hoa_don
WHERE deleted = 1 
GROUP BY ngay_tao
ORDER BY ngay_tao DESC

 SELECT MONTH(hoa_don.ngay_tao)
              FROM hoa_don
              JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
              WHERE hoa_don.trang_thai = 1  and   YEAR(hoa_don.ngay_tao) = 2018 
              GROUP BY MONTH(hoa_don.ngay_tao) , YEAR(hoa_don.ngay_tao)
               	ORDER BY  MONTH(hoa_don.ngay_tao) asc  , YEAR(hoa_don.ngay_tao) asc

						 SELECT DAY(hoa_don.ngay_tao) AS NgayTrongThang , MONTH(hoa_don.ngay_tao), YEar(hoa_don.ngay_tao),SUM(hoa_don.tong_tien) AS TongTien
                            FROM hoa_don
                            JOIN trang_thai ON trang_thai.id = hoa_don.trang_thai
                            WHERE hoa_don.trang_thai = 1  and MONTH(hoa_don.ngay_tao)=?
                            GROUP BY MONTH(hoa_don.ngay_tao), DAY(hoa_don.ngay_tao),  YEar(hoa_don.ngay_tao)
                            ORDER BY MONTH(hoa_don.ngay_tao) DESC, DAY(hoa_don.ngay_tao) DESC

					
select id from dia_chi where dia_chi_cu_the=?


select * from dia_chi
select * from  khach_hang

select * from hoa_don
