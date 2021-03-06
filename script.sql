USE [master]
GO
/****** Object:  Database [ShopBD]    Script Date: 4/28/2022 15:30:02 ******/
CREATE DATABASE [ShopBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopBD] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopBD] SET  MULTI_USER 
GO
ALTER DATABASE [ShopBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopBD', N'ON'
GO
ALTER DATABASE [ShopBD] SET QUERY_STORE = OFF
GO
USE [ShopBD]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 4/28/2022 15:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/28/2022 15:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[isActive] [bit] NOT NULL,
	[ManufactureID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 4/28/2022 15:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientSeviceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 4/28/2022 15:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [bigint] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/28/2022 15:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (1, N'76', CAST(N'2017-02-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (2, N'Airline', CAST(N'2016-03-26' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (3, N'Airtex', CAST(N'2015-10-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (4, N'ALСA', CAST(N'2016-10-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (5, N'ASHIKA', CAST(N'2018-06-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (6, N'Automega', CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (7, N'Bendix', CAST(N'2015-04-25' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (8, N'Benson', CAST(N'2015-04-09' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (9, N'BILSTEIN', CAST(N'2018-03-06' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (10, N'BOGE', CAST(N'2016-01-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (11, N'BOSCH', CAST(N'2017-06-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (12, N'Castrol', CAST(N'2015-04-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (13, N'Elf', CAST(N'2016-10-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (14, N'Ferodo', CAST(N'2015-08-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (15, N'Ford', CAST(N'2016-10-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (16, N'General Motors', CAST(N'2016-10-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (17, N'Glaser', CAST(N'2015-12-29' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (18, N'Goodyear', CAST(N'2015-12-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (19, N'Honda', CAST(N'2016-06-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (20, N'Hyundai/Kia', CAST(N'2016-01-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (21, N'Idemitsu', CAST(N'2018-01-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (22, N'KASHIYAMA', CAST(N'2015-10-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (23, N'Kayaba', CAST(N'2016-02-08' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (24, N'King Bearings', CAST(N'2016-09-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (25, N'Lemforder', CAST(N'2016-11-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (26, N'Liqui Moly', CAST(N'2015-03-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (27, N'LUK', CAST(N'2015-12-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (28, N'Lukoil', CAST(N'2017-12-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (29, N'Magneti Marelli', CAST(N'2017-05-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (30, N'Mando', CAST(N'2015-03-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (31, N'Mazda', CAST(N'2018-01-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (32, N'Mercedes', CAST(N'2016-03-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (33, N'Mitsubishi', CAST(N'2017-04-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (34, N'Mobil', CAST(N'2016-10-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (35, N'Motul', CAST(N'2018-01-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (36, N'Nissan', CAST(N'2015-01-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (37, N'Opel', CAST(N'2015-03-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (38, N'OPTIMAL', CAST(N'2016-08-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (39, N'Petro-Canada', CAST(N'2017-03-22' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (40, N'Pierburg', CAST(N'2017-01-10' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (41, N'Profix', CAST(N'2017-10-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (42, N'Shell', CAST(N'2016-11-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (43, N'Stels', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (44, N'Suzuki', CAST(N'2017-05-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (45, N'Total', CAST(N'2015-03-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (46, N'Toyota', CAST(N'2016-06-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (47, N'VAG', CAST(N'2018-05-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (48, N'Zekkert', CAST(N'2018-03-08' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (49, N'ZIC', CAST(N'2015-02-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (50, N'ZIMMERMANN', CAST(N'2017-12-14' AS Date))
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (1, N'Жилет светоотражающий взрослый ARW-AV-02', 150.0000, N'Описание отсутствует', N'C:\Товары автосервиса\D4D0CE67.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (3, N'Моторное масло 75 08880-803ENGINE OIL-GO', 1630.0000, N'Описание отсутствует', N'C:\Товары автосервиса\0070C563.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (5, N'Моторное масло 76 Top Tec 420061', 3440.0000, N'Описание отсутствует', N'C:\Товары автосервиса\03D096CB.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (6, N'Моторное масло 8100 X-CESS 102870', 3190.0000, N'Описание отсутствует', N'C:\Товары автосервиса\E9308929.jpg', 1, 35)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (7, N'Моторное масло Dexos 2 19 42 000', 1410.0000, N'Описание отсутствует', N'C:\Товары автосервиса\2390848B.jpg', 1, 37)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (8, N'Моторное масло Dexos 2 19 42 002', 1300.0000, N'Описание отсутствует', N'C:\Товары автосервиса\23F0848B.jpg', 1, 37)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (9, N'Моторное масло Dexos 2 19 42 003', 1490.0000, N'Описание отсутствует', N'C:\Товары автосервиса\8430842A.jpg', 1, 37)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (10, N'Моторное масло Dexos 2 93165554', 1380.0000, N'Описание отсутствует', N'C:\Товары автосервиса\45008C52.jpg', 1, 16)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (11, N'Моторное масло Dexos 2 93165556', 1340.0000, N'Описание отсутствует', NULL, 1, 16)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (12, N'Моторное масло Dexos 2 93165557', 1500.0000, N'Описание отсутствует', N'C:\Товары автосервиса\45908C52.jpg', 1, 16)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (13, N'Моторное масло Dexos 2 95599405', 1410.0000, N'Описание отсутствует', N'C:\Товары автосервиса\AD00B713.jpg', 1, 16)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (15, N'Моторное масло EDGE LL Titanium FST 15669A', 3000.0000, N'Описание отсутствует', N'C:\Товары автосервиса\8BC0C1A9.jpg', 1, 12)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (16, N'Моторное масло EDGE Professional LL III Titanium FST 157AD6', 1760.0000, N'Описание отсутствует', N'C:\Товары автосервиса\96E0C1E7.jpg', 1, 12)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (17, N'Моторное масло ENGINE OIL 08880-80365-GO', 3580.0000, N'Описание отсутствует', N'C:\Товары автосервиса\CC10C869.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (18, N'Моторное масло ENGINE OIL 08880-80375-GO', 2710.0000, N'Описание отсутствует', N'C:\Товары автосервиса\CC40C869.jpg', 0, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (19, N'Моторное масло ENGINE OIL MZ 320753', 1590.0000, N'Описание отсутствует', N'C:\Товары автосервиса\5BB0C351.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (20, N'Моторное масло ENGINE OIL MZ 320754', 2140.0000, N'Описание отсутствует', N'C:\Товары автосервиса\3B70C57C.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (21, N'Моторное масло ENGINE OIL MZ 320756', 1600.0000, N'Описание отсутствует', N'C:\Товары автосервиса\5BE0C351.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (22, N'Моторное масло ENGINE OIL MZ 320757', 2210.0000, N'Описание отсутствует', N'C:\Товары автосервиса\0D30C4EE.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (23, N'Моторное масло Evolution 900 SXR 10160501', 1750.0000, N'Описание отсутствует', N'C:\Товары автосервиса\BD80E8D5.jpg', 1, 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (24, N'Моторное масло Evolution 900 SXR 194839', 2340.0000, N'Описание отсутствует', N'C:\Товары автосервиса\F8E0B138.jpg', 0, 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (25, N'Моторное масло Evolution 900 SXR 194877', 2470.0000, N'Описание отсутствует', N'C:\Товары автосервиса\E3A0B18A.jpg', 1, 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (26, N'Моторное масло Evolution 900 SXR 194878', 2010.0000, N'Описание отсутствует', N'C:\Товары автосервиса\E320BB7C.jpg', 1, 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (27, N'Моторное масло Formula F 15595E', 1750.0000, N'Описание отсутствует', N'C:\Товары автосервиса\5250C855.jpg', 0, 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (28, N'Моторное масло Formula F 155D3A', 1830.0000, N'Описание отсутствует', N'C:\Товары автосервиса\39D0C188.jpg', 1, 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (29, N'Моторное масло Formula F Fuel Economy HC 155D4B', 1450.0000, N'Описание отсутствует', N'C:\Товары автосервиса\39A0C188.jpg', 1, 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (30, N'Моторное масло Fuel Economy 08880-80845', 2560.0000, N'Описание отсутствует', N'C:\Товары автосервиса\23106A35.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (31, N'Моторное масло Gasoline Fully- Synthetic 30021326-746', 1650.0000, N'Описание отсутствует', N'C:\Товары автосервиса\27B0C883.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (32, N'Моторное масло Genesis Armortech 1539424', 1710.0000, N'Описание отсутствует', N'C:\Товары автосервиса\B0F0CB59.jpg', 1, 28)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (33, N'Моторное масло Genesis Armortech 3148675', 1660.0000, N'Описание отсутствует', N'C:\Товары автосервиса\C9C0F036.jpg', 0, 28)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (34, N'Моторное масло Genuine A000989790211BIFR', 1530.0000, N'Описание отсутствует', N'C:\Товары автосервиса\2E30E06C.jpg', 0, 32)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (35, N'Моторное масло Genuine A000989790213BIFR', 2390.0000, N'Описание отсутствует', N'C:\Товары автосервиса\2E60E06C.jpg', 1, 32)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (36, N'Моторное масло Helix HX8 A5/B5 550046777', 1530.0000, N'Описание отсутствует', N'C:\Товары автосервиса\F160E078.jpg', 1, 42)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (37, N'Моторное масло Helix Ultra 550046361', 2120.0000, N'Описание отсутствует', N'C:\Товары автосервиса\F310E078.jpg', 1, 42)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (38, N'Моторное масло Helix Ultra 550046367', 1650.0000, N'Описание отсутствует', N'C:\Товары автосервиса\F2E0E078.jpg', 0, 42)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (39, N'Моторное масло Helix Ultra 550046387', 2160.0000, N'Описание отсутствует', N'C:\Товары автосервиса\F2B0E078.jpg', 0, 42)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (40, N'Моторное масло Helix Ultra Pro AM-L 550046353', 2110.0000, N'Описание отсутствует', N'C:\Товары автосервиса\3DF0E4BC.jpg', 1, 42)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (41, N'Моторное масло Leichtlauf Special AA 7516', 2360.0000, N'Описание отсутствует', N'C:\Товары автосервиса\47E07CB5.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (42, N'Моторное масло Longlife III G 052 195 M2', 1910.0000, N'Описание отсутствует', N'C:\Товары автосервиса\E5507A37.jpg', 1, 47)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (43, N'Моторное масло Longlife III G 052 195 M4', 4100.0000, N'Описание отсутствует', N'C:\Товары автосервиса\D9605006.jpg', 1, 47)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (44, N'Моторное масло Magnatec A3/B4 156E9D', 1610.0000, N'Описание отсутствует', N'C:\Товары автосервиса\9290C1E7.jpg', 1, 12)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (45, N'Моторное масло Magnatec A3/B4 156E9E', 2130.0000, N'Описание отсутствует', N'C:\Товары автосервиса\92C0C1E7.jpg', 1, 12)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (46, N'Моторное масло Magnatec A5 15583D', 2220.0000, N'Описание отсутствует', N'C:\Товары автосервиса\9380C1E7.jpg', 1, 12)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (47, N'Моторное масло Mobil 1 ESP 154279', 1860.0000, N'Описание отсутствует', N'C:\Товары автосервиса\F460E078.jpg', 1, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (48, N'Моторное масло Mobil 1 ESP 154285', 2890.0000, N'Описание отсутствует', N'C:\Товары автосервиса\F490E078.jpg', 1, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (49, N'Моторное масло Mobil 1 ESP Formula 152621', 2920.0000, N'Описание отсутствует', N'C:\Товары автосервиса\DC70BEC3.jpg', 0, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (50, N'Моторное масло Mobil 1 FS 153692', 3020.0000, N'Описание отсутствует', N'C:\Товары автосервиса\6080DCD5.jpg', 1, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (51, N'Моторное масло Molygen New Generation 9042', 2510.0000, N'Описание отсутствует', N'C:\Товары автосервиса\0D60A8A4.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (52, N'Моторное масло Molygen New Generation 9054', 2670.0000, N'Описание отсутствует', N'C:\Товары автосервиса\0DF0A8A4.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (53, N'Моторное масло Motor Oil KE900-90032-R', 1450.0000, N'Описание отсутствует', N'C:\Товары автосервиса\54B0795D.jpg', 1, 36)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (54, N'Моторное масло Motor Oil KE900-90042', 2020.0000, N'Описание отсутствует', N'C:\Товары автосервиса\90505D31.jpg', 1, 36)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (55, N'Моторное масло Motor Oil KE900-90042-R', 2060.0000, N'Описание отсутствует', N'C:\Товары автосервиса\8FE07916.jpg', 1, 36)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (56, N'Моторное масло Optimal Synth 2293', 2520.0000, N'Описание отсутствует', N'C:\Товары автосервиса\C310B9F3.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (57, N'Моторное масло Optimal Synth 3926', 1880.0000, N'Описание отсутствует', N'C:\Товары автосервиса\EFC05011.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (58, N'Моторное масло Original oil Ultra 0530-05-TFE', 2930.0000, N'Описание отсутствует', N'C:\Товары автосервиса\85C04040.jpg', 1, 31)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (59, N'Моторное масло Original oil Ultra 8300-77-992', 2770.0000, N'Описание отсутствует', N'C:\Товары автосервиса\EF80D790.jpg', 0, 31)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (60, N'Моторное масло Premium DPF Diesel 05200-00120', 1460.0000, N'Описание отсутствует', N'C:\Товары автосервиса\2D709062.jpg', 1, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (61, N'Моторное масло Premium DPF Diesel 05200-00620', 2470.0000, N'Описание отсутствует', N'C:\Товары автосервиса\9B3075EB.jpg', 1, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (62, N'Моторное масло Premium LF Gasoline 05100-00451', 1620.0000, N'Описание отсутствует', N'C:\Товары автосервиса\2B609062.jpg', 1, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (63, N'Моторное масло QUARTZ 9000 148597', 1700.0000, N'Описание отсутствует', N'C:\Товары автосервиса\8F909ED7.jpg', 0, 45)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (64, N'Моторное масло QUARTZ 9000 ENERGY HKS 175392', 1530.0000, N'Описание отсутствует', N'C:\Товары автосервиса\6DA0A012.jpg', 0, 45)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (65, N'Моторное масло QUARTZ 9000 ENERGY HKS 175393', 2830.0000, N'Описание отсутствует', N'C:\Товары автосервиса\6DD0A012.jpg', 1, 45)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (66, N'Моторное масло QUARTZ 9000 FUTURE NFC 10230501', 1650.0000, N'Описание отсутствует', N'C:\Товары автосервиса\3970E753.jpg', 0, 45)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (67, N'Моторное масло QUARTZ 9000 FUTURE NFC 171839', 1560.0000, N'Описание отсутствует', N'C:\Товары автосервиса\D2508F32.jpg', 1, 45)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (68, N'Моторное масло QUARTZ 9000 FUTURE NFC 183199', 2040.0000, N'Описание отсутствует', N'C:\Товары автосервиса\6CE0A012.jpg', 1, 45)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (69, N'Моторное масло QUARTZ 9000 FUTURE NFC 183450', 1660.0000, N'Описание отсутствует', NULL, 1, 45)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (70, N'Моторное масло QUARTZ INEO ECS 151510', 1920.0000, N'Описание отсутствует', N'C:\Товары автосервиса\8F609ED7.jpg', 1, 45)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (71, N'Моторное масло QUARTZ INEO ECS 166252', 1600.0000, N'Описание отсутствует', N'C:\Товары автосервиса\D0D08F32.jpg', 1, 45)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (72, N'Моторное масло SN 08880-10705', 2200.0000, N'Описание отсутствует', N'C:\Товары автосервиса\43909176.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (73, N'Моторное масло SN 08880-10706', 1640.0000, N'Описание отсутствует', N'C:\Товары автосервиса\43C09176.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (74, N'Моторное масло SN/GF-5 SN5W30C', 1550.0000, N'Описание отсутствует', N'C:\Товары автосервиса\5A30A7EE.jpg', 1, 41)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (75, N'Моторное масло Special C G 055 167 M4', 4720.0000, N'Описание отсутствует', N'C:\Товары автосервиса\6730A31C.jpg', 1, 47)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (76, N'Моторное масло Special G G 052 502 M2', 1820.0000, N'Описание отсутствует', N'C:\Товары автосервиса\E0D0E079.jpg', 1, 47)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (77, N'Моторное масло Special G G 052 502 M4', 3090.0000, N'Описание отсутствует', N'C:\Товары автосервиса\E0A0E079.jpg', 1, 47)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (78, N'Моторное масло Special Tec LL 8055', 2420.0000, N'Описание отсутствует', N'C:\Товары автосервиса\B590AA7B.jpg', 0, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (79, N'Моторное масло Super 3000 X1 152061', 2010.0000, N'Описание отсутствует', N'C:\Товары автосервиса\40409946.jpg', 1, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (80, N'Моторное масло Super 3000 X1 152566', 1820.0000, N'Описание отсутствует', N'C:\Товары автосервиса\6CA0BE73.jpg', 0, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (81, N'Моторное масло Super 3000 X1 152567', 1550.0000, N'Описание отсутствует', N'C:\Товары автосервиса\F200BC2F.jpg', 1, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (82, N'Моторное масло Super 3000 X1 Diesel 152572', 1870.0000, N'Описание отсутствует', N'C:\Товары автосервиса\B0A0C186.jpg', 1, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (83, N'Моторное масло Super 3000 X1 Formula FE 152564', 1890.0000, N'Описание отсутствует', N'C:\Товары автосервиса\59B0BE73.jpg', 1, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (84, N'Моторное масло Super Extra Gasoline 05100-00410', 1230.0000, N'Описание отсутствует', N'C:\Товары автосервиса\2A109062.jpg', 1, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (85, N'Моторное масло Supreme Synthetic MOSYN53C16', 1910.0000, N'Описание отсутствует', N'C:\Товары автосервиса\69C0CD62.jpg', 1, 39)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (86, N'Моторное масло Top Tec 4100 7501', 2580.0000, N'Описание отсутствует', N'C:\Товары автосервиса\022096CB.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (87, N'Моторное масло Top Tec 4600 8033', 2580.0000, N'Описание отсутствует', N'C:\Товары автосервиса\B790A6AA.jpg', 0, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (88, N'Моторное масло Turbo SYN Gasoline 05100-00441', 1870.0000, N'Описание отсутствует', N'C:\Товары автосервиса\2B009062.jpg', 1, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (89, N'Моторное масло ULTRA 152624', 1940.0000, N'Описание отсутствует', N'C:\Товары автосервиса\BA30C186.jpg', 1, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (90, N'Моторное масло Ultra LEO-SN 08217-99974', 2980.0000, N'Описание отсутствует', N'C:\Товары автосервиса\97809225.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (91, N'Моторное масло X9 162613', 1530.0000, N'Описание отсутствует', N'C:\Товары автосервиса\30E0C751.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (92, N'Моторное масло Zepro Eco Medalist 3583-001', 1770.0000, N'Описание отсутствует', N'C:\Товары автосервиса\6800BB8A.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (93, N'Моторное масло Zepro Eco Medalist 3583-004', 2520.0000, N'Описание отсутствует', N'C:\Товары автосервиса\3DA0B713.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (94, N'Моторное масло Zepro Euro Spec SN/CF 1849-001', 1730.0000, N'Описание отсутствует', N'C:\Товары автосервиса\90A0B807.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (95, N'Моторное масло Zepro Euro Spec SN/CF 1849-004', 2400.0000, N'Описание отсутствует', N'C:\Товары автосервиса\90D0B807.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (96, N'Моторное масло Zepro Touring 1845-001', 1720.0000, N'Описание отсутствует', N'C:\Товары автосервиса\7B70B9C6.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (97, N'Моторное масло Zepro Touring 1845-004', 2380.0000, N'Описание отсутствует', N'C:\Товары автосервиса\5180B90E.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (98, N'Моторное масло Люкс 207465', 1090.0000, N'Описание отсутствует', N'C:\Товары автосервиса\8E20A863.jpg', 1, 28)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (99, N'Трос буксировочный 12 тонн 54384', 410.0000, N'Описание отсутствует', N'C:\Товары автосервиса\9750DA76.jpg', 1, 43)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (100, N'Щетка для снега со съемным скребком GY000202', 350.0000, N'Описание отсутствует', N'C:\Товары автосервиса\3760D73F.jpg', 1, 18)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (101, N'Кредитница, Кожа B6 6 95 1349', 6770.0000, N'Кредитница мужская, Business. Цвет: черный. Материал: итальянская кожа. Вертикальный формат. 10 отделений для кредитных карт, 2 прорезных кармана, 2 отделения для купюр. Заклепка в виде звезды «Мерседес-Бенц».', N'C:\Товары автосервиса\63C09E91.jpg', 1, 32)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [isActive], [ManufactureID]) VALUES (102, N'Моторное масло 76 A000989PKW Motorenol0213BLER', 2511.0000, N'Описание отсутствует', N'C:\Товары автосервиса\2E00E06C.jpg', 1, 32)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (1, CAST(N'2001-01-19T08:47:04.473' AS DateTime), 31, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (2, CAST(N'2002-01-19T08:49:59.497' AS DateTime), 27, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (4, CAST(N'2005-01-19T14:29:56.297' AS DateTime), 33, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (5, CAST(N'2008-01-19T10:57:01.000' AS DateTime), 63, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (6, CAST(N'2009-01-19T17:04:05.000' AS DateTime), 56, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (8, CAST(N'2015-01-19T10:32:43.323' AS DateTime), 69, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (9, CAST(N'2017-01-19T09:33:19.333' AS DateTime), 61, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (10, CAST(N'2017-01-19T18:25:51.257' AS DateTime), 93, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (13, CAST(N'2021-01-19T13:44:02.443' AS DateTime), 26, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (14, CAST(N'2024-01-19T16:39:39.393' AS DateTime), 98, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (15, CAST(N'2028-01-19T08:59:40.593' AS DateTime), 50, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (16, CAST(N'2011-02-19T13:31:04.313' AS DateTime), 29, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (17, CAST(N'2011-02-19T18:18:45.183' AS DateTime), 87, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (18, CAST(N'2013-02-19T13:40:11.400' AS DateTime), 30, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (19, CAST(N'2014-02-19T16:30:00.300' AS DateTime), 73, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (20, CAST(N'2015-02-19T13:41:46.413' AS DateTime), 2, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (21, CAST(N'2016-02-19T08:02:50.250' AS DateTime), 7, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (22, CAST(N'2019-02-19T08:36:15.360' AS DateTime), 91, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (23, CAST(N'2022-02-19T15:07:25.727' AS DateTime), 93, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (24, CAST(N'2022-02-19T15:30:53.307' AS DateTime), 48, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (25, CAST(N'2025-02-19T18:40:43.403' AS DateTime), 25, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (26, CAST(N'2027-02-19T17:52:43.523' AS DateTime), 4, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (27, CAST(N'2002-03-19T09:33:38.333' AS DateTime), 38, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (28, CAST(N'2007-03-19T17:37:12.370' AS DateTime), 91, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (29, CAST(N'2010-03-19T08:00:50.050' AS DateTime), 26, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (30, CAST(N'2023-03-19T09:48:58.487' AS DateTime), 28, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (31, CAST(N'2023-03-19T12:33:48.333' AS DateTime), 46, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (32, CAST(N'2024-03-19T18:10:35.103' AS DateTime), 63, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (33, CAST(N'2027-03-19T12:05:57.557' AS DateTime), 38, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (34, CAST(N'2027-03-19T18:28:09.290' AS DateTime), 12, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (35, CAST(N'2027-03-19T19:34:17.343' AS DateTime), 1, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (36, CAST(N'2002-04-19T15:49:55.497' AS DateTime), 68, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (37, CAST(N'2008-04-19T19:12:39.123' AS DateTime), 81, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (38, CAST(N'2013-04-19T12:41:52.417' AS DateTime), 23, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (39, CAST(N'2024-04-19T17:19:15.190' AS DateTime), 76, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (40, CAST(N'2027-04-19T12:25:55.257' AS DateTime), 51, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (41, CAST(N'2029-04-19T18:19:10.190' AS DateTime), 45, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (42, CAST(N'2002-05-19T14:04:39.440' AS DateTime), 37, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (43, CAST(N'2008-05-19T16:32:17.323' AS DateTime), 11, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (44, CAST(N'2008-05-19T16:55:35.553' AS DateTime), 57, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (45, CAST(N'2011-05-19T16:15:00.150' AS DateTime), 73, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (46, CAST(N'2014-05-19T16:03:31.330' AS DateTime), 35, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (47, CAST(N'2023-05-19T12:00:25.027' AS DateTime), 30, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (48, CAST(N'2025-05-19T12:03:17.317' AS DateTime), 22, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (49, CAST(N'2029-05-19T13:09:10.910' AS DateTime), 17, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (50, CAST(N'2002-06-19T19:06:42.643' AS DateTime), 49, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (51, CAST(N'2008-06-19T14:12:26.123' AS DateTime), 59, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (52, CAST(N'2011-06-19T09:34:14.340' AS DateTime), 91, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (53, CAST(N'2012-06-19T10:24:41.243' AS DateTime), 13, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (54, CAST(N'2030-06-19T15:04:55.457' AS DateTime), 80, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (55, CAST(N'2004-07-19T17:30:40.303' AS DateTime), 37, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (56, CAST(N'2014-07-19T09:32:31.323' AS DateTime), 20, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (57, CAST(N'2018-07-19T08:43:03.433' AS DateTime), 99, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (58, CAST(N'2021-07-19T08:46:28.463' AS DateTime), 99, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (59, CAST(N'2022-07-19T10:28:38.283' AS DateTime), 19, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (60, CAST(N'2022-07-19T17:12:57.127' AS DateTime), 26, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (61, CAST(N'2023-07-19T13:22:18.223' AS DateTime), 22, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (62, CAST(N'2026-07-19T13:42:01.420' AS DateTime), 20, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (63, CAST(N'2027-07-19T12:18:45.183' AS DateTime), 70, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (64, CAST(N'2028-07-19T10:56:06.567' AS DateTime), 42, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (65, CAST(N'2029-07-19T09:29:15.290' AS DateTime), 82, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (66, CAST(N'2006-08-19T10:47:18.473' AS DateTime), 78, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (67, CAST(N'2007-08-19T18:21:42.213' AS DateTime), 49, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (68, CAST(N'2019-08-19T10:01:32.133' AS DateTime), 42, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (69, CAST(N'2020-08-19T18:45:14.450' AS DateTime), 64, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (70, CAST(N'2022-08-19T09:42:19.423' AS DateTime), 61, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (71, CAST(N'2025-08-19T09:14:40.143' AS DateTime), 1, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (73, CAST(N'2001-09-19T17:03:46.347' AS DateTime), 34, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (74, CAST(N'2004-09-19T08:03:50.350' AS DateTime), 19, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (75, CAST(N'2020-09-19T08:56:22.563' AS DateTime), 87, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (76, CAST(N'2025-09-19T09:23:18.233' AS DateTime), 4, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (77, CAST(N'2026-09-19T16:57:40.573' AS DateTime), 43, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (78, CAST(N'2003-10-19T12:31:48.313' AS DateTime), 68, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (79, CAST(N'2005-10-19T17:25:12.250' AS DateTime), 67, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (80, CAST(N'2006-10-19T15:45:52.457' AS DateTime), 15, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (81, CAST(N'2007-10-19T18:30:53.307' AS DateTime), 53, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (82, CAST(N'2008-10-19T12:30:44.303' AS DateTime), 92, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (83, CAST(N'2009-10-19T18:21:47.213' AS DateTime), 63, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (84, CAST(N'2011-10-19T16:56:48.563' AS DateTime), 74, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (85, CAST(N'2021-10-19T10:29:19.293' AS DateTime), 46, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (86, CAST(N'2003-11-19T19:48:14.480' AS DateTime), 18, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (87, CAST(N'2009-11-19T14:29:57.297' AS DateTime), 23, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (88, CAST(N'2010-11-19T17:27:19.273' AS DateTime), 9, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (89, CAST(N'2014-11-19T08:58:07.587' AS DateTime), 57, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (90, CAST(N'2016-11-19T13:32:23.323' AS DateTime), 30, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (91, CAST(N'2016-11-19T16:36:00.360' AS DateTime), 44, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (92, CAST(N'2020-11-19T17:05:24.523' AS DateTime), 21, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (93, CAST(N'2021-11-19T15:51:29.513' AS DateTime), 70, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (94, CAST(N'2022-11-19T08:16:05.167' AS DateTime), 60, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (95, CAST(N'2022-11-19T14:44:14.440' AS DateTime), 42, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (96, CAST(N'2018-12-19T15:30:51.307' AS DateTime), 10, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (97, CAST(N'2024-12-19T10:08:28.827' AS DateTime), 78, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (98, CAST(N'2025-12-19T09:20:39.203' AS DateTime), 95, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (99, CAST(N'2026-12-19T19:19:02.193' AS DateTime), 34, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (100, CAST(N'2030-12-19T13:56:10.560' AS DateTime), 62, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (101, CAST(N'2022-04-04T14:00:27.217' AS DateTime), 3, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (102, CAST(N'2022-04-04T14:09:22.840' AS DateTime), 3, 4, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (103, CAST(N'2022-04-04T14:15:41.823' AS DateTime), 3, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (104, CAST(N'2022-04-04T14:18:25.387' AS DateTime), 3, 1, NULL)
GO
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (105, CAST(N'2022-04-05T12:33:58.577' AS DateTime), 2, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (106, CAST(N'2003-01-19T14:05:29.000' AS DateTime), 20, 4, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (107, CAST(N'2020-01-19T17:36:33.000' AS DateTime), 3, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (108, CAST(N'2013-01-19T15:27:07.000' AS DateTime), 30, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientSeviceID]) VALUES (110, CAST(N'2022-04-28T15:07:51.000' AS DateTime), 5, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ID], [Name], [Price]) VALUES (1, N'Техническое обслуживание ', 32000)
INSERT [dbo].[Services] ([ID], [Name], [Price]) VALUES (5, N'Техническое обслуживание Подготовка и продажа новых и б/у автомобилей ', 7001)
INSERT [dbo].[Services] ([ID], [Name], [Price]) VALUES (6, N'Установка и обслуживание газового оборудования ', 29000)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [login], [password], [admin]) VALUES (1, N'Manager', N'123', 1)
INSERT [dbo].[Users] ([id], [login], [password], [admin]) VALUES (2, N'Client', N'1234', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [ShopBD] SET  READ_WRITE 
GO
