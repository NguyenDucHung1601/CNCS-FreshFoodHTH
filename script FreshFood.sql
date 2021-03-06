USE [master]
GO
/****** Object:  Database [FreshFoodHTH]    Script Date: 2021-02-25 2:10:21 PM ******/
CREATE DATABASE [FreshFoodHTH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FreshFoodHTH', FILENAME = N'H:\DEV\My DataBase\CNCS_WebFreshFoodHTH\FreshFoodHTH.mdf' , SIZE = 102400KB , MAXSIZE = 2097152KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'FreshFoodHTH_log', FILENAME = N'H:\DEV\My DataBase\CNCS_WebFreshFoodHTH\FreshFoodHTH_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 20480KB )
GO
ALTER DATABASE [FreshFoodHTH] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FreshFoodHTH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FreshFoodHTH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET ARITHABORT OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FreshFoodHTH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FreshFoodHTH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FreshFoodHTH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FreshFoodHTH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET RECOVERY FULL 
GO
ALTER DATABASE [FreshFoodHTH] SET  MULTI_USER 
GO
ALTER DATABASE [FreshFoodHTH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FreshFoodHTH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FreshFoodHTH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FreshFoodHTH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FreshFoodHTH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FreshFoodHTH', N'ON'
GO
USE [FreshFoodHTH]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[IDDonHang] [uniqueidentifier] NOT NULL,
	[IDSanPham] [uniqueidentifier] NOT NULL,
	[DonViTinh] [nvarchar](100) NULL,
	[DonGiaBan] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[IDDonHang] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[IDKhachHang] [uniqueidentifier] NOT NULL,
	[IDSanPham] [uniqueidentifier] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietGioHang] PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[IDHoaDonNhap] [uniqueidentifier] NOT NULL,
	[IDSanPham] [uniqueidentifier] NOT NULL,
	[DonViTinh] [nvarchar](100) NULL,
	[DonGiaNhap] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[IDHoaDonNhap] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[IDDonHang] [uniqueidentifier] NOT NULL,
	[IDKhachHang] [uniqueidentifier] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TienHang] [decimal](18, 0) NULL,
	[TienShip] [decimal](18, 0) NULL,
	[TienGiam] [decimal](18, 0) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[IDTrangThai] [uniqueidentifier] NOT NULL,
	[IDPhuongThucThanhToan] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[IDDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[IDHoaDonNhap] [uniqueidentifier] NOT NULL,
	[IDNhaCungCap] [uniqueidentifier] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TienHang] [decimal](18, 0) NULL,
	[TienShip] [decimal](18, 0) NULL,
	[TienGiam] [decimal](18, 0) NOT NULL,
	[TongTien] [decimal](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[IDHoaDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiNguoiDung]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNguoiDung](
	[IDLoaiNguoiDung] [uniqueidentifier] NOT NULL,
	[Ten] [nvarchar](200) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDLoaiNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaGiamGia](
	[IDMaGiamGia] [uniqueidentifier] NOT NULL,
	[MaGiamGia] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[TienGiam] [decimal](18, 0) NOT NULL,
	[DieuKienApDung] [nvarchar](max) NULL,
	[HanSuDung] [date] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_MaGiamGia] PRIMARY KEY CLUSTERED 
(
	[IDMaGiamGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaGiamGiaKhachHang]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaGiamGiaKhachHang](
	[IDMaGiamGia] [uniqueidentifier] NOT NULL,
	[IDKhachHang] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MaGiamGiaKhachHang] PRIMARY KEY CLUSTERED 
