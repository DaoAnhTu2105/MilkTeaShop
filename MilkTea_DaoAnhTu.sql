USE [master]
GO
/****** Object:  Database [PRJ301_Assignment]    Script Date: 7/8/2022 8:39:35 PM ******/
CREATE DATABASE [PRJ301_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ301_Assignment] SET QUERY_STORE = OFF
GO
USE [PRJ301_Assignment]
GO
/****** Object:  Table [dbo].[tblCatagory]    Script Date: 7/8/2022 8:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCatagory](
	[catagoryID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[catagoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 7/8/2022 8:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[total] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 7/8/2022 8:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [nvarchar](50) NOT NULL,
	[oderID] [nvarchar](50) NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 7/8/2022 8:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
	[catagoryID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[images] [nvarchar](2000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/8/2022 8:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/8/2022 8:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [int] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCatagory] ([catagoryID], [name]) VALUES (1, N'milk tea')
GO
INSERT [dbo].[tblCatagory] ([catagoryID], [name]) VALUES (2, N'black tea')
GO
INSERT [dbo].[tblCatagory] ([catagoryID], [name]) VALUES (3, N'milk')
GO
INSERT [dbo].[tblCatagory] ([catagoryID], [name]) VALUES (4, N'fruit tea ')
GO
INSERT [dbo].[tblCatagory] ([catagoryID], [name]) VALUES (5, N'milkshake')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'01', 1, N'Milk Tea', 10000, 500, N'1.jpeg')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'02', 1, N'Green milk tea', 30000, 500, N'2.webp')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'03', 1, N'Bubble milk tea', 40000, 500, N'3.jfif')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'04', 2, N'Black milk tea', 30000, 500, N'4.jpg')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'05', 1, N'Chocolate milk tea', 50000, 500, N'5.jpg')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'06', 1, N'Thai green tea milk tea', 30000, 500, N'6.jpg')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'07', 1, N'Caramel milk tea', 40000, 500, N'7.jfif')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'08', 1, N'Cocoa milk tea', 50000, 500, N'8.jfif')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'09', 1, N'Honey milk tea', 60000, 500, N'9.jfif')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'10', 1, N'Jasmine milk tea', 40000, 500, N'10.jpg')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'12', 4, N'Yellow tea', 2300000, 213, N'12.jfif')
GO
INSERT [dbo].[tblProduct] ([productID], [catagoryID], [name], [price], [quantity], [images]) VALUES (N'18', 4, N'Iphone', 22, 213, N'11.jpg')
GO
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (1, N'AD')
GO
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (2, N'US')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [name], [phone], [address], [email]) VALUES (N'1', N'123', 1, N'Dao Anh Tu', 937550256, N'Ho Chi Minh', N'tu@gmail.com')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [name], [phone], [address], [email]) VALUES (N'103296583444552308055', N' ', 2, N' ', 0, N' ', N'jinx210501@gmail.com')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [name], [phone], [address], [email]) VALUES (N'2', N'123', 2, N'Nguyen Cong Vu', 987657876, N'Vung Tau', N'vu@gmail.com')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [name], [phone], [address], [email]) VALUES (N'3', N'123', 2, N'Nguyen Thanh Tung', 979543566, N'Bien Hoa', N'tung@gmail.com')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [name], [phone], [address], [email]) VALUES (N'4', N'123', 2, N'Trinh Huu Truong', 978778877, N'Binh Duong', N'truong@gmail.com')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [name], [phone], [address], [email]) VALUES (N'5', N'123', 2, N'Nguyen Tien Dat', 978888786, N'Ho Chi Minh', N'dat@gmail.com')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [name], [phone], [address], [email]) VALUES (N'6', N'123', 2, N'Tu', 937550256, N'Ho Chi Minh', N'tudase151149@fpt.edu.vn')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [name], [phone], [address], [email]) VALUES (N'admin', N'123', 1, N'Admin', 937550256, N'117/18 Phan van han', N'hutao.2151@gmail.com')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([oderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([catagoryID])
REFERENCES [dbo].[tblCatagory] ([catagoryID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment] SET  READ_WRITE 
GO
