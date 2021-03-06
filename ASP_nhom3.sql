USE [master]
GO
/****** Object:  Database [DBASPNhom3]    Script Date: 12/13/2021 09:07:16 ******/
CREATE DATABASE [DBASPNhom3]
GO
ALTER DATABASE [DBASPNhom3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBASPNhom3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBASPNhom3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBASPNhom3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBASPNhom3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBASPNhom3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBASPNhom3] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBASPNhom3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBASPNhom3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBASPNhom3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBASPNhom3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBASPNhom3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBASPNhom3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBASPNhom3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBASPNhom3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBASPNhom3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBASPNhom3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBASPNhom3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBASPNhom3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBASPNhom3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBASPNhom3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBASPNhom3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBASPNhom3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBASPNhom3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBASPNhom3] SET RECOVERY FULL 
GO
ALTER DATABASE [DBASPNhom3] SET  MULTI_USER 
GO
ALTER DATABASE [DBASPNhom3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBASPNhom3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBASPNhom3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBASPNhom3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBASPNhom3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBASPNhom3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBASPNhom3] SET QUERY_STORE = OFF
GO
USE [DBASPNhom3]
GO
/****** Object:  User [longkz]    Script Date: 12/13/2021 09:07:17 ******/
CREATE USER [longkz] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/13/2021 09:07:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[GiaMua] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 12/13/2021 09:07:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[NguoiTao] [nvarchar](100) NOT NULL,
	[NgaySua] [datetime] NOT NULL,
	[NguoiSua] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/13/2021 09:07:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [int] NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[GhiChu] [ntext] NULL,
	[TrangThai] [int] NOT NULL,
	[HoTenNguoiNhan] [nvarchar](100) NOT NULL,
	[DiaChiNhan] [nvarchar](100) NOT NULL,
	[SoDienThoaiNhan] [char](11) NOT NULL,
	[NgaySua] [datetime] NULL,
	[NguoiSua] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/13/2021 09:07:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[MaDM] [int] NOT NULL,
	[TenSP] [nvarchar](150) NOT NULL,
	[Gia] [money] NOT NULL,
	[NSX] [ntext] NOT NULL,
	[ChatLieu] [nvarchar](50) NOT NULL,
	[MoTa] [ntext] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[NguoiTao] [nvarchar](100) NOT NULL,
	[NgaySua] [datetime] NOT NULL,
	[NguoiSua] [nvarchar](100) NOT NULL,
	[MaMau] [char](10) NOT NULL,
	[HinhAnh] [nvarchar](150) NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanNguoiDung]    Script Date: 12/13/2021 09:07:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanNguoiDung](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](100) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[SoDienThoai] [char](11) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[TrangThai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanQuanTri]    Script Date: 12/13/2021 09:07:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanQuanTri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](100) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[LoaiTaiKhoan] [bit] NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[TrangThai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua]) VALUES (1, N'Dụng cụ văn phòng', CAST(N'2021-12-12T20:45:45.887' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T20:45:45.887' AS DateTime), N'Phùng Thanh Long')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua]) VALUES (2, N'Giấy', CAST(N'2021-12-12T20:45:55.990' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T20:45:55.990' AS DateTime), N'Phùng Thanh Long')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua]) VALUES (3, N'Bút viết', CAST(N'2021-12-12T20:46:04.060' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T20:46:04.060' AS DateTime), N'Phùng Thanh Long')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua]) VALUES (4, N'Thiết bị lưu trữ', CAST(N'2021-12-12T20:46:11.890' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T20:46:11.890' AS DateTime), N'Phùng Thanh Long')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua]) VALUES (5, N'Mực in', CAST(N'2021-12-12T20:46:20.307' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T20:46:20.307' AS DateTime), N'Phùng Thanh Long')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (1, 1, N'Bấm kim Kanex HD45 - 20 tờ', 45000.0000, N'Kanex', N'Kim loại, nhựa', N'Bấm kim Kanex HD45 - 20 tờ với thân máy kim loại, dạng bấm, lực bấm 20 tờ, sử dụng kim bấm no.03 (0246) được dùng để liên kết và phân nhóm tài liệu bằng lực bấm 
hoặc đóng nhiều tờ giấy thành xấp hoặc cuốn phù hợp với nghiệp vụ photocopy và lưu trữ chứng từ.Tiết kiệm từ 10% - 30%', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#2596be   ', N'/UserImage/images/sp01.jpg',100)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (2, 1, N'Bấm kim Kwtrio 50LA - 210 tờ', 410000.0000, N'Kwtrio', N'Kim loại, nhựa', N'Bấm kim Kwtrio 50LA - 210 tờ với thân máy kim loại, có tay đẩy, lực bấm 240 tờ, sử dụng kim bấm 23/8, 23/10, 23/13,23/15,23/17,23/20,23/23 được dùng để
liên kết và phân nhóm tài liệu bằng lực bấm hoặc đóng nhiều tờ giấy thành xấp hoặc cuốn phù hợp với nghiệp vụ photocopy và lưu trữ chứng từ Tiết kiệm từ 10% - 30%', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#21130d   ', N'/UserImage/images/sp02.jpg',50)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (3, 1, N'Dao rọc giấy Kanex P9', 15000.0000, N'Kanex', N'Kim loại, nhựa', N'Dao rọc Kanex P9 với thân nhựa, lưỡi dao kim loại 9mm, nút bấm khóa được dùng để cắt rọc giấy,
thùng hàng, bưu kiện với lưỡi dao đẩy tự động', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#21130d   ', N'/UserImage/images/sp03.jpg',50)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (4, 1, N'Kéo đa năng', 30000.0000, N'Kanex', N'Kim loại, nhựa', N'Kéo đa năng với thân dài 20cm, cán cầm nhựa, lưỡi kéo bằng thép được dùng để cắt giấy, cắt vải hoặc chất liệu phi kim', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#f3062a   ', N'/UserImage/images/sp04.jpg',40)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (5, 1, N'Compa Maped', 35000.0000, N'Maped', N'Kim loại, nhựa', N'Compa Maped Study với thân vỏ kim loại, tích hợp khay kẹp bút chì được dùng để tạo đường tròn, đường cong kỹ thuật thường được sử dụng trong trường học và kiến trúc', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#21130d   ', N'/UserImage/images/sp05.jpg',30)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (6, 1, N'Dao dọc giấy nhỏ', 10000.0000, N'Kanex', N'Kim loại, nhựa', N'Dao rọc nhỏ với thân nhựa, lưỡi dao kim loại 9mm, nút bấm khóa được dùng để cắt rọc giấy, thùng hàng, bưu kiện với lưỡi dao đẩy tự động 
Sản phẩm được sản xuất bởi các doanh nghiệp văn phòng phẩm uy tín tại Châu Á', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#fdef02   ', N'/UserImage/images/sp06.jpg',40)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (7, 2, N'Giấy Delight A4 70', 65000.0000, N'Delight', N'Giấy gỗ mịn', N'Giấy Delight A4 70 với kích thước: A4 (210mm x 297mm), định lượng: 70gms, nền giấy trắng được dùng để in ấn chứng từ, tài liệu, hợp đồng dựa trên khổ giấy chuẩn phù hợp với các nghiệp vụ văn phòng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#ffffff   ', N'/UserImage/images/sp07.jpg',60)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (8, 2, N'Giấy Double A A3 80', 175000.0000, N'Double A', N'Giấy gỗ mịn', N'Giấy Double A A3 80 với kích thước: A3 (297mm x 420mm), định lượng: 80gms, nền giấy trắng được dùng để in ấn chứng từ, tài liệu, hợp đồng dựa trên khổ giấy chuẩn phù hợp với các nghiệp vụ văn phòng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#ffffff   ', N'/UserImage/images/sp08.jpg',35)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (9, 2, N'Giấy Double A A4 70', 75000.0000, N'Double A', N'Giấy gỗ mịn', N'Giấy Double A A4 70 với kích thước: A4 (210mm x 297mm), định lượng: 70gms, nền giấy trắng được dùng để in ấn chứng từ, tài liệu, hợp đồng dựa trên khổ giấy chuẩn phù hợp với các nghiệp vụ văn phòng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#ffffff   ', N'/UserImage/images/sp09.jpg',40)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (10, 2, N'Giấy Excel A4 70', 80000.0000, N'Excel', N'Giấy gỗ mịn', N'Giấy Excel A4 70 với kích thước: A4 (210mm x 297mm), định lượng: 70gms, nền giấy trắng được dùng để in ấn chứng từ, tài liệu, hợp đồng dựa trên khổ giấy chuẩn phù hợp với các nghiệp vụ văn phòng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#ffffff   ', N'/UserImage/images/sp10.jpg',100)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (11, 2, N'Giấy Excel A4 80', 85000.0000, N'Excel', N'Giấy gỗ mịn', N'Giấy Excel A4 80 với kích thước: A4 (210mm x 297mm), định lượng: 70gms, nền giấy trắng được dùng để in ấn chứng từ, tài liệu, hợp đồng dựa trên khổ giấy chuẩn phù hợp với các nghiệp vụ văn phòng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#ffffff   ', N'/UserImage/images/sp11.jpg',20)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (12, 2, N'Giấy Quality A4 70', 80000.0000, N'Quality', N'Giấy gỗ mịn', N'Giấy Quality A4 70 với kích thước: A4 (210mm x 297mm), định lượng: 70gms, nền giấy trắng được dùng để in ấn chứng từ, tài liệu, hợp đồng dựa trên khổ giấy chuẩn phù hợp với các nghiệp vụ văn phòng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#ffffff   ', N'/UserImage/images/sp12.jpg',30)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (13, 3, N'Bút bi cắm bàn Bến Nghé', 13000.0000, N'Bến Nghé', N'Nhựa', N'Bút bi cắm bàn Bến Nghé với thân nhựa, dạng để bàn, ngòi bi, nét mực êm, cở ngòi 0.5mm, có dây nối với đế, có lớp keo trống trượtmm, màu mực xanh được dùng để ghi chú nội dung ,ký kết hợp đồng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#3772ef   ', N'/UserImage/images/sp13.jpg',65)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (14, 3, N'Bút bi cắm bàn TL', 15000.0000, N'Thiên Long', N'Nhựa', N'Bút bi cắm bàn TL với thân nhựa, dạng để bàn, ngòi bi, nét mực êm, cở ngòi 0.5mm, có dây nối với đế, có lớp keo trống trượtmm, màu mực xanh được dùng để ghi chú nội dung ,ký kết hợp đồng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#3772ef   ', N'/UserImage/images/sp14.jpg',55)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (15, 3, N'Bút bi TL 031 đen', 8000.0000, N'Thiên Long', N'Nhựa', N'Bút bi TL đen với thân nhựa, dạng để bàn, ngòi bi, nét mực êm, cở ngòi 0.5mm, có dây nối với đế, có lớp keo trống trượtmm, màu mực xanh được dùng để ghi chú nội dung ,ký kết hợp đồng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp15.jpg',65)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (16, 3, N'Bút bi TL 031 xanh', 8000.0000, N'Thiên Long', N'Nhựa', N'Bút bi TL xanh với thân nhựa, dạng để bàn, ngòi bi, nét mực êm, cở ngòi 0.5mm, có dây nối với đế, có lớp keo trống trượtmm, màu mực xanh được dùng để ghi chú nội dung ,ký kết hợp đồng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#0506fd   ', N'/UserImage/images/sp16.jpg',45)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (17, 3, N'Bút bi TL 031 đỏ', 8000.0000, N'Thiên Long', N'Nhựa', N'Bút bi TL đỏ với thân nhựa, dạng để bàn, ngòi bi, nét mực êm, cở ngòi 0.5mm, có dây nối với đế, có lớp keo trống trượtmm, màu mực xanh được dùng để ghi chú nội dung ,ký kết hợp đồng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#fd0506   ', N'/UserImage/images/sp17.jpg',52)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (18, 3, N'Bút gel Pentel Energel BL57 đen', 55000.0000, N'Pentel', N'Nhựa', N'Bút gel Pentel Energel BL57 đen với chất liệu mực gel nước, thân nhựa, dạng nắp đậy, nét mực êm 1.0mm, màu mực đen được dùng để ghi chú nội dung ,ký kết hợp đồng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp18.jpg',51)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (19, 3, N'Bút gel Pentel Energel BL57 xanh', 55000.0000, N'Pentel', N'Nhựa', N'Bút gel Pentel Energel BL57 xanh với chất liệu mực gel nước, thân nhựa, dạng nắp đậy, nét mực êm 1.0mm, màu mực đen được dùng để ghi chú nội dung ,ký kết hợp đồng', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#0506fd   ', N'/UserImage/images/sp19.jpg',50)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (20, 4, N'CD-R Kachi 10', 80000.0000, N'Kachi', N'Nhựa', N'CD-R Kachi 10 với dung lượng: 720mb, ghi chép dữ liệu 1 lần được dùng để lưu trữ dữ liệu tin học', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#fd8f05   ', N'/UserImage/images/sp20.jpg',40)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (21, 4, N'USB Toshiba Hayabusa 16GB', 190000.0000, N'Toshiba', N'Kim loại, nhựa', N'USB Toshiba Hayabusa 16GB với dung lượng 16gb, có lổ móc khóa được dùng để lưu trữ dữ liệu tin học', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#ffffff   ', N'/UserImage/images/sp21.jpg',60)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (22, 4, N'USB Toshiba Hayabusa 32GB', 250000.0000, N'Toshiba', N'Kim loại, nhựa', N'USB Toshiba Hayabusa 32GB với dung lượng 16gb, có lổ móc khóa được dùng để lưu trữ dữ liệu tin học', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#ffffff   ', N'/UserImage/images/sp22.jpg',70)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (23, 4, N'CD-R Maxell 50', 400000.0000, N'Maxell', N'Nhựa', N'CD-R Maxell 50 với dung lượng: 720mb, ghi chép dữ liệu 1 lần được dùng để lưu trữ dữ liệu tin học', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#fd8f05   ', N'/UserImage/images/sp23.jpg',100)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (24, 4, N'Vỏ CD mica', 5000.0000, N'Mica', N'Kim loại, nhựa', N'Vỏ CD mica với chất liệu nhựa trong, dạng vuông, 1 mặt trong, chống thấm, lưu trữ 1 CD được dùng để lưu trữ CD, DVD, Bluray', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp24.jpg',80)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (25, 5, N'Mực in HP C9731A-645A', 4300000.0000, N'HP', N'Mực', N'Mực in HP C9731A-645A (G&G: NT-CH9731FC) chính hãng được dùng để nạp mực cho các dòng máy in HP Color LaserJet 5500, 5500n, 5500dn, 5500hdn, 5500dtn, 5550, 5550n, 5550dtn, 5550hdn', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp25.jpg',30)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (26, 5, N'Mực in HP CB541A-125A', 793000.0000, N'G&G', N'Mực', N'Mực in HP CB541A-125A (G&G: NT-PH541C) chính hãng được dùng để nạp mực cho các dòng máy in HP Color LaserJet CP1215, CP1217, CP1510, CP1514, CP1515n, CP1518ni, CM1312 MFP,
CM1312n MFP, CM1312nfi MFP, Canon i-SENSYS LBP5050, LBP5050n, MF8030Cn, MF8040CN, MF8050Cn, MF8080Cw, imageCLASS MF8050cn, MF8080Cw, Satera MF8050Cn, MF8030Cn(Jp)', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp26.jpg',25)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (27, 5, N'Mực in HP CC530A-304A', 1250000.0000, N'G&G', N'Mực', N'Mực in HP CC530A-304A chính hãng được dùng để nạp mực cho các dòng máy in HP Color LaserJet 5500, 5500n, 5500dn, 5500hdn, 5500dtn, 5550, 5550n, 5550dtn, 5550hdn', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp27.jpg',35)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (28, 5, N'Mực in HP CE312A-126A', 450000.0000, N'G&G', N'Mực', N'Mực in HP CE312A-126A chính hãng được dùng để nạp mực cho các dòng máy in HP Color LaserJet 5500, 5500n, 5500dn, 5500hdn, 5500dtn, 5550, 5550n, 5550dtn, 5550hdn', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp28.jpg',25)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (29, 5, N'Mực in HP CE321A-128A', 790000.0000, N'G&G', N'Mực', N'Mực in HP CE321A-128A chính hãng được dùng để nạp mực cho các dòng máy in HP Color LaserJet 5500, 5500n, 5500dn, 5500hdn, 5500dtn, 5550, 5550n, 5550dtn, 5550hdn', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp29.jpg',40)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (30, 5, N'Mực in HP CF211A-131A', 767000.0000, N'G&G', N'Mực', N'Mực in HP CF211A-131A chính hãng được dùng để nạp mực cho các dòng máy in HP Color LaserJet 5500, 5500n, 5500dn, 5500hdn, 5500dtn, 5550, 5550n, 5550dtn, 5550hdn', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp30.jpg',20)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [Gia], [NSX], [ChatLieu], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [MaMau], [HinhAnh],[SoLuong]) VALUES (31, 1, N'Máy Tính Casio FX 580 VN X', 657000.0000, N'Kanex', N'Nhựa', N'Máy Tính Casio FX 580 VN X chính hãng cung cấp nhiều tính năng giải toán mới, hỗ trợ tiếng Việt', CAST(N'2021-12-12T20:47:28.690' AS DateTime), N'Phùng Thanh Long', CAST(N'2021-12-12T21:10:30.357' AS DateTime), N'Phùng Thanh Long', N'#000000   ', N'/UserImage/images/sp31.jpg',30)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoanQuanTri] ON 

