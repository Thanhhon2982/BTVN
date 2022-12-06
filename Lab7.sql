----------Câu 1 a) Nhập vào MaNV cho biết tuổi của nhân viên này.
CREATE FUNCTION tuoinv(@MaNV nvarchar(9))
RETURNS INT
AS 
BEGIN
	RETURN(SELECT YEAR(GETDATE()) - YEAR(NGSINH) AS N'TUỔI'
		FROM NHANVIEN WHERE MANV = @MaNV)
END
go
print 'Tuổi nhân viên là: ' + convert(nvarchar, dbo.tuoinv('002'))
-----------Câu 1 b)Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia
CREATE FUNCTION DemDeAnNV(@MaNV varchar(9))
returns int
as
	begin
		return(select count(MADA) from PHANCONG where MA_NVIEN = @MaNV)
	end
go
print ' Số đề án nhân viên đã làm: ' + convert(varchar, dbo.DemDeAnNV('001'))
---------Câu 1 c)
CREATE FUNCTION demnv_phai(@phai nvarchar(5) =N'%')
returns int
as
	begin
		return(select count(*) 
		from NHANVIEN
		where PHAI like @phai)
	end
go
print 'Số lượng nhân viên nhân viên theo phái: ' + convert(varchar,dbo.demnv_phai(N'Nữ'))
-------------Câu 1 d)Truyền tham số đầu vào là tên phòng, tính mức lương trung bình của phòng đó, Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng đó.

create function Luong_NhanVien_PB(@tenphongban nvarchar(20))
returns @tbLuongNV table(fullname nvarchar (50), luong float)
as 
	begin
		declare @LuongTB float
		select @LuongTB = AVG(LUONG) from NHANVIEN
		inner join PHONGBAN on PHONGBAN.MAPHG = NHANVIEN.PHG
		where TENPHG = @tenphongban
		insert into @tbLuongNV
			select HONV+' '+TENLOT+' '+TENNV, LUONG from NHANVIEN
			where LUONG > @LuongTB
		return
	end
go
select * from dbo.Luong_NhanVien_PB(N'Quản lý')

----------Câu 1 e)Tryền tham số đầu vào là Mã Phòng, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì.
CREATE FUNCTION soluongdean_Pb(@MaPB int)
returns @dspb table(TenPB nvarchar(20), MATP nvarchar(10), TenTP nvarchar(50), soLuong int )
as 
begin
	insert into @dspb
	SELECT TENPHG, TRPHG, HONV + ' ' + TENLOT + ' ' + TENNV , 
	COUNT(MADA) as 'SOLUONGDEAN' FROM PHONGBAN
		INNER JOIN DEAN ON DEAN.PHONG = PHONGBAN.MAPHG
		INNER JOIN NHANVIEN ON NHANVIEN.MANV = PHONGBAN.TRPHG
		WHERE PHONGBAN.MAPHG = @MaPB
		GROUP BY TENPHG, TRPHG, TENNV, HONV, TENLOT
	return
end
go
select * from dbo.soluongdean_Pb(4)
-------------Câu 2 a)Hiển thị thông tin HoNV,TenNV,TenPHG, DiaDiemPhg.
create view view_ttnv
as
select HONV,TENPHG,DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
go
select * from view_ttnv

------------Câu 2 b)Hiển thị thông tin TenNv, Lương, Tuổi.

create view view_luong_tuoi
as
select TENNV,LUONG,YEAR(GETDATE())-YEAR(NGSINH)as 'Tuổi' from NHANVIEN
go
select * from view_luong_tuoi

-------------Câu 2 c)Hiển thị tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
create view view_pb
as
select top(1) TENPHG,TRPHG,B.HONV+' '+B.TENLOT+' '+B.TENNV as 'TenTP',COUNT(A.MANV)as 'Số lượng nhân viên' 
from NHANVIEN A
inner join PHONGBAN on PHONGBAN.MAPHG = A.PHG
inner join NHANVIEN B on B.MANV = PHONGBAN.TRPHG
group by TENPHG,TRPHG,B.TENNV,B.HONV,B.TENLOT
order by SoLuongNV desc
select * from view_pb