﻿Create table NHANVIEN
(
HONV varchar(15) not null,
TENLOT varchar(15) not null,
TENNV varchar(15) not null,
MANV varchar(9) not null,
NGSINH smalldatetime not null,
DCHI varchar(30) not null,
PHAI varchar(3) not null,
LUONG float  not null,
MA_NQL varchar(9) null,
PHG int not null,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Create table PHONGBAN
(

TENPHG varchar(15) not null,
MAPHG int not null,
TRPHG varchar(9) not null,
NG_NHANCHUC smalldatetime not null,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MAPHG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
GO
Create table CONGVIEC
(
MADA int not null,
STT int not null,
TEN_CONG_VIEC varchar(50) not null,
 CONSTRAINT [PK_CongViec] PRIMARY KEY CLUSTERED 
(
	[MADA] ASC,
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create table DEAN
(

TENDA varchar(15) not null,
MADA int not null,
DDIEM_DA varchar(15) not null,
PHONG int not null
 CONSTRAINT [PK_DeAn] PRIMARY KEY CLUSTERED 
(
	[MADA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create table DIADIEM_PHG
(

MAPHG int not null,
DIADIEM varchar(15) not null,
 CONSTRAINT [PK_DiaDiemPhong] PRIMARY KEY CLUSTERED 
(
	[MAPHG] ASC,
	[DIADIEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create table PHANCONG
(
MA_NVIEN varchar(9) ,
MADA int not null,
STT int not null,
THOIGIAN float not null
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MA_NVIEN] ASC,
	[MADA] ASC,
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create table THANNHAN
(
MA_NVIEN varchar(9) not null,
TENTN varchar(15) not null,
PHAI varchar(3) not null,
NGSINH smalldatetime not null,
QUANHE varchar(15) not null,
 CONSTRAINT [PK_ThanNhan] PRIMARY KEY CLUSTERED 
(
	[MA_NVIEN] ASC,
	[TENTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (1, 1, N'Thiết kế sản phẩm X')
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (1, 2, N'Thử nghiệm sản phẩm X')
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (2, 1, N'Sản xuất sản phẩm Y')
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (2, 2, N'Quảng cáo sản phẩm Y')
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (3, 1, N'Khuyến mãi sản phẩm Z')
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (10, 1, N'Tin học hóa phòng nhân sự')
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (10, 2, N'Tin học hóa phòng kinh doanh')
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (20, 1, N'Lắp đặt cáp quang')
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (30, 1, N'Đào tạo nhân viên Marketing')
insert CONGVIEC (MADA,STT,TEN_CONG_VIEC) values (30, 2, N'Đào tạo chuyên viên thiết kế')
insert DEAN (TENDA,MADA,DDIEM_DA,PHONG) values (N'Sản Phẩm x', 1, N'Vũng Tàu', 5)
insert DEAN (TENDA,MADA,DDIEM_DA,PHONG) values (N'Sản Phẩm Y', 2, N'Nha Trang', 5)
insert DEAN (TENDA,MADA,DDIEM_DA,PHONG) values (N'Sản Phẩm Z', 3, N'TP HCM', 5)
insert DEAN (TENDA,MADA,DDIEM_DA,PHONG) values (N'Tin Học Hóa', 10, N'Hà Nội', 4)
insert DEAN (TENDA,MADA,DDIEM_DA,PHONG) values (N'Cáp quang', 20, N'TP HCM', 1)
insert DEAN (TENDA,MADA,DDIEM_DA,PHONG) values (N'Đào tạo', 30, N'Hà Nội', 4)
insert DIADIEM_PHG (MAPHG,DIADIEM) values (1, N'TP HCM')
insert DIADIEM_PHG (MAPHG,DIADIEM) values (4, N'Hà Nội')
insert DIADIEM_PHG (MAPHG,DIADIEM) values (5, N'TAU')
insert DIADIEM_PHG (MAPHG,DIADIEM) values (5, N'Nha Trang')
insert DIADIEM_PHG (MAPHG,DIADIEM) values (5, N'TP HCM')
insert NHANVIEN (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) values (N'Đinh ',N'Bá ',N'Tiên ',N'009',CAST(N'1960-02-11T00:00:00.000' AS DateTime),N'119 Cống Quỳnh,Tp HCM',N'Nam',N'30000',N'005',5)
insert NHANVIEN (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) values (N'Nguyễ n',N'Thanh ',N'Tùng',N'005',CAST(N'1962-08-20T00:00:00.000' AS DateTime),N'222 Nguyễn Văn Cừ,Tp HCM',N'Nam',N'40000',N'006',5)
insert NHANVIEN (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) values (N'Bùi ',N'Ngọc ',N'Hằng',N'007',CAST(N'1954-03-11T00:00:00.000' AS DateTime),N'332 Nguyễn Thái Học,Tp HCM',N'Nam',N'25000',N'001',4)
insert NHANVIEN (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) values (N'Lê ',N'Quỳnh ',N'Như ',N'001',CAST(N'1967-02-01T00:00:00.000' AS DateTime),N'291 Hồ Văn Khuê,Tp HCM',N'Nữ',N'43000',N'006',4)
insert NHANVIEN (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) values (N'Nguyễn',N'Mạnh',N'Hùng',N'004',CAST(N'1967-03-04T00:00:00.000' AS DateTime),N'95 Bà Rịa, Vũng Tàu',N'Nam',N'38000',N'005',5)
insert NHANVIEN (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) values (N'Trần',N'Thanh',N'Tâm',N'003',CAST(N'1957-05-04T00:00:00.000' AS DateTime),N'34 Mai Thị Lự, Tp HCM',N'Nam',N'25000',N'005',5)
insert NHANVIEN (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) values (N'Trần',N'Hồng',N'Quang',N'008',CAST(N'1967-09-01T00:00:00.000' AS DateTime),N'80 Lê Hồng Phong, Tp HCM',N'Nam',N'25000',N'001',4)
insert NHANVIEN (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,PHG) values (N'Phạm',N'Văn',N'Vinh',N'006',CAST(N'1965-01-01T00:00:00.000' AS DateTime),N'56 Trưng Vương. Hà Nội',N'Nữ',N'55000',5)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'009', 1, 1, 32)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'009', 2, 2, 8)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'004', 3, 1, 40)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'003', 1, 2, 20.0)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'003', 2, 1, 20.0)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'008', 10, 1, 35)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'008', 30, 2, 5)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'001', 30, 1, 20)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'001', 20, 1, 15)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'006', 20, 1, 30)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'005', 3, 1, 10)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'005', 10, 2, 10)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'005', 20, 1, 10)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'007', 30, 2, 30)
insert PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) values (N'007', 10, 2, 10)
insert PHONGBAN (TENPHG,MAPHG,TRPHG,NG_NHANCHUC) values (N'Nghiên cứu', 5, N'005', CAST(N'1978-05-22' AS Date))
insert PHONGBAN (TENPHG,MAPHG,TRPHG,NG_NHANCHUC) values (N'Điều hành', 4, N'008', CAST(N'1985-01-01' AS Date))
insert PHONGBAN (TENPHG,MAPHG,TRPHG,NG_NHANCHUC) values (N'Quản lý', 1, N'006', CAST(N'1971-06-19' AS Date))
insert THANNHAN (MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) values (N'005', N'Trinh', N'Nữ', CAST(N'1976-04-05' AS Date), N'Con gái')
insert THANNHAN (MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) values (N'005', N'Khang', N'Nam', CAST(N'1973-10-25' AS Date), N'Con trai')
insert THANNHAN (MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) values (N'005', N'Phương', N'Nữ', CAST(N'1948-05-03' AS Date), N'Vợ chồng')
insert THANNHAN (MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) values (N'001', N'Minh', N'Nam', CAST(N'1932-02-29' AS Date), N'Vợ Chồng')
insert THANNHAN (MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) values (N'009', N'Tiến ', N'Nam', CAST(N'1978-01-01' AS Date), N'Con Trai')
insert THANNHAN (MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) values (N'009', N'Châu ', N'Nữ', CAST(N'1978-12-30' AS Date), N'Con Gái')
insert THANNHAN (MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) values (N'009', N'Phương', N'Nữ', CAST(N'1957-05-05' AS Date), N'Vợ Chồng')
ALTER TABLE [dbo].[CONGVIEC]  WITH CHECK ADD  CONSTRAINT [FK_DeAn_CongViec] FOREIGN KEY([MADA])
REFERENCES [dbo].[DEAN] ([MADA])
GO
ALTER TABLE [dbo].[CONGVIEC] CHECK CONSTRAINT [FK_DeAn_CongViec]
GO
ALTER TABLE [dbo].[DEAN]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan_DeAn] FOREIGN KEY([PHONG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[DEAN] CHECK CONSTRAINT [FK_PhongBan_DeAn]
GO
ALTER TABLE [dbo].[DIADIEM_PHG]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan_DiaDiemPhg] FOREIGN KEY([MAPHG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[DIADIEM_PHG] CHECK CONSTRAINT [FK_PhongBan_DiaDiemPhg]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_NhanVien] FOREIGN KEY([MA_NQL])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NhanVien_NhanVien]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan_NhanVien] FOREIGN KEY([PHG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_PhongBan_NhanVien]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_CongViec_PhanCong] FOREIGN KEY([MADA], [STT])
REFERENCES [dbo].[CONGVIEC] ([MADA], [STT])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_CongViec_PhanCong]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhanCong] FOREIGN KEY([MA_NVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_NhanVien_PhanCong]
GO
ALTER TABLE [dbo].[PHONGBAN]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([TRPHG])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHONGBAN] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
ALTER TABLE [dbo].[THANNHAN]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ThanNhan] FOREIGN KEY([MA_NVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[THANNHAN] CHECK CONSTRAINT [FK_NhanVien_ThanNhan]