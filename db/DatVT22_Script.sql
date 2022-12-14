USE [master]
GO
/****** Object:  Database [JWD.L.A101]    Script Date: 7/29/2022 12:30:39 AM ******/
CREATE DATABASE [JWD.L.A101] ON  PRIMARY 
( NAME = N'JWD.L.A101', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\JWD.L.A101.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JWD.L.A101_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\JWD.L.A101_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JWD.L.A101] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JWD.L.A101].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JWD.L.A101] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JWD.L.A101] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JWD.L.A101] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JWD.L.A101] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JWD.L.A101] SET ARITHABORT OFF 
GO
ALTER DATABASE [JWD.L.A101] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [JWD.L.A101] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JWD.L.A101] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JWD.L.A101] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JWD.L.A101] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JWD.L.A101] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JWD.L.A101] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JWD.L.A101] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JWD.L.A101] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JWD.L.A101] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JWD.L.A101] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JWD.L.A101] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JWD.L.A101] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JWD.L.A101] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JWD.L.A101] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JWD.L.A101] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JWD.L.A101] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JWD.L.A101] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JWD.L.A101] SET  MULTI_USER 
GO
ALTER DATABASE [JWD.L.A101] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JWD.L.A101] SET DB_CHAINING OFF 
GO
USE [JWD.L.A101]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/29/2022 12:30:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[employeeId] [int] NOT NULL,
	[account] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/29/2022 12:30:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employeeId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](255) NOT NULL,
	[lastName] [varchar](255) NOT NULL,
	[gender] [int] NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [varchar](255) NULL,
	[departmentName] [varchar](255) NOT NULL,
	[remark] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([employeeId], [account], [email], [password], [status]) VALUES (1, N'admin', N'admin@gmail.com', N'100:739d3e85f7809ada31ef5f336294ae2d:f6405279cb11cea066169fe72a8e5cb22e2825983e9ac90d64ecb9daf487c28ada4866efb3e5b78da3701d1daa43cc2132b918d622dece61f39a3322006d8a26', 1)