(
	[IDMaGiamGia] ASC,
	[IDKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[IDNguoiDung] [uniqueidentifier] NOT NULL,
	[IDLoaiNguoiDung] [uniqueidentifier] NOT NULL,
	[IDLoaiKhachHang] [uniqueidentifier] NULL,
	[Ten] [nvarchar](200) NULL,
	[DienThoai] [varchar](12) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Username] [varchar](50) NULL,
	[Password] [nvarchar](200) NULL,
	[Avatar] [nvarchar](max) NULL,
	[TongTienGioHang] [decimal](18, 0) NULL,
	[SoDonHangDaMua] [int] NULL,
	[TongTienHangDaMua] [decimal](18, 0) NULL,
	[TrangThai] [bit] NULL,
	[LanHoatDongGanNhat] [datetime] NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[IDNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[IDNhaCungCap] [uniqueidentifier] NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[DienThoai] [varchar](12) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[IDNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCapSanPham]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCapSanPham](
	[IDNhaCungCap] [uniqueidentifier] NOT NULL,
	[IDSanPham] [uniqueidentifier] NOT NULL,
	[DonViTinh] [nvarchar](100) NULL,
	[GiaCungUng] [decimal](18, 0) NULL,
	[NgayCapNhat] [date] NULL,
 CONSTRAINT [PK_NhaCungCapSanPham] PRIMARY KEY CLUSTERED 
(
	[IDNhaCungCap] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanLoaiKhachHang]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoaiKhachHang](
	[IDLoaiKhachHang] [uniqueidentifier] NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[DieuKien] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiKhachHang] PRIMARY KEY CLUSTERED 
(
	[IDLoaiKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongThucThanhToan](
	[IDPhuongThucThanhToan] [uniqueidentifier] NOT NULL,
	[TenPhuongThucThanhToan] [nvarchar](200) NULL,
 CONSTRAINT [PK_PhuongThucThanhToan] PRIMARY KEY CLUSTERED 
(
	[IDPhuongThucThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[IDSanPham] [uniqueidentifier] NOT NULL,
	[MaOrder] [int] IDENTITY(1,1) NOT NULL,
	[MaSo] [varchar](50) NULL,
	[Ten] [nvarchar](200) NULL,
	[DonViTinh] [nvarchar](100) NULL,
	[GiaTien] [decimal](18, 0) NULL,
	[GiaKhuyenMai] [decimal](18, 0) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[CoSan] [bit] NULL,
	[SoLuong] [bigint] NULL,
	[IDTheLoai] [uniqueidentifier] NOT NULL,
	[SoLuotXem] [int] NULL,
	[SoLuotMua] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoanThanhToan]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoanThanhToan](
	[IDTaiKhoan] [uniqueidentifier] NOT NULL,
	[VietTat] [varchar](20) NULL,
	[Ten] [nvarchar](200) NULL,
	[Logo] [nvarchar](max) NULL,
	[LoaiTaiKhoan] [nvarchar](200) NULL,
 CONSTRAINT [PK_NganHang] PRIMARY KEY CLUSTERED 
(
	[IDTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TheLoai](
	[IDTheLoai] [uniqueidentifier] NOT NULL,
	[MaSo] [varchar](10) NULL,
	[Ten] [nvarchar](200) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[IDTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongTinLienHe]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThongTinLienHe](
	[TenCuaHang] [nvarchar](400) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai1] [varchar](12) NULL,
	[DienThoai2] [varchar](12) NULL,
	[GioMoCua] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[LinkFacebook] [varchar](max) NULL,
	[LinkYoutube] [varchar](max) NULL,
	[LinkInstagram] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TKThanhToanNguoiDung]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TKThanhToanNguoiDung](
	[IDTaiKhoan] [uniqueidentifier] NOT NULL,
	[IDNguoiDung] [uniqueidentifier] NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[TongTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_NganHangKhachHang] PRIMARY KEY CLUSTERED 
(
	[IDTaiKhoan] ASC,
	[IDNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 2021-02-25 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[IDTrangThai] [uniqueidentifier] NOT NULL,
	[TenTrangThai] [nvarchar](200) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[IDTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[LoaiNguoiDung] ([IDLoaiNguoiDung], [Ten]) VALUES (N'66bf1e5b-a86d-4499-ac20-8b038c6218a9', N'Client')
INSERT [dbo].[LoaiNguoiDung] ([IDLoaiNguoiDung], [Ten]) VALUES (N'28d4fe0f-26ce-4eb1-9f4a-fd1633779513', N'Admin')
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [IDLoaiNguoiDung], [IDLoaiKhachHang], [Ten], [DienThoai], [DiaChi], [Username], [Password], [Avatar], [TongTienGioHang], [SoDonHangDaMua], [TongTienHangDaMua], [TrangThai], [LanHoatDongGanNhat], [IsAdmin], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'46e6052f-77a8-4bad-bff7-79b472831095', N'28d4fe0f-26ce-4eb1-9f4a-fd1633779513', NULL, N'Admin', N'', N'', N'admin', N'$2a$10$tkJQxpBluQVGj4jwW7BCee0XiG5898y.b1o.axSrKVJdViJMwjq5e', N'', NULL, 0, NULL, NULL, CAST(N'2021-02-25 11:13:36.253' AS DateTime), 1, CAST(N'2021-02-25 11:13:36.253' AS DateTime), N'', CAST(N'2021-02-25 11:13:36.253' AS DateTime), N'')
INSERT [dbo].[PhuongThucThanhToan] ([IDPhuongThucThanhToan], [TenPhuongThucThanhToan]) VALUES (N'aace19fc-c3c3-4833-93c2-1a8c2c9dd935', N'Ví Airpay')
INSERT [dbo].[PhuongThucThanhToan] ([IDPhuongThucThanhToan], [TenPhuongThucThanhToan]) VALUES (N'48b04b9d-c216-4f75-9897-5d91e28d5784', N'Tiền mặt')
INSERT [dbo].[PhuongThucThanhToan] ([IDPhuongThucThanhToan], [TenPhuongThucThanhToan]) VALUES (N'f40ea2d3-e47b-427b-8d7c-e1a4c77ee07e', N'Internet Banking')
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'6e5d0f0a-f3a0-417e-837f-0139f57c4364', 6, N'RC.0005', N'Rau cải chíp', N'100g', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'cải chíp.png', N'Cải chip là món rau ăn quen thuộc. Lá cải bẹ trắng có thể chữa đau dạ dày, bệnh cam răng. Hạt cải bẹ trắng có vị cay, tính ấm, không độc có tác dụng trị đau răng, trị ho, tiêu thũng, tiêu đờm, thông kinh mạch. Nếu bạn hay người nhà bị đau bụng dưới, đau đầu, cam răng…, có thể khắc phục bằng cách sử dụng lá hoặc hạt cải bẹ trắng.
Rau cải bẹ trắng chứa nguyên tố vi lượng cùng các hoạt chất thực vật (Phytochemicals) đặc biệt là có vitamin C, chống ôxy hóa mạnh. Các nhà dinh dưỡng học đã chứng minh, người lớn nếu một ngày ăn 500g cải trắng, lượng canxi, sắt, carpten và vitamin cầu thiết cho cơ thể sẽ được cung cấp nhiều, giúp đầu óc bình tĩnh, giảm mệt mỏi, giảm cholesterol…', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'4f66225d-fc20-4929-8556-01755927cf9a', 27, N'RC.0026', N'Cải xanh', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'cải xanh.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'72289546-4161-4817-a4eb-0198de4f1162', 112, N'HQ.0111', N'Hồng tre', N'kg', CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), N'hồng tre.png', N'HỒNG DA TRE 
🥰 Đúng thật!!! Chẳng hồng nào ngon bằng hồng da tre. Thứ quả hồng có lớp vỏ xanh cứng ngắc hơi giốmg hồng ngâm, trông y hệt thân cây tre, xấu xí và tẻ nhạt. Thế mà cứ nhẩn nha xếp lên lá chuối úp ngược núm quả xuống, thong thả chờ đợi vài hôm, tới khi vỏ da tre trong veo dần ra, thì mới ăn được.

🍑 Hồng da tre thịt quả vàng cam mềm mướt, không nhão và xơ như hồng đỏ, nhưng lại cũng không ngọt sắc như hồng đỏ, mà lại có vị rất thanh mát, ngọt dịu dàng.

🍑 Những người ăn hồng mềm sợ khó cầm, hẳn sẽ nghĩ sao cái hồng da tre này nó lại hay quá trời hay, nó ăn theo một lối khác, cái vỏ nó cứng, nên có thể dùng thìa xúc từng miếng ngon lành, có tiếp khách cũng sang chảnh không lo khách ngại lem nhem. Nhiều nhà tiếp khách được khen làm em sướng phổng mũi.

🍑 Hầu hết khách ăn quen mua, mua nhiều, mua đi mua lại nên chắc biết lý do nhà em bán được nhiều. Nhưng vẫn nhắc lần nữa cho ai chưa thử rằng nó ngon, #hot là có lý do: cực kỳ ngon, ghét hồng mềm còn nghiện vì nó được ví như miếng pudding sang chảnh trong khách sạn 5* mềm mượt mà lại giòn giòn ngọt lịm, thơm phức...', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'87e24cbe-bb3c-4a57-a311-021f49bfa3b2', 139, N'HS.0138', N'Cá chim trắng vây vàng', N'kg', CAST(295000 AS Decimal(18, 0)), CAST(295000 AS Decimal(18, 0)), N'cá chim trắng vây vàng.png', N'Là một trong bốn tặng phẩm của biển cả (Chim, Thu, Nụ, Đé), cá chim được biết đến như một loại cá ngon, chắc thịt lại giàu dinh dưỡng. Biển nước ta có nhiều loại cá chim như: Cá chim trắng, cá chim đen, cá chim gai, cá chim Ấn Độ. Tuy nhiên đặc biệt nhất phải nói đến cá chim vây vàng của vùng biển Cát Bà.
Cá chim trắng vây vàng tươi có thịt nạc tới, vị ngọt, thịt cá mềm không khô. Không chỉ vậy cá chim trắng vây vàng có hàm lượng dinh dưỡng cao, giàu omega 3, nhiều protein. Trong 100g cá có tới 19,4g protein, 5,4g lipit, 1,1g tro, 15mg canxi, 185mg photpho, 0,6mg sắt, 145mg natri, 263mg kali, 27mg vitamin A, 2mg vitamin PP, 1mg vitamin C, các vitamin B1, B2… cung cấp được 126kcal.', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'07839b6e-0039-4874-94a7-0442a17f8263', 25, N'RC.0024', N'Rau mồng tơi', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'rau mồng tơi.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'4503d60b-5d78-4357-b694-050cce547abc', 146, N'HS.0145', N'Cua Cốm', N'kg', CAST(780000 AS Decimal(18, 0)), CAST(780000 AS Decimal(18, 0)), N'cua cốm.png', N'Cua 2 da hay Cua cốm là những con cua chuẩn bị thay vỏ, giai đoạn này thì thịt cua chứa rất nhiều dinh dưỡng và ngon nhất. Là món quà đặc sản mà người Cà Mau dành biếu tặng cho khách quý, ít bán ra thị trường.
Trong tất cả các giai đoạn của một con cua thì giai đoạn cốm (vài ngày trước khi lột) là rất quý. Đây là giai đoạn cua chắc thịt, thơm, nhiều chất dinh dưỡng nhất. So với cua thịt thì độ chắc của cua cốm gấp 5 lần, rủi ro cua bị ốp hay ít thịt là hầu như không hề có nên khi ăn sẽ rất chắc thịt. Phần gạch của cua cốm, thật ra là lớp chất dinh dưỡng mà cua tích trữ để sử dụng trong thời gian trú ẩn sau khi lột da thì rất béo và bùi. Lớp gạch này không bị cứng và dễ gây ngán ở cua gạch', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'0476cda4-212c-4a4f-bebf-05c7efa6f8bb', 114, N'HQ.0113', N'Cóc cầy', N'kg', CAST(49000 AS Decimal(18, 0)), CAST(49000 AS Decimal(18, 0)), N'cóc cầy.png', N'Cóc cầy được trồng tại Phong Điền (Cần Thơ), Châu Thành (Hậu Giang) và các tỉnh khác trong cả nước bởi người dân địa phương theo phương pháp canh tác thuận tự nhiên.
Cóc Cầy thuộc loại quả hạch, hình trứng hay hình bầu dục, dài 6-8 cm, rộng 4-5 cm, da ngoài xanh; thịt màu vàng-xanh nhạt, giòn, vị chua. Hạch khá lớn hình bầu dục có nhiều gai dạng sợi dính chặt với thịt, phần thịt nhiều, ít xơ, bên ngoài vị chua nhưng dần vào lớp thịt bên trong có vị ít chua dần.
Công dụng của quả cóc là thanh nhiệt, giải độc, giải khát, kiện tỳ vị. Quả cóc chứa nhiều acid ascorbic, trong 100g thịt cóc có tới 42g acid ascorbic có tác dụng tăng sức đề kháng cho những người bị cảm cúm. Để hiệu quả, dân gian có cách dùng cóc chấm muối nhai thật kỹ và nuốt từ từ giúp giảm ngay chứng đau họng rất tốt.
Trái cóc cầy là loại quả to hơn Cóc Thường rồi Cóc Thái. ', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'a8abfc6e-c6f0-4303-8e25-06a6eac3f841', 65, N'TC.0064', N'Cá trắm đen', N'kg', CAST(285000 AS Decimal(18, 0)), CAST(285000 AS Decimal(18, 0)), N'cá trắm đen cắt khúc.png', N'Được biết đến là một loài cá nước ngọt thuộc giống cá chép, cá trắm đen sống ở các ao hồ, sông lớn ở vùng đồng bằng Bắc và Trung bộ nước ta. Cá sống chủ yếu các vùng sông Hồng, sông Đà, sông Mã, sông Thái Bình....
Cá trắm đen là loài cá được ưa chuộng cũng như giá thành đắt nhất trong các giống cá nước ngọt phổ thông hiện nay. Cá có thân dài, hơi tròn, đầu vừa phải, cuống đuôi dẹp. Miệng cá ngắn và nhọn, hướng về phía trước hình móng ngựa. Mắt cá bé, khoảng cách giữa 2 ổ mắt rồng. Thêm vào đó hàng vây của cá có màu đen óng dễ nhận biết, chính vì vậy mọi người cũng dễ dàng phân biệt được cá trắm đen với các loại cá khác.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'092b4986-4510-4037-b660-06d14da879ea', 150, N'HS.0149', N'Tôm sú Nam Định', N'kg', CAST(505000 AS Decimal(18, 0)), CAST(505000 AS Decimal(18, 0)), N'tôm sú nam định.png', N'Đứng trong danh sách những thủy hải sản được ưa chuộng nhất. Tôm sú Nam Định đang dần khẳng định được mình trên thị trường với những tiêu chí về chất lượng như: Trạng thái - Màu sắc - Mùi vị.
Tôm sú là loại hải sản rất tươi ngon, thịt săn chắc, dễ chế biến, và mang đầy đủ hương vị từ vùng đất Nam Định. Trong thịt tôm sú đem đến khá nhiều dưỡng chất cần thiết như: protein, vitamin D, vitamin B3 và kẽm. Ngoài ra, i-ốt trong thành phần thịt tôm sú còn làm một cách tốt hơn trao đổi chất của tuyến giáp hiệu quả hơn. Đối với những người muốn tăng cân hay giảm cân thì điều này là cực kỳ cần thiết bởi vì nếu thiếu i-ốt có thể dẫn đến hoạt động của tuyến giáp không được hiệu quả như vậy khó kiểm soát được thực hiện sự trao đổi chất cần thiết.', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'fbfcdf37-5618-46f1-887b-0ad49ac94bcd', 77, N'TC.0076', N'Thịt vi sinh - sườn', N'kg', CAST(248000 AS Decimal(18, 0)), CAST(248000 AS Decimal(18, 0)), N'thịt vi sinh sườn.png', N'', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'4f60579a-2aa1-42be-ac6e-0aeee62b68c2', 115, N'HQ.0114', N'Vải Thanh Hà', N'kg', CAST(85000 AS Decimal(18, 0)), CAST(85000 AS Decimal(18, 0)), N'vải thanh hà.png', N'Xuất xứ: Hải Dương
 Vải Thanh Hà có vị ngọt mát, thịt quả dày, mọng nước, hạt nhỏ', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'd6fc977e-d0cc-455e-a506-0bacbb033edb', 129, N'SC.0128', N'Chả cốm', N'kg', CAST(280000 AS Decimal(18, 0)), CAST(280000 AS Decimal(18, 0)), N'chả cốm.png', N'', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'0d260ef5-82ef-41aa-9dc3-0d85799c3836', 148, N'HS.0147', N'Mực ống tươi', N'kg', CAST(430000 AS Decimal(18, 0)), CAST(430000 AS Decimal(18, 0)), N'mực ống tươi.png', N'Được đánh giá là loại mực tươi ngon nhất trong các loại mực. Mực ống tươi Bác Tôm có xuất xứ từ Phan Thiết hoặc Phú Quốc (tùy vào thời điểm) được đánh bắt trực tiếp từ biển khơi, là một trong những đặc sản biển nổi tiếng với hương vị thơm ngon, ngọt tự nhiên. Mực ống tươi đem lại giá trị thương mại cao nên rất được ưa chuộng tại nhiều thị trường.
Mực ống là nhóm động vật biển thuộc lớp chân đầu. Mực ống có phần thân và phần đầu rõ ràng. Thân cân xứng hai phía, có da và có 8 tay và một cặp xúc tu. Mực ống có chứa hợp chất mực màu đen trong cơ thể, khi gặp nguy hiểm, mực phun ra tạo màn đen dày đặc, qua đó lẩn trốn khỏi nguy cơ đe dọa.', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e2e457da-6c8d-42ce-8d1a-0d8f373de375', 123, N'HQ.0122', N'Dưa lưới Taki Nhật Bản', N'kg', CAST(105000 AS Decimal(18, 0)), CAST(105000 AS Decimal(18, 0)), N'dưa lưới taki nhật bản.png', N'Thông qua sự làm việc trực tiếp giữa các kỹ sư của nông trại với các chuyên hàng đầu của Nhật Bản về nông nghiệp. Dưa lưới Taki được nhập giống  trực tiếp tiếp từ Nhật Bản đã có mặt tại Việt Nam. Dưa lưới Taki được trồng theo kỹ thuật công nghệ cao, đạt tiêu chuẩn Global Gap, Viet Gap.
Dưa lưới Taki Nhật Bản được trồng bằng hệ thống tưới nước nhỏ giọt, dẫn nước từ hệ thống đến tận từng gốc cây theo đúng mức độ. Trong suốt quá trình phát triển, mỗi cây dưa được chăm sóc bằng đặc biệt bằng kỹ thuật cũng như sự đam mê. Khi dưa ra quả, tất cả quả xấu, nhỏ sẽ được cắt bỏ và chỉ để lại một quả đảm bảo nhất trên từng cây.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ba92bfdf-4c59-4fb5-9d32-0e8f2e93910c', 28, N'RC.0027', N'Bí ngòi Đà Lạt', N'kg', CAST(49000 AS Decimal(18, 0)), CAST(49000 AS Decimal(18, 0)), N'bí ngòi đà lạt.png', N'Thuộc vào họ bầu bí, thân tròn, ít vân. Nhưng bí ngòi Đà Lạt có giá trị dinh dưỡng cao và được ví như nhà máy tổng hợp các loại vitamin A, C, B, K, chất xơ, các nguyên tố vi lượng magnesium, manganese, kali. Ngoài ra còn có thêm protein, kẽm, calcium và sắt', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e916f4cf-52af-4e11-929a-100e032fa69c', 49, N'RC.0048', N'Cải làn', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'cải làn.png', N'Cải làn là một món rau quen thuộc với các vùng cao phía Bắc nước ta. Vị ngọt từ thiên nhiên kết hợp với vị giòn của cải làn để lại ấn tượng khó phai đối với những người mê ẩm thực. Cải làn có thể chiến biến thành nhiều món khác nhau:
Cải làn luộc (nước vừa sôi cho rau vào, chưa đến một phút là chín), rồi có thể chấm với rất nhiều gia vị cho thêm đậm đà: muối vừng, chấm mắm giấm, nước xốt vịt quay…
Cải làn xào thịt bò, thịt lợn, gia cầm, thủy sản cũng đều rất ngon.
Ngoài ra cải làn còn chứa rất nhiều dinh dưỡng thiết yếu giúp ngăn ngừa hàm lượng estrogen dư thừa. Cải làn còn tốt cho gan, túi mật bởi hàm lượng dồi dào của vitamin A, C, magie và sắt.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'bb7db055-7f31-4f85-9d69-103e84da372c', 144, N'HS.0143', N'Tôm he Cát Bà', N'kg', CAST(890000 AS Decimal(18, 0)), CAST(890000 AS Decimal(18, 0)), N'tôm he cát bà size lớn.png', N'Size: 8-9 con/kg
- Vỏ mỏng, mềm, thân to tròn
- Thịt ngọt thơm đậm đà
- Giàu dưỡng chất
Tôm he là loại tôm hiếm vì không nuôi được mà chỉ sống trong tự nhiên, được đánh bắt tại vùng biển Cá Bà. Tôm he không đi theo đàn lớn nên đặc biệt đánh bắt khó khăn, hàng về số lượng hạn chế.', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'7398c7cd-3fd4-49dc-94aa-15d0171d9b88', 135, N'SC.0134', N'Nem thịt', N'10 cái', CAST(80000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), N'nem thịt.png', N'Nem là món ăn truyền thống đặc trưng của người Việt, những chiếc nem chín vàng, giòn rụm, nóng hổi, pha trộn hài hòa thịt lợn, trứng, giá đỗ và miến.
Nem nhà Bác Tôm được làm từ thịt lợn quế thơm ngon, trứng gà quê, các loại rau củ sạch và đặc biệt gói bằng lá ram Hà Tĩnh, giúp nem vàng và giòn hơn.', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'797679dd-af48-404e-96e4-164413696b79', 51, N'RC.0050', N'Cải ngọt', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'cải ngọt.png', N'Cải ngọt có nguồn gốc từ Ấn Độ, Trung Quốc. Cây có thân tròn, không lông, lá có phiến xoan ngược tròn dài, đầu tròn hay tù, gốc từ từ hẹp, mép nguyên không nhăn, mập. Chùm hoa như ngù ở ngọn, cuống hoa dài 3 – 5cm, hoa vàng tươi, quả cải dài 4 – 11cm, có mỏ, hạt tròn. Cải ngọt được trồng quanh năm.
Cải ngọt thường được chế biến thành các món ăn như cải ngọt xào thịt, canh cải ngọt nấu tôm, rau cải ngọt luộc chấm xì dầu, cải ngọt xào thịt bò, cải ngọt xào chân gà..., làm lẩu cá, lẩu thịt.
Đặc biệt, cải ngọt có chất albumin, chất đường, vitamin B1, axit bốc hơi, axit panmic, coban, iốt. Rễ và lá có nhiều chất kiềm thúc đẩy sự tiêu hóa, thúc đẩy cơ thể tiếp thu albumin bảo vệ gan, chống mỡ trong gan.
Theo Đông y, cải ngọt tính ôn, có công dụng thông lợi trường vị, làm đỡ tức ngực, tiêu thực hạ khí,... có thể dùng để chữa các chứng ho, táo bón. Ngoài ra, ăn nhiều cải còn giúp cho việc phòng ngừa bệnh trĩ, ung thư ruột kết, ung thư gan và kết hợp điều trị bệnh ung thư và xơ cứng gan.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'f6a8bec6-efa5-4570-84a1-1705b637001d', 5, N'RC.0004', N'Quả su su', N'kg', CAST(28000 AS Decimal(18, 0)), CAST(28000 AS Decimal(18, 0)), N'su su.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'24877bf7-480d-4cc1-aefa-18c9c3738e61', 52, N'RC.0051', N'Ngải cứu', N'100g', CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), N'ngải cứu.png', N'Cây ngải cứu dễ trồng, dễ kiếm và tác dụng của nó đối với sức khỏe con người lại vô cùng kỳ diệu.
Xuất xứ : - Lương Sơn, Hòa Bình', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'bb3ef71a-eb24-4cbe-859f-1b2642d74e94', 134, N'SC.0133', N'Giò xào Sạch từ tâm', N'100g', CAST(35000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), N'giò xào sạch từ lâm.png', N'Nguồn nguyên liệu được lựa chọn kỹ càng đảm bảo chất lượng nhất về giá trị dinh dưỡng cũng như đạt độ thơm ngon về mùi vị khi thưởng thức.', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'f7d5f1c8-1ae9-4dec-8344-1d5802266cb1', 13, N'RC.0012', N'Rau lang', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'rau lang.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ac9466ef-951f-4dd3-b2f7-1e22849c2a3d', 104, N'HQ.0103', N'Mận An Phước xuất khẩu', N'kg', CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), N'mận an phước xuất khẩu.png', N'Mận An Phước có sự khác biệt nhiều với roi ngoài Bắc. Vỏ trái màu đỏ bóng, to đẹp, nếu dùng để trưng bàn thờ ngày đầu tháng thì rất hợp, dùng để ăn tươi cũng rất ngon. Ruột quả dày, hơi xốp nhưng giòn, thơm thơm, lại là trái cây Việt sạch nên an toàn.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'8e023862-6d6e-41f5-9ba0-204f5103eb2a', 98, N'HQ.0097', N'Xoài cát chu', N'kg', CAST(85000 AS Decimal(18, 0)), CAST(85000 AS Decimal(18, 0)), N'xoài cát chu.png', N'Được vun trồng từ vùng đất Cao Lãnh trù phú, xoài Cát Chu là một trong những đặc sản lừng danh không chỉ trong nước mà còn vươn tầm thế giới, nhưng hiện tại giá trị thực của xoài chưa về đúng vị trí của nó.
Xoài cát chu chú Chín không chỉ mang đến cho khách hàng quả xoài ngon mà còn phải an toàn. Nhờ áp dụng tiêu chuẩn GlobalGap vào sản xuất, cũng như sử dụng kỹ thuật bao trái nên đảm bảo tuyệt đối về an toàn và dư lượng thuốc bảo vệ thực vật.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'cf52c2b4-c3a7-41ae-815c-2278f37af49a', 11, N'RC.0010', N'Cải bó xôi', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'cải bó xôi.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'55191266-0a57-4f27-a337-22a69fc5e80a', 75, N'TC.0074', N'Chả cá lăng', N'kg', CAST(249000 AS Decimal(18, 0)), CAST(249000 AS Decimal(18, 0)), N'chả cá lăng.png', N'', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'0f7c505a-3242-4b0c-82fe-269000ccb87a', 142, N'HS.0141', N'Tôm hùm Nha Trang', N'kg', CAST(990000 AS Decimal(18, 0)), CAST(990000 AS Decimal(18, 0)), N'tôm hùm nha trang.png', N'Tôm hùm thân dài và có một cái đuôi cơ bắp. Hầu hết tôm hùm đều có một đôi càng lớn và đầy sức mạnh. Loài tôm hùm sống ở biển trong điều kiện sống khắt khe với vùng biển ấm, lặng, ở các khe hoặc hang hốc dưới đáy biển. 
Tôm hùm rất có giá trị dinh dưỡng. Thịt Tôm hùm có chứa rất ít chất béo và carbohydrate trong khi hàm lượng protein lại cao.', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'26c766a9-8e1c-4cc8-b808-2d0b488830da', 84, N'TC.0083', N'Ba chỉ bò Mỹ', N'kg', CAST(225000 AS Decimal(18, 0)), CAST(225000 AS Decimal(18, 0)), N'ba chỉ bò mĩ.png', N'- Xuất xứ: Mỹ
Ba chỉ bò Mỹ là phần thịt được lấy từ phần bụng của con bò, là phần thịt với những dải thịt nạc và thịt mỡ xen kẽ nhau tạo nên độ mềm, ngậy, ngọt nhưng hoàn toàn không ngấy. Ba chỉ được cắt sẵn thành các lát mỏng để tiện cho chế biến.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'2aa0d076-79f9-4587-8366-3223e1438a68', 117, N'HQ.0116', N'Thanh long đỏ', N'kg', CAST(88000 AS Decimal(18, 0)), CAST(88000 AS Decimal(18, 0)), N'thanh long đỏ.png', N'Thanh long ruột đỏ được sử dụng trong vườn lại giống thanh long Long Định 1, được lai từ mẹ là giống thanh long ruột trắng Bình Thuận và bố là thanh long ruột đỏ Colombia. Sau quá trình khảo nghiệm, thanh long ruột đỏ Bình Thuận đã chứng tỏ được rất nhiều ưu điểm. Mà dễ thấy là năng suất cao gấp 1,5 lần so với thanh long ruột trắng và độ ngọt cũng trội hơn.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'c59ab3a8-eef3-46c6-b38c-3451f502ee84', 120, N'HQ.0119', N'Kiwi vàng', N'kg', CAST(220000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), N'kiwi vàng.png', N'Quả kiwi vàng được đánh giá là một trong 10 loại hoa quả tốt nhất mà thế giới từng biết đến. Hiện nay được trồng thương mại nhiều nơi trong đó có: New Zealand, Nhật, Úc, Hoa Kỳ.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'c767fd64-fd04-416b-94e5-353bcfc3e090', 92, N'TC.0091', N'Cá trắm trắng', N'kg', CAST(175000 AS Decimal(18, 0)), CAST(175000 AS Decimal(18, 0)), N'cá trắm trắng trắm cỏ.png', N'Cá trắm trắng có tên gọi dân dã khác là cá trắm cỏ có nguồn gốc từ họ cá chép. Cá trắm trắng cũng là loài duy nhất trong họ cá chép có thể nặng tới 100kg và dài 1,5m cũng như tuổi thọ cao nhất được ghi lại là 21 năm.
Với hình dáng tương đối giống cá trắm đen như: thon dài, dẹp ở đuôi, đầu không quá to… Nhưng điểm khác biệt đó là màu sắc của các trắm trắng có phần tươi hơn, phần hông màu vàng lục nhạt, phần lưng màu nâu sẫm, bụng màu trắng xám nhạt.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'720ec8c9-0ee0-4612-8f52-35c15146952a', 33, N'RC.0032', N'Mùi ta', N'kg', CAST(70000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), N'mùi ta.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'126922d3-4698-48c2-a0da-36fb67c4283e', 89, N'TC.0088', N'Thịt bò thăn', N'kg', CAST(365000 AS Decimal(18, 0)), CAST(365000 AS Decimal(18, 0)), N'thịt bò thăn.png', N'Trên thị trường hiện nay, ngoài thịt lợn ra thì thịt bò cũng khá phổ biến với người tiêu dùng. Nhưng thịt bò cũng có quá nhiều lựa chọn: thịt mông, thịt vai, thịt thăn, nạm, sườn… Vậy bạn có biết đâu là phần thịt bò ngon nhất chưa?
Để trả lời câu hỏi trên Bác Tôm xin được đưa ra ngay câu trả lời đó là “Thịt bò thăn”. Đây là phần thịt bò được ưa chuộng nhất bởi thịt mềm và nhiều nạc nhất. Chính vì vậy giá thành thịt cũng cao nhất và quy trình để chế biến thịt thăn cũng đòi hỏi nhiều công phu, tỉ mỉ hơn.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'8f572550-9ddb-4e09-9128-38cb6de44cba', 71, N'TC.0070', N'Thịt quế - nạc xay', N'kg', CAST(249000 AS Decimal(18, 0)), CAST(249000 AS Decimal(18, 0)), N'thịt quế nạc xay.png', N'', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'33d61475-0e89-4440-bc0c-38dbe7a3322c', 40, N'RC.0039', N'Củ cải đỏ', N'kg', CAST(95000 AS Decimal(18, 0)), CAST(95000 AS Decimal(18, 0)), N'củ cải đỏ.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'a887d71a-8e1d-46a7-8b9b-3c88ff85bd3f', 17, N'RC.0016', N'Cà rốt', N'kg', CAST(42000 AS Decimal(18, 0)), CAST(42000 AS Decimal(18, 0)), N'cà rốt.png', N'- Xuất xứ: Bắc Hà - Lào Cai
- Đặc điểm: Giòn, ngọt, thanh mát
- Trọng lượng: ~5 -10 quả/kg', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'fe29e5d8-6e7b-418f-917e-3d53f4ee5c91', 81, N'TC.0080', N'Gà tre', N'kg', CAST(235000 AS Decimal(18, 0)), CAST(235000 AS Decimal(18, 0)), N'gà tre.png', N'Gà tre ngọt thơm, chắc thịt. Gà được chăn thả tự nhiên trong không gian rộng, được nuối từ 9-11 tháng trước khi xuất bán.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'04de64fb-5e5a-412f-b669-3e56358f53f4', 149, N'HS.0148', N'Cá hồi fillet Nauy', N'kg', CAST(535000 AS Decimal(18, 0)), CAST(535000 AS Decimal(18, 0)), N'cá hồi fillet nauy.png', N'Cá hồi fillet được Bác Tôm nhập trực tiếp từ Nauy qua đường hàng không. Với tên tuổi đã được tạo dựng uy tín từ lâu đời đảm bảo được chất lượng cũng như độ tươi ngon trong từng thớ cá hồi.
Để được những miếng cá hồi thơm ngon nhất thì luôn phải đảm bảo các tiêu chuẩn nghiêm ngặt trong quá trình nuôi dưỡng và sản xuất:
Thức ăn cho cá hồi đảm bảo không có chất biến đổi gen (thông thường thức ăn sẽ là cá loại cá con như cá tuyết, cá cơm....)
Giống cá hồi Nauy phải được lựa chọn kỹ càng, những con khỏe mạnh và sạch bệnh nhất', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'a10c4072-c790-45c7-8166-3f6258f17edd', 130, N'SC.0129', N'Chả mực', N'kg', CAST(475000 AS Decimal(18, 0)), CAST(475000 AS Decimal(18, 0)), N'chả mực.png', N'- Xuất xứ: Vân Đồn, Cô Tô
- Thành Phần: Mực tươi, Nước mắm, Hạt tiêu, hành, tỏi
Mực đánh bắt tự nhiên', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'b677e898-042b-4ea5-aff9-4098ca0c313c', 62, N'TC.0061', N'Gà quế', N'kg', CAST(285000 AS Decimal(18, 0)), CAST(285000 AS Decimal(18, 0)), N'gà quế.png', N'- Xuất xứ: Sóc Sơn - Hà Nội
- Đặc điểm của Gà Giun Quế:
+ Thơm ngon, thịt chắc, da giòn khác hẳn các loại gà nuôi công nghiệp
+ Không sử dụng cám tăng trọng
+ Không sử dụng thuốc kháng sinh, không tồn dư chất hóa học
- Trọng lượng: 1,2 - 1,5kg/con', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'4b959862-c112-45be-8953-40a1981d9b82', 42, N'RC.0041', N'Cà chua Hà Lan', N'kg', CAST(52000 AS Decimal(18, 0)), CAST(52000 AS Decimal(18, 0)), N'cà chua hà lan.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'fea5e600-588d-464c-a6c5-42b3075541d9', 109, N'HQ.0108', N'Dưa lưới TL3', N'kg', CAST(105000 AS Decimal(18, 0)), CAST(105000 AS Decimal(18, 0)), N'dưa lưới.png', N'Dưa lứa TL3 có hình tròn, vân lưới đẹp, màu sắc bắt mắt, có độ lớn đồng đều, thit dầy, vỏ mỏng, có mùi thơm dịu nhẹ đặc trưng.
Thịt quả màu cam, thơm, mịn, giòn, rất ngọt.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'9936f882-0861-4d9c-bcc7-4308efe922c5', 63, N'TC.0062', N'Tôm rảo', N'kg', CAST(135000 AS Decimal(18, 0)), CAST(135000 AS Decimal(18, 0)), N'tôm rảo.png', N'Tôm rảo hay sống ở các đầm phá nơi ven biển nên là ở môi trường nước lợ. Vì thế chúng không có vị tanh như loài tôm sông bạn hay gặp. Thịt tôm rảo ăn đậm đà như tôm biển và lại còn ngọt như con tôm sông nên rất được yêu thích.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'16a187a5-5735-44b7-81fb-4655a5ac4018', 41, N'RC.0040', N'Cải thảo', N'kg', CAST(35000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), N'cải thảo.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ac6abcc9-67e3-41a6-a57a-472c90534968', 113, N'HQ.0112', N'Lê Hàn Quốc', N'kg', CAST(150000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), N'lê hàn quốc.png', N'Lê Hàn Quốc có mẫu mã đẹp, vỏ mọng, mịn. Quả rất đều, ăn giòn, mọng nước, ngọt mát, đậm vị hơn rất nhiều so với những loại lê thông thường ở Việt Nam.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'a0516969-b307-46b4-8d68-481634f37a96', 108, N'HQ.0107', N'Vũ sữa Lò Rèn', N'kg', CAST(105000 AS Decimal(18, 0)), CAST(105000 AS Decimal(18, 0)), N'vú sữa lò rèn.png', N'', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'eaf8a7dd-8472-4358-bc06-499861f70835', 132, N'SC.0131', N'Chè bưởi An Giang', N'kg', CAST(75000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), N'chè bưởi an giang.png', N'SET CHÈ BƯỞI AN GIANG 
Thơm thơm, giòn giòn, giải nhiệt mùa hè
🌿 Set này bao gồm: 1kg chè bưởi và 320ml nước cốt dừa (được khoảng 6-7 cốc)', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'4a45e77d-82e3-40f0-b6db-49ac7fe4fbd3', 111, N'HQ.0110', N'Bơ 034', N'kg', CAST(102000 AS Decimal(18, 0)), CAST(102000 AS Decimal(18, 0)), N'bơ 034.png', N'Bơ sáp dẻo mang mã số 034 đấy các chị ạ. Gọi 034 vì giống bơ này của ông Dậu Loan mang đi tham gia hội thi bơ ngon và đoạt giải, số thứ tự tham gia hội thi của bơ này là số 034 nên bạn ấy được đặt tên là 034 luôn.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'f5c15bbb-608b-4257-9c73-4ab704980329', 131, N'SC.0130', N'Chả ram tôm đất Bình Định', N'0.5 kg', CAST(140000 AS Decimal(18, 0)), CAST(140000 AS Decimal(18, 0)), N'chả ram tôm đất bình định.png', N'- Trọng lượng : 500g
Bình Định có rất nhiều món ăn ngon, nhiều món đặc sản truyền thống nổi tiếng đã từng đi vào thơ ca như Bún bánh canh chả cá Quy Nhơn, Nem chả Chợ Huyện, Bánh ít lá gai, bánh tráng nước cốt dừa Tam Quan, bánh hỏi Diêu Trì, rượu Bàu Đá Nhơn Lộc…
Trong đó chả ram tôm đất là đặc sản mà người dân trong nước và ngoài nước biết đến nhiều nhất.', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e0d13706-ec75-4cb6-afdd-4ebd858528b0', 91, N'TC.0090', N'Cua đồng bóc mai', N'kg', CAST(270000 AS Decimal(18, 0)), CAST(270000 AS Decimal(18, 0)), N'cua đồng bóc mai.png', N'Từ lâu nay, cua đồng là món ăn bổ dưỡng, dân dã và phổ biến khắp cả nước. Với hương vị đặc trưng thơm ngon, đây là món ăn kích thích vị giác, dễ tiêu hóa và phù hợp cho những ngày hè nóng nực.
Tại Bác Tôm, cua đồng bóc mai là loại cua ngon nhất, có thớ thịt dày, chắc; khi nấu sẽ có mùi thơm hấp dẫn. Đặc biệt, cua đồng còn có tác dụng giúp chữa trẻ còi xương, chậm biết đi; chữa vết thương đụng dập, lở loét; chữa tâm trạng bồn chồn, kém ăn, ít ngủ; giải nhiệt mùa hè, trị lở ngứa…', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'99ce241d-7db4-4744-b559-50bf0379803f', 128, N'SC.0127', N'Chả cá Thát Lát', N'kg', CAST(305000 AS Decimal(18, 0)), CAST(305000 AS Decimal(18, 0)), N'chả cá thát lát.png', N'Thành phần nguyên liệu CHẢ CÁ THÁT LÁT:
- Cá thát lát (70%) - Được chọn lọc kỹ đảm bảo cá tươi, chỉ sử dụng duy nhất thịt cá. 
- Thịt lợn và mỡ phần từ lợn sạch Hòa Bình 
- Nước mắm Ông Kỳ và nước mắm Khải Hoàn 
- Hành tỏi khô Lý Sơn hoặc Hải Dương 
- Tiêu sọ Lâm Đồng', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'203483ff-bc58-4825-8a9f-56311ff3a2e2', 12, N'RC.0011', N'Cải canh', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'cải canh.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ada479bd-101c-4386-bbc9-56c419f088d5', 44, N'RC.0043', N'Khoai sọ', N'kg', CAST(36000 AS Decimal(18, 0)), CAST(36000 AS Decimal(18, 0)), N'khoai sọ.png', N'- Xuất xứ: Bắc Hà - Lào Cai
- Đặc điểm: Khoai ăn bở, ngọt bùi
- Trọng lượng: ~3 - 6 quả/kg', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'298f7a13-fdd9-49be-9806-576fe5552bfd', 32, N'RC.0031', N'Cải xoong', N'kg', CAST(35000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), N'cải xoong.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'95fffa61-979d-455c-938a-5a0d653a1fcd', 102, N'HQ.0101', N'Dưa hấu có hạt', N'kg', CAST(27000 AS Decimal(18, 0)), CAST(27000 AS Decimal(18, 0)), N'dưa hấu có hạt.png', N'Trong dưa hấu, hơn 90% là nước, đó là lý do khi ăn bạn sẽ cảm thấy nhanh no. Ngoài ra, loại quả này chứa hàm lượng chất xơ dồi dào. Nước và chất xơ khi vào cơ thể cung cấp năng lượng, chống mất nước trong ngày hè, cải thiện tiêu hóa.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'94a1b774-1285-484a-97c5-5e7de786527c', 127, N'SC.0126', N'Cá rô phi nướng', N'con', CAST(135000 AS Decimal(18, 0)), CAST(135000 AS Decimal(18, 0)), N'cá rô phi nướng.png', N'Cá rô phi nướng Điện Biên nhà Tôm được làm từ những chú cá nuôi lồng ở hồ cùng khâu lựa chọn tỉ mỉ từ kích cỡ cá rồi sơ chế cá
Cá được nướng nhỏ lửa liu riu trên than hoa để thịt chín dần mà không bị cháy. Thời gian để đảm bảo cá chín đều, dậy mùi quyện gia vị phải mất từ 150 - 180 phút.', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e03bc770-5c16-4f65-84d2-5ef023b76a62', 64, N'TC.0063', N'Ngan hoà bình', N'kg', CAST(125000 AS Decimal(18, 0)), CAST(125000 AS Decimal(18, 0)), N'ngan hoà bình.png', N'- Xuất xứ: Hòa Bình
- Khối lượng: ~1.5kg/con
- Đặc điểm: ngan được chăn thả tự nhiên nên thịt chắc, ngọt thịt, xương nhỏ', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'd6698edb-b95e-4a34-a7b4-5f1e753b6c07', 133, N'SC.0132', N'Giò thịt lợn quế', N'kg', CAST(275000 AS Decimal(18, 0)), CAST(275000 AS Decimal(18, 0)), N'giò thịt lợn quế.png', N'- Xuất xứ: Sóc Sơn - Hà Nội
- Giò quế được làm từ những phần thịt nạc ngon nhất của lợn quế.
- Giò quế ăn có vị ngọt của thịt, thơm của tiêu cùng các gia vị', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'699ccf7f-e862-4c23-a1b0-602b4ac9005c', 103, N'HQ.0102', N'Táo Ba Mọi', N'kg', CAST(55000 AS Decimal(18, 0)), CAST(55000 AS Decimal(18, 0)), N'táo ba mọi.png', N'Táo xanh được trồng tại Trang trại Ba Mọi vẫn là sản phẩm chất lượng cao được mọi người tin dùng vì trang trại Ba Mọi là trang trại đạt tiêu chuẩn VietGAP nên sản phẩm Táo Ba Mọi sản xuất ra được quản lý nghiêm ngặt từ lúc trồng, chăm sóc, thu hoạch, bao gói, vận chuyển và tiêu thụ sản phẩm.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'790d882d-7f62-4d77-b38b-6048e770cb1d', 124, N'HQ.0123', N'Thanh long Phú Hội', N'kg', CAST(88000 AS Decimal(18, 0)), CAST(88000 AS Decimal(18, 0)), N'thanh long phú hội.png', N'Thanh long ruột đỏ Phú Hội được sử dụng trong vườn lại giống thanh long Long Định 1, được lai từ mẹ là giống thanh long ruột trắng Bình Thuận và bố là thanh long ruột đỏ Colombia. Sau quá trình khảo nghiệm, thanh long ruột đỏ Bình Thuận đã chứng tỏ được rất nhiều ưu điểm. Mà dễ thấy là năng suất cao gấp 1,5 lần so với thanh long ruột trắng và độ ngọt cũng trội hơn.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e06e9c7a-e1b6-4aff-a9ac-61a0c5b80f78', 7, N'RC.0006', N'Mướp hương', N'100g', CAST(3200 AS Decimal(18, 0)), CAST(3200 AS Decimal(18, 0)), N'mướp hương.png', N'Mướp là một loại cây thảo dạng dây leo, được trồng để lấy quả xanh. Với nhiều chất dinh dưỡng và công dụng đặc biệt tốt cho sức khỏe, mướp được nhiều người lựa chọn trong bữa ăn gia đình.
Mướp hương có vị thơm ngát, ăn ngọt mát ', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'b5157463-f044-476e-9e0b-6237e722980d', 38, N'RC.0037', N'Cần tây Đà Lạt', N'kg', CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), N'cần tây đà lạt.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'b042dbd5-57f5-45ba-901d-634da70cb7b2', 116, N'HQ.0115', N'Dừa CocoLala', N'kg', CAST(44000 AS Decimal(18, 0)), CAST(44000 AS Decimal(18, 0)), N'dừa cocolala.png', N'Được lựa chọn từ dừa xiêm xanh của Bến Tre với những trái dừa “bánh tẻ” cho chất lượng cùi dừa dẻo và nước ngon, ngọt nhất. Không sử dụng chất tẩy trắng, do đó sản phẩm dừa xiêm nắp khoen COCOLALA sẽ có màu nâu vàng tự nhiên.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'8baec44c-7766-45d3-b6da-645b3434799d', 2, N'RC.0001', N'Cà chua', N'kg', CAST(37000 AS Decimal(18, 0)), CAST(37000 AS Decimal(18, 0)), N'cà chua.png', N'Cà chua là một loại nguyên liệu thường thấy trong mỗi bữa ăn của gia đình Việt Nam. Chúng có tên gọi khoa học là Solanum lycopersicum, rất giàu dinh dưỡng vitamin A, C, K, B6 và là nguồn thực phẩm giàu Kali, Mangan, Magie, Chất xơ, Protein góp phần đặc biệt vào sức khỏe của con người.
Xuất xứ: Hà Nam
Chất lượng: Giàu dinh dưỡng', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ba32e70e-b751-4759-a293-6613829a598c', 18, N'RC.0017', N'Khoai lang giống Nhật Đà Lạt', N'kg', CAST(53000 AS Decimal(18, 0)), CAST(53000 AS Decimal(18, 0)), N'khoai lang giống nhật đà lạt.png', N'Một đặc sản thiên nhiên ưu đãi cho vùng đất Đà Lạt - Khoai lang mật. Hương vị dẻo, thơm, ngọt mà bất kỳ khách hàng nào khi thưởng thức cũng đều cảm nhận được, không phải tự nhiên mà khoai lang mật trở thành đặc sản mà khi du khách đến với Đà Lạt đều muốn mua về làm quà, mà bởi vị ngọt, tưa mật dẻo thơm không làm người ăn bị nghẹn như các giống khoai lang khác.
Khoai lang mật được trồng  trên những đồi đất đỏ bazan. Với độ cao 1500m so với mực nước biển, thêm vào đó là được bao quanh bởi quần hệ thực vật rừng bao quanh. Chính vì điều kiện thuận lợi như vậy đã tạo nên hương vị khoai lang mật không đâu ngon bằng.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'300dfc7a-ad3c-4dc2-877f-68a22d825dbe', 55, N'TC.0054', N'Thịt quế ba chỉ', N'kg', CAST(240000 AS Decimal(18, 0)), CAST(240000 AS Decimal(18, 0)), N'thịt quế ba chỉ.png', N'THỊT BA CHỈ QUẾ
Thịt ba chỉ lợn quế là phần thịt bụng của lợn quế, bao gồm các lớp thịt và mỡ phần xếp xen kẽ lên nhau thành nhiều lớp. Thịt ba chỉ quế là loại phổ biến và được ưa chuộng nhất nên cũng dễ dàng chế biến ba chỉ thành nhiều món như chiên, luộc, quay giòn, kho...', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'87a5a95b-82fa-46e7-9885-6e139ff3d089', 125, N'HQ.0124', N'Chuối ngự Đại Hoàng', N'kg', CAST(58000 AS Decimal(18, 0)), CAST(58000 AS Decimal(18, 0)), N'chuối ngự đại hoàng.png', N'Chuối ngự Đại Hoàng là giống chuối ngon xếp đầu bảng trong hơn 30 giống chuối ở Việt Nam. Gọi là chuối Ngự vì xưa kia là chuối tiến vua, món ăn tráng miệng sau khi ngự thiện (Vua dùng bữa). Chuối Ngự quả chỉ bằng ngón tay cái, vỏ mỏng tang, nuột nà, ruột vàng ươm, ăn vào ngọt dịu, thơm nức mũi.
Xuất xứ: Hà Nam
Chất lượng: Vỏ mỏng, ruột vàng ươm, ngọt dịu', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'7a881c39-38ae-4383-8b8b-73c9088d37d8', 73, N'TC.0072', N'Đụng thịt lợn đen Hà Giang', N'kg', CAST(245000 AS Decimal(18, 0)), CAST(245000 AS Decimal(18, 0)), N'đụng thịt lợn đen hà giang.png', N'ĐỤNG THỊT LỢN ĐEN HÀ GIANG
Suất 3KG - Chỉ 3 phần NGON NHẤT
- 1kg thịt nạc vai
- 1kg thịt ba chỉ
- 1kg sườn ngon
NGỌT THỊT - CHẮC XƯƠNG
=>>Giá chỉ 245k/kg (1 suất đụng 3kg)', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'a652428c-827b-4810-920a-74f43b7eacc6', 126, N'HQ.0125', N'Chanh đào', N'kg', CAST(52000 AS Decimal(18, 0)), CAST(52000 AS Decimal(18, 0)), N'chanh đào.png', N'Vườn chanh được bao quanh bởi những dãy núi cao, nằm tít trên sườn đồi leo muốn bở hơi tai, nhưng bù lại không khí trong lành và nguồn nước tự nhiên mát rượi, không sử dụng thuốc trừ sâu, thuốc diệt cỏ trong canh tác. Được mùa, những trái chanh rám hồng lúc lỉu trên cành nhìn là muốn hái...
Mọi người thường nhắc tới tác dụng “thần thánh” của Chanh Đào Mật Ong trong thời tiết giao mùa để phòng chống các bệnh viêm họng, ngoài ra chanh đào có đặc điểm vỏ mỏng (ngả vàng khi chín), ruột hồng, mọng nước cũng rất thích hợp để chị em pha chanh muối uống để giảm cân đó ạ.
 Với chanh đào, các chị có thể chế biến theo cách sau để dùng dần:
Chuẩn bị: Chanh đào, mật ong, đường phèn, muối, bình thủy tinh.
Cách làm:
Chanh đào: Chọn quả to tròn, hơi chín, mọng nước. Rửa chanh thật sạch, ngâm nước muối 30 phút rồi vớt ra để ráo.
Thái chanh đào thành từng miếng mỏng, cho vào hũ. Cứ xếp một lớp chanh đào lại rải một lớp đường phèn.
Cuối cùng, đổ mật ong ngập chanh đào là được. Nên dùng 1 cái vỉ để nén chanh đào xuống cho chanh đào khỏi nổi lên trên. Tỉ lệ ngâm: 1 chanh - 1 mật ong - 0,5 đường phèn.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'df45dd81-e24a-4f02-9698-75cce10de193', 141, N'HS.0140', N'Bề bề bơi', N'kg', CAST(425000 AS Decimal(18, 0)), CAST(425000 AS Decimal(18, 0)), N'bề bề bơi.png', N'', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'5cf6c6f6-d5f4-4d2c-9425-75d9043f4796', 72, N'TC.0071', N'Bắp bò Wagyu F1', N'kg', CAST(585000 AS Decimal(18, 0)), CAST(585000 AS Decimal(18, 0)), N'bắp bò wagyu f1.png', N'Thịt bò Wagyu là một loại thịt bò thượng hạng và có giá trị dinh dưỡng cao. Thịt bò có các vân mỡ là điểm tạo nên sự khác biệt với bò thông thường. Thịt ngọt, mềm, khi ăn có vị ngậy hơn thịt bò thường rất nhiều', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'46837953-d045-45b3-8db0-7781cf989b2b', 56, N'TC.0055', N'Thịt quế - sườn', N'kg', CAST(275000 AS Decimal(18, 0)), CAST(275000 AS Decimal(18, 0)), N'thịt quế sườn.png', N'XƯƠNG SƯỜN LỢN QUẾ
Nằm ở phần xương bụng của lợn quế, đây được đánh giá là phần xương ngon nhất của con lợn chúng được lọc từ phần xương sườn của con lợn và có dắt thịt ở trên đó. Sườn lợn quế là nguyên liệu của món sườn nướng, ngoài ra còn món chả chìa cũng khá phổ biến. Sườn lợn quế có thể chia thành các dạng:
Sườn non là phần xương sườn nhỏ, xương dẹt, nhiều thịt, ít xương, thường có sụn. Phần sườn non này là ngon nhất, dùng để chế biến các món như nướng, sườn rim, sườn rang sả ớt, sườn chua ngọt.
Dẻ sườn: Người phương Tây rất thường dùng cả tảng sườn lớn để nướng, khi ăn thì mới cắt theo từng dẻ sườn.
Sườn cốt-lết là phần thịt cốt-lết còn gắn với một đoạn xương sườn. Phần thịt này hay được tẩm ướp để làm các món nướng, chiên, áp chảo rất ngon.
Sườn già là phần sườn có xương to hơn, cứng hơn, ít thịt hơn, khi nấu cần thời gian lâu hơn, thịt dai hơn, thích hợp làm các món canh hầm.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ffdf1336-f5fa-4b52-a7da-79d5b936022c', 23, N'RC.0022', N'Củ cải trắng', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'củ cải trắng.png', N'Một loại cây sinh trưởng tốt ở những nơi có khí hậu mát mẻ và được trồng ở khắp các tỉnh miền Bắc - Củ cải. Tuy nhiên, thiên nhiên đã trù phú cho vùng đất Bắc Hà có được loại củ cải với chất lượng tuyệt vời, vị ngọt thanh mát và còn có những công dụng không ngờ tới:
Giảm nguy cơ ung thư
Điều chỉnh huyết áp
Tốt cho bệnh nhân tiểu đường
Phòng chống cảm lạnh và ho
Ngăn ngừa bệnh vàng da
Chống táo bón
Nhưng cũng có một vài lưu  ý: không sử dụng củ cải với  táo, nho, lê, nhân sâm, mộc nhĩ vì sẽ dẫn tới những tác dụng phụ không mong muốn.
Củ cải được cung cấp bởi Bác Tôm được đảm bảo rõ nguồn gốc cũng như chất lượng sản phẩm.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'703f5f44-247f-4a8c-bac8-7c19130a615a', 34, N'RC.0033', N'Rau thơm', N'kg', CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), N'rau thơm.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'14410858-b470-4ce6-86ff-7cc5d1bb460c', 14, N'RC.0013', N'Quả sấu', N'100g', CAST(4500 AS Decimal(18, 0)), CAST(4500 AS Decimal(18, 0)), N'sấu.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'9989a952-6834-4e16-93b9-7d42aca6cdcd', 88, N'TC.0087', N'Thịt quế - nạc vai', N'kg', CAST(250000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), N'thịt quế nạc vai.png', N'THỊT NẠC VAI LỢN QUẾ
Thịt nạc vai là phần thịt nằm ở vai con lợn. Phần thịt ở này hay được hoạt động nên phần thịt ở đây dai và giòn nhất. Đặc điểm này phù hợp để làm các món nướng, chiên hoặc rán. Thịt nạc vai cũng giống như thịt ba chỉ là đều có nạc và mỡ nhưng thịt nạc vai thường chắc hơn.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e19d6988-6235-4351-ae13-7d7920e097fb', 47, N'RC.0046', N'Hành là', N'kg', CAST(8500 AS Decimal(18, 0)), CAST(8500 AS Decimal(18, 0)), N'hành lá.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'871931e4-9543-4a36-a82a-81abe85b81ed', 137, N'HS.0136', N'Cá thu tươi Phú Quốc', N'kg', CAST(370000 AS Decimal(18, 0)), CAST(370000 AS Decimal(18, 0)), N'cá thu tươi phú quốc.png', N'', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'c2877bce-4978-441f-9bb4-82e32174b8b6', 20, N'RC.0019', N'Ngọn đậu Hà Lan', N'kg', CAST(70000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), N'ngọn đậu hà lan.png', N'Ngọn đậu hà lan là phần ngọn của cây đậu hà lan, mọc theo dàn, ngọn nhỏ, mềm, màu xanh lá cây nhạt.
- Xuất xứ: Bắc Hà - Lào Cai', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ad6d096f-4a05-4c67-8cec-85fad22614e9', 86, N'TC.0085', N'Combo đụng thịt lợn giun quế', N'combo', CAST(735000 AS Decimal(18, 0)), CAST(735000 AS Decimal(18, 0)), N'combo đụng thịt lợn giun quế.png', N'Thịt lợn quế Bác Tôm được cam kết nuôi theo quy trình đảm bảo an toàn. Kiểm tra định kỳ các mẫu thịt 3 tháng/lần. Lợn được nghe nhạc, tắm nắng hàng ngày. Hơn nữa, 100% lợn được sản xuất từ trang trại tại Sóc Sơn, nguồn gốc rõ ràng với giống lợn được lai từ lợn bố Duroc vs lợn mẹ Yorkshire.
Mỗi suất đụng nặng từ 3 - 4 kg tùy theo pha thịt 
Một combo đụng thịt lợn giun quế sẽ bao gồm
Thịt nạc vai
Thịt thăn
Thịt ba chỉ
Thịt sấn vai
Thịt chân giò
Móng giò
Xương sườn, xương cục, xương ống', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'34cf26f6-c0d0-4620-bf37-898d6ad15e42', 48, N'RC.0047', N'Quả bầu', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'quả bầu.png', N'- Xuất xứ: Bắc Hà - Lào Cai
- Đặc điểm: Quả bầu hình trụ dài, vỏ màu xanh đốm, ruột màu trắng. Bầu có tính lạnh, vị ngọt, có tác dụng giải nhiệt rất tốt:
- Khối lượng: 0,8 - 1,5kg/quả', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'59160946-00a7-4786-b332-8e050ab32657', 152, N'HS.0151', N'Cá thu nướng Phú Quốc', N'kg', CAST(380000 AS Decimal(18, 0)), CAST(380000 AS Decimal(18, 0)), N'cá thu nướng phú quốc.png', N'Cá thu nướng Phú Quốc được đánh bắt lên, còn tươi rói, được cắt khúc, nướng lên thơm lừng, luôn giữ được độ tươi, độ ngọt và độ ẩm, độ chắc thịt của cá và không cần bất kì chất bảo quản nào.
Cá thu nướng có thể chế biến được rất nhiều món ngon như: cá kho, nướng, chiên... Các món từ cá thu đều rất ngon, bổ dưỡng', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'd76f90bc-cce2-4e3d-ad5f-8f496c6b13af', 57, N'TC.0056', N'Thịt quế - thăn', N'kg', CAST(240000 AS Decimal(18, 0)), CAST(240000 AS Decimal(18, 0)), N'thịt quế thăn.png', N'THỊT THĂN LỢN QUẾ
Thịt thăn hay còn gọi là thịt nạc thăn. Đây là phần thịt siêu nạc, không có chút mỡ lợn nào nhưng lại mềm nhất trong những phần thịt của con lợn. Có ưu điểm là thơm, không hôi và rất mềm nên thịt thăn thường được dùng làm chả giò, hay là làm ruốc. Thịt thăn lợn quế rất tốt cho phụ nữ mới sinh bằng cách là rang lên, luộc hoặc nấu canh rau ngót.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'76890f9a-2756-4a55-8530-90d2f61acbe8', 31, N'RC.0030', N'Súp lơ baby', N'kg', CAST(95000 AS Decimal(18, 0)), CAST(95000 AS Decimal(18, 0)), N'súp lơ baby.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'7c034dec-9285-43b7-b93c-93642700ceb1', 54, N'TC.0053', N'Chim câu Hoà Bình', N'kg', CAST(78000 AS Decimal(18, 0)), CAST(78000 AS Decimal(18, 0)), N'chim câu hoà bình.png', N'- Xuất xứ: Lương Sơn - Hòa Bình
- Chim câu Hòa Bình là giống chim câu Pháp được nuôi chủ yếu bằng thóc gạo, ngô, đậu tương
- Đặc điểm: Thịt chắc, ngọt thịt, nhiều chất dinh dưỡng phù hợp để nấu các món tẩm bổ
- Trọng lượng: ~3 - 4 con/kg', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'6523da64-2936-474f-927f-94296f2a0ec5', 90, N'TC.0089', N'Thịt bò bắp', N'kg', CAST(345000 AS Decimal(18, 0)), CAST(345000 AS Decimal(18, 0)), N'thịt bò bắp.png', N'Vĩnh Tường, Vĩnh Phúc từ lâu đã là địa danh nổi tiếng về nghề mua, bán, giết mổ trâu bò để cung cấp cho thị trường Hà Nội. Để được những miếng thịt bò thơm ngon, các “nghệ nhân” Vĩnh Tường phải có kinh nghiệm tối thiểu 5 năm để có thể thực hiện chuẩn quy trình mổ thịt bò, đem lại những phần bò ngon nhất đến tay người tiêu dùng.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'65faee30-6d39-4c71-a0e3-94826ca52c88', 136, N'SC.0135', N'Nem tôm thịt', N'10 cái', CAST(115000 AS Decimal(18, 0)), CAST(115000 AS Decimal(18, 0)), N'nem tôm thịt.png', N'', 1, 1000, N'1105af02-3bca-448f-8517-10350ff5efa6', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'0eaea139-383b-4bf5-9b16-96e96fe4dbc5', 61, N'TC.0060', N'Vịt cỏ Hoà Bình', N'kg', CAST(115000 AS Decimal(18, 0)), CAST(115000 AS Decimal(18, 0)), N'vịt cỏ hoà bình.png', N'Đặc sản về vịt cỏ vốn đã nổi tiếng khắp cả nước, bởi giống vịt cũng như sự phong phú trong cách chế biến. Hiện giờ, trên kệ hàng của Bác Tôm đã có sẵn vịt cỏ từ Hòa Bình.
Vịt cỏ Hòa Bình một loại thực phẩm tươi sống vô cùng nhỏ xương, thịt ngọt, vị đậm đà, trọng lượng từng con vừa tầm. Vịt cỏ được làm sạch nên quý khách không cần mất thời gian sơ chế mà có thể chế biến món ăn luôn, tiết kiệm được rất nhiều thời gian.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'c8669ae4-ae67-4325-ba0b-98ee96a2b714', 99, N'HQ.0098', N'Dưa lê Ninh Thuân', N'kg', CAST(45000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), N'dưa lê ninh thuận.png', N'Dưa lê Bác Tôm được trồng xen canh trong vườn nho, hoặc các nông trường Ninh Thuận đầy nắng gió tạo nên vị ngọt đậm, thơm thơm đặc trưng đã làm bao nhiêu thực khách phải thương nhớ.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'eed94e47-4cab-4caf-bda2-999163a41de4', 80, N'TC.0079', N'Thịt bê Nghệ An', N'kg', CAST(315000 AS Decimal(18, 0)), CAST(315000 AS Decimal(18, 0)), N'thịt bê nghệ an.png', N'Xuất xứ: Nghệ An
Đã được thái và tẩm ướp sẵn.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'fcf0957f-eda8-489b-b145-9e907fd0e750', 50, N'RC.0049', N'Nấm đùi gà', N'kg', CAST(180000 AS Decimal(18, 0)), CAST(18000 AS Decimal(18, 0)), N'nấm đùi gà.png', N'Được gọi là “Nữ hoàng của các loại nấm” - Nấm đùi gà đang dần được ưu thích trong các bữa ăn, liên hoan của thực khách Việt.
Nấm đùi gà là loại nấm có xuất xứ từ Đông Á, nhưng hiện giờ đã được trồng phổ biến rộng rãi trên khắp thế giới. Nấm có phần nón hình cầu, thân tròn, thon giống hình đùi gà nên được gọi là nấm đùi gà.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'2316a59f-1a9e-4644-8aa4-a050a3f6a8e7', 60, N'TC.0059', N'Xương ống lợn quế', N'kg', CAST(138000 AS Decimal(18, 0)), CAST(138000 AS Decimal(18, 0)), N'xương ống lơn quế.png', N'XƯƠNG ỐNG LỢN QUẾ
Đây là phần xương trong bắp chân của lợn quế, do thành phần chứa nhiều tủy sống nên thường được dùng để hầm, ninh lấy nước. Do thịt lợn quế nuôi đảm bảo nên khi hầm, ninh lâu vẫn đảm bảo nước dùng ngọt, không cặn và bọt.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'641eee6c-81eb-42e7-a673-a0fa6e153c21', 107, N'HQ.0106', N'Bưởi da xanh', N'kg', CAST(99000 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), N'dưởi da xanh.png', N'Bưởi da xanh hữu cơ được trồng và chăm sóc theo tiêu chuẩn hữu cơ:
- Không thuốc trừ sâu
- Không phân bón hoá học
- Không chất kích thích tăng trưởng', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'356b80ce-3955-47eb-a013-a1ae1ae0e950', 26, N'RC.0025', N'Cải thảo', N'kg', CAST(35000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), N'cải thảo.png', N'Cải thảo còn được gọi là cải bao, cải cuốn, bắp cải tây là phân loài thực vật thuộc họ Cải ăn được có nguồn gốc từ Trung Quốc, được sử dụng rộng rãi trong các món ăn ở Đông Nam Á và Đông Á. Loài thực vật này trồng nhiều ở Trung Quốc, Hàn Quốc, Nhật Bản, Việt Nam... nhưng cũng có thể bắt gặp ở Bắc Mỹ, châu Âu, Úc, New Zealand.
Cải thảo có màu sắc khá giống với cải bắp, phần lá bao ngoài của màu xanh đậm, còn lá cuộn ở bên trong (gọi là lá non) có màu xanh nhạt, trong khi phần cuống lá có màu trắng.
Trọng lượng: ~1 - 1,8kg
Đặc điểm: Cải thảo ăn có vị ngọt, thanh rất dễ chế biến', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'53cb5da5-cbfa-4772-a63e-a2f8bd0d3dae', 58, N'TC.0057', N'Gà đồi Hoà Bình', N'kg', CAST(235000 AS Decimal(18, 0)), CAST(235000 AS Decimal(18, 0)), N'gà đồi hoà bình.png', N'- Xuất xứ: Hòa Bình
- Đặc điểm: Gà thả đồi tự nhiên nên thịt rất săn chắc, thịt thơm ngon, khi luộc không ra nhiều nước.
- Trọng lượng: ~1,2 - 1,5kg/con', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e732b942-849a-41a8-a0bb-a355b698f65f', 16, N'RC.0015', N'Dưa chuột', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'dưa chuột.png', N'- Xuất xứ: Bắc Hà - Lào Cai
- Đặc điểm: Giòn, nhiều nước, ăn thanh mát
- Trọng lượng: `8 - 12 quả/kg', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'7eae05d8-f357-47b2-8144-a366b4e7b99a', 8, N'RC.0007', N'Su hào', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'su hào.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'943ce432-283b-45cf-a88c-a4ba468c42d2', 15, N'RC.0014', N'Bắp cải', N'kg', CAST(35000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), N'bắp cải.png', N'Bắp cải hay được gọi là cải bắp, là một loại rau chủ lực trong dòng họ Cải, có xuất xứ từ vùng Địa Trung Hải. bắp cải là một thực vật có hoa thuộc nhóm hai lá mầm với các lá tạo thành một cụm đặc hình gần giống như hình cầu.
Trong bắp cải có chứa lượng vitamin cao hơn nhiều so với các loại rau củ khác như: cà rốt, khoai tây, hành tây. Theo nghiên cứu, hàm lượng vitamin A và vitamin P trong bắp cải kết hợp với nhau làm thành mạch máu bền vững hơn.
Trong bắp cải còn chứa các chất chống ung thư như: Sulforaphane, phenethyl isothiocyanate và Indol -33 carbinol.
Theo Đông y, bắp cải vị ngọt, tính hàn, không độc, có tác dụng hòa huyết, thanh nhiệt, thanh phế, trừ đàm thấp, sinh tân, chỉ khát, mát dạ dày, giải độc, lợi tiểu. Bắp cải cũng giúp chống suy nhược thần kinh, giảm đau nhức phòng chống các bệnh ung thư, tim mạch và nhiều loại bệnh khác.
Tuy nhiên cần lưu ý rằng: người bị rối loạn tuyến giáp hoặc bướu cổ thì không nên ăn vì trong bắp cải có chưa một lượng nhỏ goitrin.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e66ddfa5-33d7-4805-ae15-a8e7a3c7104f', 118, N'HQ.0117', N'Lê Tai Nung', N'kg', CAST(89000 AS Decimal(18, 0)), CAST(89000 AS Decimal(18, 0)), N'lê tai nung.png', N'Lê Tai Nung trồng theo đúng quy trình, không phân bón hóa học hay thuốc trừ sâu nên đảm bảo cho nhà các chị nào có cháu nhỏ vẫn thoải mái thưởng thức ạ.
Lê Tai Nung ko ngọt sắc mà có vị thanh mát ngọt nhẹ và chua dịu dịu chắc chắn sẽ thành món khoái khẩu của các bé và gia đình trong mùa hè nóng bức như thế này.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'46d4d0c3-8d1c-4018-9009-aadba742c825', 138, N'HS.0137', N'Cá nhồng', N'0.5 kg', CAST(162000 AS Decimal(18, 0)), CAST(162000 AS Decimal(18, 0)), N'cá nhồng.png', N'- Xuất xứ: Đà Nẵng 
- Cá nhồng đã được rút xương, dễ chế biến, phù hợp với tất cả độ tuổi
- Nạc thịt, ngọt thơm đậm đà
- Được sơ chế sạch, phơi nhẹ một nắng ngay sau khi đánh bắt để giữ được sự tươi ngon tròn vị biển Đà Nẵng', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'c60583c9-9242-4925-81dd-af593ba112db', 68, N'TC.0067', N'Gà ri', N'kg', CAST(245000 AS Decimal(18, 0)), CAST(245000 AS Decimal(18, 0)), N'gà ri.png', N'BÁN GÀ THÌ DỄ, CHỨ NUÔI MỚI TỐN CÔNG
(Gà đạt chuẩn hữu cơ, siêu hiếm tại Việt Nam)
Quả thật là gà bán tại các cửa hàng thì dễ vô cùng, cũng bởi gà đã được làm sạch sẵn, hút chân không rồi nên đâu có khó khăn gì đâu. Nhưng để có được những con gà ngon thơm, chắc thịt thì trong suốt thời gian 7 tháng nuôi mới gọi là tốn công. Tốn công, tốn sức như nào thì nhà mình có thể thấy dưới đây:
✅ Gà này giống Ri, được bắt úm ngay khi 1 ngày tuổi theo tiêu chuẩn hữu cơ PGS được IFOAM công nhận. Gà nuôi bởi nhóm trưởng nhóm Gừa - liên nhóm hữu cơ Lương Sơn thuộc PGS Việt Nam
✅ Gà không nuôi cám công nghiệp, chỉ được phép nuôi bằng ngô, sắn, cám gạo, đậu tương đạt chuẩn hữu cơ do chính nông dân PGS tự trồng.
✅ Gà nuôi đến nay đã 7 tháng, không sử dụng tăng trọng
✅ Tỷ lệ thành phần thức ăn được phối trộn theo hướng dẫn và ép thành viên
✅ Bổ sung vitamin bằng phụ phẩm từ vườn rau hữu cơ và khoáng bằng bột cá được phép mua.
✅ Gà sống thoải mái có sân chơi và nhà trú đạt chuẩn
✅ Gà được trích vacxin theo quy định và không sử dụng kháng sinh
✅ Gà được giết mổ trong nhà mổ do dự án MOAP Hiệp hội NN hữu cơ hỗ trợ để đảm bảo ATVSTP theo quy định
✅ Gà đạt chuẩn hữu cơ PGS được hút chân không và dán tem QR để đảm bảo hàng không bị trà trộn
(Theo nguồn từ Chủ tịch Organic PGS Vietnam)
---
Giống gà đạt chuẩn hữu cơ này Bác Tôm tự tin với cả nhà mình về chất lượng cũng như độ hiếm trên thị trường hiện nay.
🌿 Thịt gà ngọt, chắc, thơm mà chỉ có #245k/kg
🌿 Số lượng có hạn mỗi đàn nên nhà mình đặt sớm giúp em nhé
☎ĐẶT NGAY 0911 008 006
📱Hoặc comment, inbox fanpage để đặt hàng ngay hôm nay.
🛒Website: bactom.com
🚀Miễn phí giao hàng thần tốc (bán kính 5km)
‼CAM KẾT đổi trả nếu hàng không đảm bảo chất lượng trong vòng', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'03ad99e3-9f3b-4388-8ecf-b1e071bbc0a9', 22, N'RC.0021', N'Ngọn su su', N'kg', CAST(28000 AS Decimal(18, 0)), CAST(28000 AS Decimal(18, 0)), N'ngọn su su.png', N'Ngọn su su là phần ngọn non của cây su su. Ngọn su su là thực phẩm giàu folate, chất xơ, chất đồng, chất kẽm và vitamin B, giúp ngăn chặn sự hình thành của homocystein là chất có khả năng gây nên bệnh tim và đột quỵ. Vitamin C, K có trong ngọn su su giúp chống ô xy hóa, loãng xương.
- Đặc điểm: ngọt mềm, chế biến nhiều món hấp dẫn
- Xuất xứ: Bắc Hà - Lào Cai', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e03a5d10-11c7-4d23-a92a-b68d76f97786', 30, N'RC.0029', N'Hoa gừng', N'kg', CAST(65000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), N'hoa gừng.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'dd66b7d1-6983-4665-873f-b94ad3bf818e', 69, N'TC.0068', N'Thịt vi sinh - ba chỉ', N'kg', CAST(244000 AS Decimal(18, 0)), CAST(244000 AS Decimal(18, 0)), N'thịt vi sinh ba chỉ.png', N'', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'bfa611de-6ac1-4741-af3a-be39179b99ab', 105, N'HQ.0104', N'Quýt đường', N'kg', CAST(79000 AS Decimal(18, 0)), CAST(79000 AS Decimal(18, 0)), N'quýt đường.png', N'Quýt đường hữu cơ là loại trái cây thuộc họ cam, được trồng phổ biến ở nhiều tỉnh thành trên khắp cả nước. Đặc điểm của loại cây này là dạng cây gỗ nhỏ, hoa nhỏ màu trắng, trái có dạng tròn, vỏ khá mỏng từ xanh tới vàng, thịt màu cam có vị ngọt đặc trưng. Với hàm lượng dinh dưỡng phong phú có trong trái quýt đường đem lại những lợi ích, khả năng cải thiện sức khỏe hiệu quả cho con người. ', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'f41fa5cd-0095-45aa-927d-c1cf50eea513', 35, N'RC.0034', N'Mùi tàu', N'kg', CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), N'mùi tàu.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'b376ec51-5964-4146-b400-c40460325f35', 83, N'TC.0082', N'Cá lăng cắt khúc', N'kg', CAST(315000 AS Decimal(18, 0)), CAST(315000 AS Decimal(18, 0)), N'cá lăng cắt khúc.png', N'Cá lăng thuộc dòng cá da trơn có kích thước tương đối lớn thường sinh sống ở các vùng nước ngọt hoặc nước lợ nhạt như ao hồ, sông, suối. Cá lăng thường sống ở phía dưới tầng đáy, khu vực nhiều bùn nhiều phù sa, nước chảy chậm
Cá Lăng có tính bình, vị ngọt. Thịt cá mềm, thơm ngon, ít xương dăm, giàu chất dinh dưỡng
Cá lăng có thể chế biến các món như: chả cá, nem cá lăng, nướng, hấp hoặc làm lẩu đều rất hấp dẫn', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'eddcb9d0-2007-4260-bc29-c786eaf85796', 95, N'HQ.0094', N'Ổi Phúc Lợi', N'kg', CAST(55000 AS Decimal(18, 0)), CAST(55000 AS Decimal(18, 0)), N'ổi phúc lợi.png', N'Xuất xứ: Phúc Lợi, Long Biên, Hà Nội
Đặc điểm: Quả đều, đẹp, mịn.
Mùi vị: Ngọt, giòn', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'3e9b9c8f-e2bb-4372-8674-c84c8c0ea097', 78, N'TC.0077', N'Thịt sạch - ba chỉ', N'kg', CAST(216000 AS Decimal(18, 0)), CAST(216000 AS Decimal(18, 0)), N'thịt sạch ba chỉ.png', N'', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'9b87fdab-2dab-45bd-addc-ca3d3886517c', 37, N'RC.0036', N'Tỏi tây', N'kg', CAST(45000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), N'tỏi tây.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'58dcf9bb-9f32-4629-9d1c-cb2718d63293', 21, N'RC.0020', N'Bí đỏ', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'bí đỏ.png', N'- Xuất xứ: Bắc Hà - Lào Cai
- Đặc điểm: Ngọt, ăn rất bùi
- Trọng lượng: 1- 2kg', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'2b7884ce-b5eb-4187-b417-cc3bba44ee9d', 145, N'HS.0144', N'Cua thịt Năm Căm', N'kg', CAST(615000 AS Decimal(18, 0)), CAST(615000 AS Decimal(18, 0)), N'cua thịt năm căn.png', N'Cua thịt Năm Căn là một loài đặc sản tuyệt vời, quà tặng từ thiên nhiên mang đến cho con người. Cua Năm Căn được xem loại cua là ngon nhất nước. Thịt cua vừa thơm, vừa ngọt, không quá béo, bùi, chắc nịch. Còn gạch cua béo ngậy, ngây ngất đầu lưỡi. Người Cà Mau tự hào có được đặc sản cua biển để tiếp đón khách quý, hay làm quà mỗi khi thăm viếng người thân ở các tỉnh, thành khác.
Từng chú cua được lựa chọn kỹ càng trước khi đưa đến tay người tiêu dùng, chúng tôi cam kết sản phẩm hoàn toàn tự nhiên và chất lượng được đảm bảo ở mức độ cao nhất.', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'5023be57-3b6e-438a-8395-cc76330e9daf', 147, N'HS.0146', N'Cá chim trắng Phú Quý', N'kg', CAST(675000 AS Decimal(18, 0)), CAST(675000 AS Decimal(18, 0)), N'cá chim trắng phú quý.png', N'- Xuất xứ: Phú Quý - Bình Thuận
- Cá chim trắng là loại cá hiếm thấy ở vùng biển Phú Quý. Thịt cá chim trắng ngon, giàu dưỡng chất, cực kì giàu omega 3 và khoáng chất. Cá ăn được cả vây, ít xương, thơm và béo ngậy.', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e03f9e8e-7319-4eee-b668-cd127096cb20', 45, N'RC.0044', N'Rau mùi', N'kg', CAST(8500 AS Decimal(18, 0)), CAST(8500 AS Decimal(18, 0)), N'rau mùi.png', N'- Xuất xứ: Bắc Hà - Lào Cai
- Rau mùi là loại gia vị quen thuộc trong các món ăn của người Việt bởi hương thơm và độ hợp vị trong các món ăn.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'4ce78636-4214-4054-a8f1-d0ef620d5658', 93, N'TC.0092', N'Lươn đồng tách xương', N'kg', CAST(315000 AS Decimal(18, 0)), CAST(315000 AS Decimal(18, 0)), N'lươn đồng tách xương.png', N'Lươn đồng Đô Lương (Nghệ An) được bắt tự nhiên, không dùng điện. Lươn là thực phẩm bổ dưỡng, trong 100g thịt lươn là 18.7g đạm, 0.9g chất béo, 150mg chất lân, 39mg chất can xi, 1.6mg chất sắt và nhiều nguyên tố vi lượng khác. Lươn cũng được đánh giá ở vị trí thứ 5 trong các loại thực phẩm ...
Xuất xứ : - Nghệ An', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'58312f94-8f6b-42d6-b48f-d271b8f714a1', 76, N'TC.0075', N'Thịt quế - chân giò', N'kg', CAST(230000 AS Decimal(18, 0)), CAST(230000 AS Decimal(18, 0)), N'thịt quế chân giò.png', N'', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'acd40bc5-cc77-4e49-9c39-d2e145e4d860', 143, N'HS.0142', N'Cá thát lát rút xương', N'kg', CAST(320000 AS Decimal(18, 0)), CAST(320000 AS Decimal(18, 0)), N'cá thát lát rút xương.png', N'Cá thát lát rút xương là kỹ thuật lọc và rút hết xương bên trong thịt cá, xử lý thịt với gia vị thơm ngon, tạo nên một sản phẩm mới lạ mà vô cùng tiện dụng và an toàn.', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'cb48e29e-a738-4739-bc63-d4265c5d3780', 46, N'RC.0045', N'Rau ngót', N'kg', CAST(49000 AS Decimal(18, 0)), CAST(49000 AS Decimal(18, 0)), N'rau ngót.png', N'- Xuất xứ: Bắc Hà - Lào Cai
Rau ngót là loại rau quen thuộc đối với người Việt chúng ta.  Lá cây rau ngót hình bầu dục, mọc so le; sắc lá màu lục thẫm. Khi hái ăn, chọn lá non.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'38069970-d7c8-4261-8e76-d6969600202e', 19, N'RC.0018', N'Khoai tây', N'kg', CAST(35000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), N'khoai tây.png', N'Xuất xứ : - Đà Lạt
Khoai tây bở, thơm, dùng nấu canh xương, súp hay chiên đều ngon', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'a35fd05f-6083-4256-aa8e-d7a66ca7c6dd', 151, N'HS.0150', N'Tôm bạc', N'kg', CAST(420000 AS Decimal(18, 0)), CAST(420000 AS Decimal(18, 0)), N'tôm bạc.png', N'', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'00d39248-27b2-48e8-a590-d7bdef0a52e2', 10, N'RC.0009', N'Quả lặc lày', N'100g', CAST(3200 AS Decimal(18, 0)), CAST(3200 AS Decimal(18, 0)), N'lặc lày.png', N'Giàu vitamin, khoáng chất và chất xơ, lặc lày mang lại một số lợi ích sức khỏe, rất tốt cho tóc và da của bạn. 
Lặc lày ăn vị ngọt, rất mát, thường sử dụng để luộc, xào với thịt.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e4f9cd96-a1e6-4a8c-a2b3-dbc06c5e0e69', 36, N'RC.0035', N'Thì là', N'kg', CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), N'thì là.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'd0bffd7e-d445-440b-a0d1-de61edb2c318', 24, N'RC.0023', N'Bí xanh', N'kg', CAST(35000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), N'bí xanh.png', N'Bí xanh còn gọi là bí đao, bí phấn, đông qua, bạch qua, chẩm qua… Đây thực phẩm quen thuộc trong bữa ăn hằng ngày này rất tốt cho sức khỏe, nó có tác dụng thanh nhiệt làm mát ruột, giúp da đẹp dáng thon. Thành phần chủ yếu của bí là nước, nhiều chất xơ, không chứa lipid. Cứ 100g bí có 0,4g protid, 2,4g glucid, 19 mg canxi, 12mg phosphor, 0,3mg sắt, nhiều loại vitamin (A, B1, B2, B3, B9, C, E… và khoáng chất như kali, photpho, magie…) Ngoài ra, bí xanh còn được xem là một trong những loại thuốc có tác dụng chữa được nhiều bệnh như hen suyễn, ho gà, ngộ độc, ung thư họng, ung nhọt… Theo y học cổ truyền, bí xanh vị ngọt nhạt, tính mát, có công dụng thanh nhiệt, giải nhiệt và làm tan đờm, làm mát ruột và hết khát, lợi tiểu, làm hết phù, giải độc và giảm béo. Thường được dùng để chữa các chứng bệnh lý hô hấp có ho và khạc đờm do nhiệt, bệnh đái đường, phù do bệnh thận, bệnh gan, phù khi mang thai…', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'71f493e9-e838-45a5-9bee-deb4141829e7', 94, N'TC.0093', N'Xương cục lơn giun quế', N'kg', CAST(135000 AS Decimal(18, 0)), CAST(135000 AS Decimal(18, 0)), N'xương cục lơn giun quế.png', N'Xương Cục Lợn là nguyên liệu không thể thiếu trong các nồi nước dùng nhằm tạo nên hương vị ngon ngọt tự nhiên.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'b9e4aa38-e219-43ac-a0b2-df3112b509bb', 29, N'RC.0028', N'Hoa thiên lý', N'kg', CAST(15000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), N'hoa thiên lý.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'59dc8d72-275f-40e3-92d0-dfbffba7f19c', 74, N'TC.0073', N'Chả rươi 200gr', N'200g', CAST(175000 AS Decimal(18, 0)), CAST(175000 AS Decimal(18, 0)), N'chả rươi 200gr.png', N' CHẢ RƯƠI - ĐẶC SẢN KHÔNG PHẢI AI CŨNG DÁM THỬ
Những chú rươi mềm mềm, xanh xanh đỏ đỏ như những chú sâu thực sự khiến nhiều người sợ đặc biệt là chị em (cứ như có nhiều người không ngửi được mùi sầu í ạ) . Nhưng nếu đã lỡ " nhắm mắt đưa chân" để thử thì đảm bảo mê tít
 Vì sợ nên ai cũng ngại đưa các bạn rươi về mân mê chế biến. Vậy thì Bác Tôm chia sẻ bớt nổi khổ tâm này nhé để gia đình mình không lỡ món ngon : Chả rươi làm sẵn - chuẩn bị chả rươi Tứ Kỳ nhé
Từ bàn tay khéo léo cùng các nguyên liệu sẵn có : rươi tươi được sơ chế làm sạch lông bằng nước ấm , thịt nạc xay, trứng gà, tiêu, muối cùng một số gia vị (hành lá, thì là, vỏ quýt hôi bằm nhuyễn) đã làm nên những miếng chả rươi tròn trịa , ngon và đẹp mắt. Kỳ công tẩn mẩn lắm và khi chiên lên miếng chả rươi thơm lừng
Mùi rươi, quýt thơm đến ứa nước miếng. Khi ấy, đưa miếng chả lên miệng cắn rồi nhai để vị ngon ngọt, thơm lan trong khoang miệng thì có lẽ ta chẳng còn cần thêm của ngon, vật lạ nào hơn nữa.
 Chả rươi - món đặc sản không phải ai cũng dám nếm nhưng ăn rất dễ nghiện.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'3cd7b15f-98fb-4ed2-917a-e0185536f701', 66, N'TC.0065', N'Mỡ phần lợn quế', N'kg', CAST(124000 AS Decimal(18, 0)), CAST(124000 AS Decimal(18, 0)), N'mỡ phần lơn quế.png', N'MỠ PHẦN LỢN QUẾ
Mỡ heo quế giòn và có độ chảy không cao nên là lựa chọn hoàn hảo cho các món xào, rán. Hương vị mỡ lợn sẽ phần nào đó làm kích thích vị giác trong các món ăn hơn so với các loại dầu thực vật hiện nay. Hơn nữa, tóp mỡ cũng là một món khoái khẩu cho các thực khách nhớ về những năm trước đây.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'fbccfd15-606d-49e9-a311-e08327f70f21', 110, N'HQ.0109', N'Măng cụt Bảo Lộc', N'kg', CAST(130000 AS Decimal(18, 0)), CAST(130000 AS Decimal(18, 0)), N'măng cụt bảo lộc.png', N'Lang thang khắp các tỉnh đồng bằng sông Cửu Long để đến với “vương quốc hoa quả” Bến Tre. Dù bạt ngàn các loại trái cây đủ sắc màu, nhưng Bác Tôm cũng phải dừng chân lại tại vườn măng cụt để thưởng thức hương vị ngọt thanh mát của măng cụt nơi đây.
Không phải ngẫu nhiên mà măng cụt được ví là “Nữ hoàng của các loại trái cây”. Từ hàng trăm năm trước, người ta biết đến măng cụt như một loại trái cây quý, ngoài hương vị thơm ngon, thanh mát, dinh dưỡng tới sức khỏe con người, măng cụt còn là một dược liệu quý giá.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'93a19c11-38c1-4535-bef9-e181c4a4aba2', 70, N'TC.0069', N'Thịt sạch - nạc vai', N'kg', CAST(220000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), N'thịt sạch nạc vai.png', N'', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'a4ba2004-1bd3-4644-a022-e26bf06a5a7b', 140, N'HS.0139', N'Cua gạch Năm Căn', N'kg', CAST(680000 AS Decimal(18, 0)), CAST(680000 AS Decimal(18, 0)), N'cua gạch năm căn.png', N'Cua Cà Mau hầu hết được nuôi thâm canh theo hướng tự nhiên, sinh thái trong các vuông tôm, kết hợp với rừng và các loài thủy sản khác. Đặc biệt, huyện Năm Căn là vùng ven biển, có hệ sinh thái đa dạng nên đất và nước màu mỡ. Bên cạnh đó, môi trường khí hậu ổn định nên tạo được lượng thức ăn tự nhiên dồi dào cho con cua phát triển nhanh, thịt cua ngon hơn những vùng khác.
Từng chú cua được lựa chọn kỹ càng trước khi đưa đến tay người tiêu dùng, chúng tôi cam kết sản phẩm hoàn toàn tự nhiên và chất lượng được đảm bảo ở mức độ cao nhất.
Cua gạch Năm Căn: gạch son đầy, thịt chắc, ngon, ngọt', 1, 1000, N'1617b0b1-3e63-442e-87a5-d1388f1db53f', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'f0820da3-5a28-4369-806c-e3b13f5d8d4f', 119, N'HQ.0118', N'Táo Envy', N'kg', CAST(250000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), N'táo envy size to.png', N'', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'd3dd9cb2-ea67-47c9-bae9-e4b7d99bd320', 97, N'HQ.0096', N'Cam xoàn', N'kg', CAST(77000 AS Decimal(18, 0)), CAST(77000 AS Decimal(18, 0)), N'cam xoàn.png', N'Cam Xoàn được rất nhiều chị em phụ nữ, cũng như trẻ em yêu thích bởi vị thơm rất đặc trưng, vỏ mỏng, nhiều nước, ít hạt khác hẳn với các loại cam khác. Hơn nữa, đây là giống cam có hàm lượng vitamin C và liminoid rất cao giúp cơ thể tăng cường thể lực, hỗ trợ quá trình tiêu hóa, tăng thị lực và giảm nguy cơ mắc bệnh tim mạch.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ed72f7ff-a8c7-4090-a291-e791e6ba6fb8', 43, N'RC.0042', N'Ớt chuông vàng Đà Lạt', N'kg', CAST(85000 AS Decimal(18, 0)), CAST(85000 AS Decimal(18, 0)), N'ớt chuông vàng đà lạt.png', N'Ớt Chuông có nhiều màu như xanh, đỏ, cam, vàng, thân tròn như quả chuông, hương thơm, vị rất giòn ngọt, ít hăng.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'db2d8373-1a28-4df0-8a46-e98826fa0de1', 96, N'HQ.0095', N'Chuối Viba', N'kg', CAST(22000 AS Decimal(18, 0)), CAST(22000 AS Decimal(18, 0)), N'chuối viba.png', N'Chuối Viba được trồng theo tiêu chuẩn VietGap, là giống chuối tiêu hồng ăn thơm ngon, ngọt quanh năm
Xuất xứ: - Viba
Chất lượng: - Ngọt, thơm
Cách dùng: - Ăn tươi, làm bánh', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'cfcb7e3d-4091-4647-811e-ec30106ce4dd', 121, N'HQ.0120', N'Dưa lưới Chu Phấn', N'kg', CAST(70000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), N'dưa lưới chu phấn.png', N'Dưa được trồng trong nhà màng theo quy trình công nghệ cao được chuyển giao bởi viện Khoa học nông nghiệp duyên hải Nam Trung Bộ. Trồng tại Farm Nhơn Phú – Quy Nhơn – Bình Định , đất cát và nắng gió nên độ brix cao hơn bình thường đạt trên 16.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'1243dd51-d3bf-4787-9bd5-f13e4bf6878a', 59, N'TC.0058', N'Cá chép đầm', N'kg', CAST(138000 AS Decimal(18, 0)), CAST(138000 AS Decimal(18, 0)), N'cá chép đầm.png', N'Cá Chép - một món ngon, thông dụng và khó cưỡng đối với bất kỳ một người yêu thích những món thủy hải sản nào. Cá chép tại Bác Tôm được nhập trực tiếp từ những đầm tại Hòa Bình, luôn đảm bảo tươi ngon, thịt chắc, ngọt, và thơm khi nấu.
Trong cá chép có rất nhiều thành phần mà cơ thể con người cần được đáp ứng như: protein amino acid, chất xơ tốt, nhiều đạm. Ngoài ra cá chép chứa một lượng lớn các axit béo không bão hòa đa omega 3, trong đó Eicosapentaenoic acid (EPA) giúp làm giảm chất béo trong máu, chống ung thư, giảm xơ vữa động mạch.


', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'3ac9e155-32dd-47ff-a10f-f38484ab7dcb', 9, N'RC.0008', N'Cải ngồng', N'kg', CAST(32000 AS Decimal(18, 0)), CAST(32000 AS Decimal(18, 0)), N'cải ngồng.png', N'Thêm một loại rau nữa mà bạn không nên bỏ qua trong khu vườn nhỏ xinh của mình, đó là cải ngồng. Loại cải này khá dễ ăn, rất nhiều người “ghiền” món canh cải ngồng, cải ngồng xào. Không chỉ có vậy cải ngồng còn cung cấp nhiều dưỡng chất thiết yếu cho cơ thể.Cũng giống như một số loại cải khác, giống cải ngồng cao sản có khả năng kháng bệnh tốt. Không chỉ có vậy, nó còn được trồng vào bất kỳ thời điểm nào trong năm, rất phù hợp với điều kiện khí hậu nước ta. Trong cải ngồng có chứa nhiều vitamin A, B, C, K ,..
Tác dụng của cải ngồng mang lại:
Làm đẹp da
Làm sáng mắt
Hỗ trợ tiêu hóa', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'662a2a61-0678-4c98-8682-f428126354fa', 87, N'TC.0086', N'Lương đồng Nghệ An', N'kg', CAST(315000 AS Decimal(18, 0)), CAST(315000 AS Decimal(18, 0)), N'lươn đồng nghệ an.png', N'Lươn đồng Nghệ An là một thực phẩm từ xưa đã nổi tiếng khắp cả nước, khi ăn bất kể món lươn nào người ta cũng nhớ đến là xứ Nghệ, cũng bởi vì xứ Nghệ là xứ sở của lươn.
Lươn là loài thủy sản nước ngọt, thân tròn, da trơn, màu nâu vàng và thường sống rúc trong bùn. Lươn còn có tên gọi khác là “Sâm động vật dưới nước”. Đặc biệt, đây là loại lươn đồng chính hiệu, được người dân xứ Nghệ đánh bắt từ ruộng thông qua đặt trúm, rồi sau đó sơ chế chỉ giữ lại phần thịt.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'33e7b7da-5bcb-4aec-bf80-f4453118d26e', 39, N'RC.0038', N'Xà lách', N'kg', CAST(65000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), N'xà lách.png', N'', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'fa7ce944-0858-47ec-8f1e-f70ff5523a5b', 53, N'RC.0052', N'Khoai môn', N'kg', CAST(60000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), N'khoai môn.png', N'Khoai môn có thể cung cấp các chất như đạm, tinh bột, chất xơ, kali, các loại vitamin A, C, B, E… cho cơ thể, giúp chống lại các chất gây lão hóa, làm gia tăng thị lực, tăng cường sức đề kháng, nhuận tràng. Chỉ 100g khoai môn có thể cung cấp tới 109 kcal với một lượng dinh dưỡng phong phú cùng vitamin nhiều hơn cả rau xanh và hoa quả.
Ngoài khả năng chữa và ngăn ngừa các căn bệnh như bệnh thận, tim mạch, khớp, u hạch, tiểu đường…, khoai môn còn giúp chúng ta kiểm soát trọng lượng cơ thể, cải thiện sự vận động của đường ruột, vì thế rất có hiệu quả trong việc giảm cân. Ngoài ra, nó cũng có khả năng chống oxy hóa rất cao.

', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'8d58960e-c4bf-48d7-8ff3-f7b684ccac20', 3, N'RC.0002', N'Đậu trạch', N'kg', CAST(35000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), N'đậu trạch.png', N'', 1, 10000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'37234f99-80e8-4575-a600-f909ba6fe9a7', 82, N'TC.0081', N'Cá bống đục', N'kg', CAST(260000 AS Decimal(18, 0)), CAST(260000 AS Decimal(18, 0)), N'cá bống đục.png', N'Cá bống biển có hương vị thơm ngon không kém loại cá bống nước ngọt và cũng được dùng để chế biến các món ăn tương tự. Nếu bạn đã một lần thử qua thì chắc chắn sẽ rất thích cá bống đục.', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'96848913-1bbf-40d6-8fb2-f96ae7577378', 101, N'HQ.0100', N'Đu đủ', N'kg', CAST(42000 AS Decimal(18, 0)), CAST(42000 AS Decimal(18, 0)), N'đu đủ.png', N'Được trồng theo phương pháp hữu cơ nên đu đủ tại Bác Tôm luôn đảm bảo an toàn nhất. Theo đó, sản phẩm đu đủ không sử dụng thuốc bảo vệ thực vật, không thuốc kích thích tăng trưởng và được chăm sóc theo đúng quy trình từ khi ươm giống cây.
Đu đủ từ lâu đã được biết đến như “thần dược” trong các loại trái cây. Trong đu đủ, lượng beta caroten nhiều hơn trong các rau quả khác, đây là một loại vi chất dinh dưỡng có vai trò là chống oxy hoá mạnh giúp chống lại một số căn bệnh ung thư, chống khô mắt, khô da và có tác dụng nhuận tràng. Trong 100g đu đủ chín chứa 2.100 mcg beta caroten. Đu đủ có thể cung cấp cho cơ thể các loại vitamin thiết yếu như vitamin A và vitamin C.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'c27e0739-6e7d-486b-9924-fb232ad5c787', 122, N'HQ.0121', N'Sầu riêng Dona', N'kg', CAST(155000 AS Decimal(18, 0)), CAST(155000 AS Decimal(18, 0)), N'sầu riêng dona.png', N'Mỗi giống sầu riêng đều có hình dạng, màu sắc và hương vị khác nhau. Nhưng đối với những người yêu thích sầu riêng thì không ai không biết đến quả sầu riêng Dona với hương vị ngọt đậm, thơm nức và hình dáng bắt mắt. Cũng chính vì được ưu chuông như vậy nên sản lượng ngày càng tăng, đồng thời chất lượng vẫn được đảm bảo.
Sầu riêng Dona (hay còn gọi là sầu riêng Thái) có hình dạng tương đối tròn đều, vỏ mỏng, gai nhỏ, thịt quả ngọt và mọng. Mọi người cũng có thể nhận thấy khi quả chín có màu xanh bóng, rãnh múi nhìn thấy rõ, cơm dày và màu vàng đậm, hạt lép. Đặc biệt, khi ăn có vị béo ngậy, thơm ngọt mà ít có loại trái cây nào có thể sánh bằng.', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'b0e348cb-7c15-432b-b7e6-fbc4bdae3917', 100, N'HQ.0099', N'Dứa Queen', N'kg', CAST(22000 AS Decimal(18, 0)), CAST(22000 AS Decimal(18, 0)), N'dứa queen.png', N'- Xuất xứ: Nông Trường Hà Trung - Thanh Hóa
- Đặc điểm: Vị ngọt đậm, mọng nước, hương thơm đặc biệt
- Trọng lượng: 0,8 - 1kg/quả', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'02f3a434-d99e-4658-9343-fbe128650670', 4, N'RC.0003', N'Rau dền', N'100g', CAST(35000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), N'rau dền.png', N'Rau dền là một những loại rau có rất nhiều lợi ích cho cơ thể.
Ngăn ngừa ung thư
Các hợp chất chống oxy hóa như vitamin E, C, sắt, magiê, phốt pho hay lysine có trong rau dền sẽ chống lại các gốc tự do có hại và ngăn chặn sự hình thành của các tế bào ác tính gây ra ung thư.
Giảm cholesterol
Một trong những lợi ích chính của lá rau dền là khả năng làm giảm cholesterol. Ngoài ra, tocotrienols, một loại vitamin E, trong rau giúp làm giảm cholesterol xấu (LDL) và ngăn ngừa bệnh tim mạch vành.', 1, 1000, N'5662f102-5a56-4a58-a4d9-89feb579ec56', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'736f0232-cfdf-4665-8825-fec3119628fc', 79, N'TC.0078', N'Thịt sạch - sườn', N'kg', CAST(235000 AS Decimal(18, 0)), CAST(235000 AS Decimal(18, 0)), N'thịt sạch sườn.png', N'', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'541c617d-0316-4df9-81e1-ff47e1c04d8a', 85, N'TC.0084', N'Cá quả nguyên con', N'kg', CAST(275000 AS Decimal(18, 0)), CAST(275000 AS Decimal(18, 0)), N'cá quả nguyên con.png', N'', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'96132d52-18c9-4f61-9ee0-ff974d61bcb3', 106, N'HQ.0105', N'Dưa hấu không hạt', N'kg', CAST(31000 AS Decimal(18, 0)), CAST(31000 AS Decimal(18, 0)), N'dưa hấu không hạt.png', N'', 1, 1000, N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [MaOrder], [MaSo], [Ten], [DonViTinh], [GiaTien], [GiaKhuyenMai], [HinhAnh], [MoTa], [CoSan], [SoLuong], [IDTheLoai], [SoLuotXem], [SoLuotMua], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'633ff790-58d9-4209-8e1c-fff67182c336', 67, N'TC.0066', N'Giò sống lợn quế', N'kg', CAST(295000 AS Decimal(18, 0)), CAST(295000 AS Decimal(18, 0)), N'giò sống lợn quế.png', N'GIÒ SỐNG LỢN QUẾ
Chọn lọc từ những phần thịt nạc ngon nhất của lợn quế sau đó được xay nhuyễn. Với giò sống khách hàng có thể chế biến đa dạng các món như: Canh bí đao nấm mọc, trứng cút bọc giò sống, bún sườn mọc nấu măng...', 1, 1000, N'0aa315a2-1250-40fa-93c4-c1c164dbad00', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[TheLoai] ([IDTheLoai], [MaSo], [Ten], [MoTa]) VALUES (N'1105af02-3bca-448f-8517-10350ff5efa6', N'SC', N'Đồ sơ chế', N'')
INSERT [dbo].[TheLoai] ([IDTheLoai], [MaSo], [Ten], [MoTa]) VALUES (N'5662f102-5a56-4a58-a4d9-89feb579ec56', N'RC', N'Rau củ', N'')
INSERT [dbo].[TheLoai] ([IDTheLoai], [MaSo], [Ten], [MoTa]) VALUES (N'24e6e491-d7f6-4760-bac9-b7b82d391a9c', N'HQ', N'Trái cây', N'')
INSERT [dbo].[TheLoai] ([IDTheLoai], [MaSo], [Ten], [MoTa]) VALUES (N'0aa315a2-1250-40fa-93c4-c1c164dbad00', N'TC', N'Thịt cá', N'')
INSERT [dbo].[TheLoai] ([IDTheLoai], [MaSo], [Ten], [MoTa]) VALUES (N'1617b0b1-3e63-442e-87a5-d1388f1db53f', N'HS', N'Hải sản', N'')
INSERT [dbo].[TheLoai] ([IDTheLoai], [MaSo], [Ten], [MoTa]) VALUES (N'22e2086a-5417-422d-99a8-f288c51930cc', N'HK', N'Hàng khô', N'')
INSERT [dbo].[TrangThai] ([IDTrangThai], [TenTrangThai]) VALUES (N'3240c2e6-fc6c-4feb-9313-382bd05cf522', N'Đang giao hàng')
INSERT [dbo].[TrangThai] ([IDTrangThai], [TenTrangThai]) VALUES (N'e970c371-b124-49a4-ae54-781f8f848797', N'Đã nhận hàng')
INSERT [dbo].[TrangThai] ([IDTrangThai], [TenTrangThai]) VALUES (N'5404ec28-c908-48b1-a7e5-e5a366b51d5a', N'Chờ xác nhận')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SanPham__2725087CE89C0669]    Script Date: 2021-02-25 2:10:22 PM ******/
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [UQ__SanPham__2725087CE89C0669] UNIQUE NONCLUSTERED 
(
	[MaSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([IDDonHang])
REFERENCES [dbo].[DonHang] ([IDDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_KhachHang]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap] FOREIGN KEY([IDHoaDonNhap])
REFERENCES [dbo].[HoaDonNhap] ([IDHoaDonNhap])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_PhuongThucThanhToan] FOREIGN KEY([IDPhuongThucThanhToan])
REFERENCES [dbo].[PhuongThucThanhToan] ([IDPhuongThucThanhToan])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_PhuongThucThanhToan]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TrangThai] FOREIGN KEY([IDTrangThai])
REFERENCES [dbo].[TrangThai] ([IDTrangThai])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TrangThai]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhaCungCap1] FOREIGN KEY([IDNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([IDNhaCungCap])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhaCungCap1]
GO
ALTER TABLE [dbo].[MaGiamGiaKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_MaGiamGiaKhachHang_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[MaGiamGiaKhachHang] CHECK CONSTRAINT [FK_MaGiamGiaKhachHang_KhachHang]
GO
ALTER TABLE [dbo].[MaGiamGiaKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_MaGiamGiaKhachHang_MaGiamGia] FOREIGN KEY([IDMaGiamGia])
REFERENCES [dbo].[MaGiamGia] ([IDMaGiamGia])
GO
ALTER TABLE [dbo].[MaGiamGiaKhachHang] CHECK CONSTRAINT [FK_MaGiamGiaKhachHang_MaGiamGia]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_LoaiKhachHang] FOREIGN KEY([IDLoaiKhachHang])
REFERENCES [dbo].[PhanLoaiKhachHang] ([IDLoaiKhachHang])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_KhachHang_LoaiKhachHang]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_LoaiNguoiDung] FOREIGN KEY([IDLoaiNguoiDung])
REFERENCES [dbo].[LoaiNguoiDung] ([IDLoaiNguoiDung])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_LoaiNguoiDung]
GO
ALTER TABLE [dbo].[NhaCungCapSanPham]  WITH CHECK ADD  CONSTRAINT [FK_NhaCungCapSanPham_NhaCungCap] FOREIGN KEY([IDNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([IDNhaCungCap])
GO
ALTER TABLE [dbo].[NhaCungCapSanPham] CHECK CONSTRAINT [FK_NhaCungCapSanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[NhaCungCapSanPham]  WITH CHECK ADD  CONSTRAINT [FK_NhaCungCapSanPham_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[NhaCungCapSanPham] CHECK CONSTRAINT [FK_NhaCungCapSanPham_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_TheLoai] FOREIGN KEY([IDTheLoai])
REFERENCES [dbo].[TheLoai] ([IDTheLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_TheLoai]
GO
ALTER TABLE [dbo].[TKThanhToanNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NganHangKhachHang_KhachHang] FOREIGN KEY([IDNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[TKThanhToanNguoiDung] CHECK CONSTRAINT [FK_NganHangKhachHang_KhachHang]
GO
ALTER TABLE [dbo].[TKThanhToanNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NganHangKhachHang_NganHang] FOREIGN KEY([IDTaiKhoan])
REFERENCES [dbo].[TaiKhoanThanhToan] ([IDTaiKhoan])
GO
ALTER TABLE [dbo].[TKThanhToanNguoiDung] CHECK CONSTRAINT [FK_NganHangKhachHang_NganHang]
GO
USE [master]
GO
ALTER DATABASE [FreshFoodHTH] SET  READ_WRITE 
GO