INSERT [dbo].[TaiKhoanQuanTri] ([ID], [TenDangNhap], [MatKhau], [LoaiTaiKhoan], [HoTen], [TrangThai]) VALUES (1, N'admin', N'admin', 1, N'Linh Vũ', 1)
INSERT [dbo].[TaiKhoanQuanTri] ([ID], [TenDangNhap], [MatKhau], [LoaiTaiKhoan], [HoTen], [TrangThai]) VALUES (2, N'manager', N'manager', 0, N'Nguyễn Văn Khải', 1)
SET IDENTITY_INSERT [dbo].[TaiKhoanQuanTri] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__DanhMuc__650CAE4E98FA843C]    Script Date: 12/13/2021 09:07:17 ******/
ALTER TABLE [dbo].[DanhMuc] ADD UNIQUE NONCLUSTERED 
(
	[TenDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__55F68FC0F4B7B097]    Script Date: 12/13/2021 09:07:17 ******/
ALTER TABLE [dbo].[TaiKhoanNguoiDung] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__55F68FC0B9FA068E]    Script Date: 12/13/2021 09:07:17 ******/
ALTER TABLE [dbo].[TaiKhoanQuanTri] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoanNguoiDung] ([MaTK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [DBASPNhom3] SET  READ_WRITE 
GO