INSERT [dbo].[Account] ([employeeId], [account], [email], [password], [status]) VALUES (16, N'admin3', N'admin3@gmail.com', N'100:0df3250ef86f3365a497cdb08eb5650c:68962ee3c1cd94821c07f3c0e5dbef610bb8ac0a5d64292e748b4c94fcebe76bce625a9f732563741b63a8c4c2a6398db25faab81844a66b250a8828b86bf55a', 1)
INSERT [dbo].[Account] ([employeeId], [account], [email], [password], [status]) VALUES (17, N'admin4', N'admin4@gmail.com', N'100:f4f3e495e5172f156b08b66f62b778ac:d33f2e88322a237ac8691b1ce0c892ee17752a5dc2fff8b2bdeff59cb753ba9f18a98569b4400aa308ca392b96f1174d6ef0cd0afe5762d8c3088e4f45fe4df6', 1)
INSERT [dbo].[Account] ([employeeId], [account], [email], [password], [status]) VALUES (18, N'admin5', N'admin5@gmail.com', N'100:f1dd42fd9305b44176e08a24188eab93:f3a23896644a50409f19ac51e31e88754129d31aedcb33ac19e5c38f6be88dd13bea604e28d49bbf46174a03b474957cfc9a52471c89e8988aa266da77bd51b6', 1)
INSERT [dbo].[Account] ([employeeId], [account], [email], [password], [status]) VALUES (19, N'admin6', N'admin6@gmail.com', N'100:5aa118cf9cb65839fade5183d10273c9:1a58b2eb5bec7290f8986c52542b5bed3b3c72e4bcbc7bcf99ee6b1d9d514b1ff7d44dfe54940cdd8821aa0d223f3f3a1721ff9702d80fc0c23b61b574145f2c', 1)
INSERT [dbo].[Account] ([employeeId], [account], [email], [password], [status]) VALUES (20, N'admin8', N'admin8@gmail.com', N'100:85c582b54ec701e7385caa2c86f06cee:123c0a9255ef87a605628e2ffea61d7194ccbe6ef8038cadcb046748d936a582ff4203f3bdca901c3c3f1d2aa2f81600f02f6370357f1a9366e04bcfc4a61d5e', 1)
INSERT [dbo].[Account] ([employeeId], [account], [email], [password], [status]) VALUES (21, N'admin9', N'admin9@gmail.com', N'100:ed421c2fa25987489ac02d6ae64f6fca:62a3809751019259aaebb3beeb77b1cdaaba21fd8bca926bf454681cd98a4e55954f01bb1625df143b6f8b06d30738bc66769f0082aa002fff124c46c18c09e5', 1)
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (1, N'John', N'Deep', 1, CAST(N'1998-09-21' AS Date), N'09212231321', N'A101', N'IT', N'Nothing to say')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (2, N'Mike', N'jack', 0, CAST(N'1994-02-21' AS Date), N'0213123123', N'BD', N'AI', N'No')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (3, N'Cute', N'Girl', 1, CAST(N'2000-11-12' AS Date), N'02312312312', N'Come', N'Build', N'Hello')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (4, N'Sick', N'Boss', 1, CAST(N'1996-10-02' AS Date), N'03123123132', N'Tim', N'Hello', N'Adudu')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (8, N'Binh', N'Tan', 1, CAST(N'2022-07-04' AS Date), N'08887186091', N'EU', N'Fsoft Academy', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (9, N'Binh', N'Baby', 1, CAST(N'2022-07-05' AS Date), N'0888718609', N'Pro', N'Fsoft Academy', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (10, N'Binh', N'Baby', 1, CAST(N'2022-07-07' AS Date), N'0923213214', N'IT', N'Fsoft Academy', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (11, N'Binh', N'Baby', 1, CAST(N'2022-07-07' AS Date), N'0923213214', N'IT', N'Fsoft Academy', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (14, N'Joan', N'Scope', 1, CAST(N'2022-07-06' AS Date), N'0888718609', N'IT', N'Banking', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (15, N'Joan', N'Scope', 0, CAST(N'2022-07-02' AS Date), N'0923213214', N'', N'Banking', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (16, N'Kenh', N'Loan', 1, CAST(N'2022-06-29' AS Date), N'0923213213', N'AS', N'Facebook', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (17, N'Adu', N'Melo', 1, CAST(N'2022-07-08' AS Date), N'0888718609', N'Hai Phong', N'Fsoft Academy', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (18, N'Adudu', N'Moa', 1, CAST(N'2022-06-29' AS Date), N'0888718609', N'Scope', N'Fsoft Academy', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (19, N'Adududu', N'Keo', 1, CAST(N'2022-07-06' AS Date), N'0888718609', N'ABD', N'Banking', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (20, N'Adudumy', N'Yuo', 1, CAST(N'2022-07-13' AS Date), N'0923213214', N'AO', N'Fsoft Academy', N'')
INSERT [dbo].[Employee] ([employeeId], [firstName], [lastName], [gender], [dateOfBirth], [phone], [address], [departmentName], [remark]) VALUES (21, N'Com', N'Huhu', 1, CAST(N'2022-07-14' AS Date), N'0923213213', N'Bu', N'Banking', N'')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E616408EA5793]    Script Date: 7/29/2022 12:30:39 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__EA162E110BC6C43E]    Script Date: 7/29/2022 12:30:39 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([employeeId])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD CHECK  (([status]=(-1) OR [status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CHECK  (([dateOfBirth]<getdate()))
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CHECK  (([gender]=(-1) OR [gender]=(0) OR [gender]=(1)))
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CHECK  ((NOT [phone] like '%[^0-9]%'))
GO
USE [master]
GO
ALTER DATABASE [JWD.L.A101] SET  READ_WRITE 
GO
