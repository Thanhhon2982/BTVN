------------Câu 1 a)In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu-------------
create proc cau1_a @name varchar(20) out
AS
Begin
	print 'Xin chào' + @name
end
go
exec cau1_a 'Thanh Hơn'


-------------Câu 1 b)Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2.---------------

create proc cau1_b @s1 int,@s2 int out
as
begin
	declare @tg int
	set @tg=@s1+@s2
	print 'Tổng là: '+ CAST(@tg as varchar(10))
end
go
exec cau1_b 3,4 

---------------Câu 1 c)Nhập vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n.
create proc cau1_c @n int 
as
begin
	declare @tong int = 0,@tang int = 0
	while @tang < @n
	begin
		set @tong = @tong + @tang
		set @tang = @tang + 2
	end
	print 'Tổng: ' + cast(@tong as varchar(10))
	end
go
exec cau1_c 20

--------------------Câu 1 d)Nhập vào 2 số. In ra ước chung lớn nhất của chúng-------------------------
create proc cau1_d @a int, @b int
as
	begin
		while (@a != @b)
			begin
				if(@a > @b)
					set @a = @a - @b
				else
					set @b = @b - @a
			end
			return @a
	end
go
declare @uoc varchar(10)
exec @uoc = cau1_d 12,20
print 'Ước chung là :' + @uoc
go

-------------------Câu 2 a) Nhập vào @Manv, xuất thông tin các nhân viên theo @Manv.
create proc cau2_a @MaNV varchar(20)
as
	begin
		select * from NHANVIEN where MANV = @MaNV
	end
go
exec cau2_a '002'
go
-----------------Câu 2 b)Nhập vào @MaDa (mã đề án), cho biết số lượng nhân viên tham gia đề án đó

create proc cau2_b @MaDa int
as
begin
		select count(MANV) as 'Số lượng nhân viên', MADA as 'Mã đề án', TENPHG as 'Mã đề án' from PHONGBAN
		inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
		inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
		where MADA = @MaDa
		group by TENPHG,MADA
end
go
exec cau2_b 1
go

---------------Câu 2 c)Nhập vào @MaDa và @Ddiem_DA (địa điểm đề án), cho biết số lượng nhân viên tham gia đề án có mã đề án là @MaDa và địa điểm đề án là @Ddiem_DA
create proc cau2_c @MaDa int,@Ddiem_DA nvarchar(15) 
as
begin
		select count(MANV) as 'Số lượng nhân viên' , MADA as 'Mã đề án', TENPHG as 'Mã đề án',DDIEM_DA as 'Địa điểm đề án'from PHONGBAN
		inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
		inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
		where MADA = @MaDa  and  DDIEM_DA = @Ddiem_DA 
		group by TENPHG,MADA,DDIEM_DA
end
go
exec cau2_c 3,'TP HCM'
-------------------Câu 2 d)Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên có trưởng phòng là @Trphg và các nhân viên này không có thân nhân.
create proc cau2_d @Trphg nvarchar(10) as
begin
select  * from NHANVIEN inner join PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG
where TRPHG = @Trphg
end
go
exec cau2_d '006'

------------------Câu 2 e)Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv có thuộc phòng ban có mã @Mapb hay không
create proc cau2_e @Manv nvarchar(10),@Mapb nvarchar(10) as
begin
if exists (select * from NHANVIEN where MANV = @Manv and PHG = @Mapb)
	print' Có'
else
	print ' Không'
end
go
exec cau2_e '002','4'
-------------------------------Câu 3 a)Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào dưới dạng tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại. Cập nhật phòng ban có tên CNTT thành phòng IT.

create proc sp_ThemPhongBan @TenPHG nvarchar(15), @MaPHG int,
@TRPHG nvarchar(9), @NG_NHANCHUC date
as
if exists (select * from PHONGBAN where MAPHG = @MaPHG)
update PHONGBAN set TENPHG = @TenPHG, TRPHG = @Trphg, NG_NHANCHUC = @NG_NHANCHUC
where MAPHG = @MaPHG
else
insert into PHONGBAN
values (@TenPHG, @MaPHG, @TRPHG, @NG_NHANCHUC)
drop proc sp_ThemPhongBan
go
exec sp_ThemPhongBan 'CNTT', 6, '008', '1985-01-01'

----------------------Câu 3 b)Thêm một nhân viên vào bảng NhanVien, tất cả giá trị đều truyền dưới dạng tham số đầu vào
create proc sp_themNV
	@HONV nvarchar(15),
	@TENLOT nvarchar(15),
	@TENNV nvarchar(15),
	@MANV nvarchar(9),
	@NGSINH datetime,
	@DCHI nvarchar(30),
	@PHAI nvarchar(3),
	@LUONG float,
	@PHG int
as
begin
	if not exists(select * from PHONGBAN where TENPHG = 'IT')
	begin
		print N'Nhân viên phải trực thuộc phòng IT';
		return;
	end;
	declare @MA_NQL nvarchar(9);
	if @LUONG > 25000
		set @MA_NQL = '005';
	else
		set @MA_NQL = '009';
	declare @age int;
	select @age = DATEDIFF(year,@NGSINH,getdate()) + 1;
	if @PHAI = 'Nam' and (@age < 18 or @age >60)
	begin
		print N'Nam phải có độ tuổi từ 18-65';
		return;
	end;
	else if @PHAI = 'Nữ' and (@age < 18 or @age >60)
	begin
		print N'Nữ phải có độ tuổi từ 18-60';
		return;
	end;
	INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
		VALUES(@HONV,@TENLOT,@TENNV,@MANV,@NGSINH,@DCHI,@PHAI,@LUONG,@MA_NQL,@PHG)
end;
go
exec sp_themNV N'Trần',N'Văn',N'An','012','1995-04-10',N'Đồng Nai','Nam',30000,;


