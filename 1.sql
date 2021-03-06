USE [master]
GO
/****** Object:  Database [YuYiDB]    Script Date: 2017-09-14 9:27:05 ******/
CREATE DATABASE [YuYiDB] ON  PRIMARY 
( NAME = N'YuYiDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\YuYiDB.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YuYiDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\YuYiDB_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [YuYiDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YuYiDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YuYiDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YuYiDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YuYiDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YuYiDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YuYiDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [YuYiDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YuYiDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [YuYiDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YuYiDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YuYiDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YuYiDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YuYiDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YuYiDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YuYiDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YuYiDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YuYiDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [YuYiDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YuYiDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YuYiDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YuYiDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YuYiDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YuYiDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YuYiDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YuYiDB] SET RECOVERY FULL 
GO
ALTER DATABASE [YuYiDB] SET  MULTI_USER 
GO
ALTER DATABASE [YuYiDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YuYiDB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'YuYiDB', N'ON'
GO
USE [YuYiDB]
GO
/****** Object:  Table [dbo].[AccountInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Money] [decimal](18, 0) NOT NULL,
	[UserInfoID] [int] NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [smallint] NOT NULL,
	[SubTime] [datetime] NOT NULL,
	[ModifyOn] [datetime] NOT NULL,
	[AdminUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccountInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActionInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](512) NOT NULL,
	[HttpMethod] [nvarchar](32) NULL,
	[ModifyOn] [datetime] NOT NULL,
	[SubTime] [datetime] NOT NULL,
	[ActionName] [nvarchar](64) NOT NULL,
	[Remark] [nvarchar](100) NULL,
	[IsMenu] [bit] NULL,
	[DelFlag] [smallint] NOT NULL,
	[Sort] [int] NULL,
	[IsIcon] [nvarchar](512) NULL,
 CONSTRAINT [PK_ActionInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BikeInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BikeInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DelFlag] [smallint] NULL,
	[SubTime] [datetime] NOT NULL,
	[ModifyOn] [datetime] NULL,
	[AdminUser] [nvarchar](50) NOT NULL,
	[Counts] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[TotalPrice] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_BikeInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserInfoID] [int] NOT NULL,
 CONSTRAINT [PK_OrderInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[R_User_ActionInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_User_ActionInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HasPerssion] [bit] NULL,
	[UserInfoID] [int] NOT NULL,
	[ActionInfoID] [int] NOT NULL,
	[DelFlag] [smallint] NOT NULL,
 CONSTRAINT [PK_R_User_Action] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DelFlag] [smallint] NOT NULL,
	[SubTime] [datetime] NOT NULL,
	[ModifyOn] [datetime] NOT NULL,
	[Remark] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_RoleInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleInfoActionInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleInfoActionInfo](
	[RoleInfo_ID] [int] NOT NULL,
	[ActionInfo_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShowName] [nvarchar](50) NULL,
	[Pwd] [nvarchar](50) NOT NULL,
	[DelFlag] [smallint] NOT NULL,
	[SubTime] [datetime] NOT NULL,
	[ModifyOn] [datetime] NOT NULL,
	[Remark] [nvarchar](100) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfoRoleInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfoRoleInfo](
	[UserInfo_ID] [int] NOT NULL,
	[RoleInfo_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YiquanInfo]    Script Date: 2017-09-14 9:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YiquanInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Counts] [int] NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[SubTime] [datetime] NULL,
	[ModifyOn] [datetime] NOT NULL,
	[DelFlag] [smallint] NOT NULL,
	[UserInfoID] [int] NOT NULL,
 CONSTRAINT [PK_YiquanInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AccountInfo] ON 

INSERT [dbo].[AccountInfo] ([ID], [Money], [UserInfoID], [Remark], [DelFlag], [SubTime], [ModifyOn], [AdminUser]) VALUES (7, CAST(3223 AS Decimal(18, 0)), 14, N'434', 0, CAST(0x0000A7EC01623938 AS DateTime), CAST(0x0000A7EC01623938 AS DateTime), N'admin')
INSERT [dbo].[AccountInfo] ([ID], [Money], [UserInfoID], [Remark], [DelFlag], [SubTime], [ModifyOn], [AdminUser]) VALUES (8, CAST(2324 AS Decimal(18, 0)), 1, N'测试', 0, CAST(0x0000A7EC016378E5 AS DateTime), CAST(0x0000A7EC016378E5 AS DateTime), N'admin')
INSERT [dbo].[AccountInfo] ([ID], [Money], [UserInfoID], [Remark], [DelFlag], [SubTime], [ModifyOn], [AdminUser]) VALUES (9, CAST(120 AS Decimal(18, 0)), 26, N'.。。', 0, CAST(0x0000A7EC01682FA4 AS DateTime), CAST(0x0000A7EC01682FA4 AS DateTime), N'admin')
INSERT [dbo].[AccountInfo] ([ID], [Money], [UserInfoID], [Remark], [DelFlag], [SubTime], [ModifyOn], [AdminUser]) VALUES (12, CAST(100 AS Decimal(18, 0)), 27, N'测试a', 0, CAST(0x0000A7ED0093F4AF AS DateTime), CAST(0x0000A7ED0093F4AF AS DateTime), N'admin')
INSERT [dbo].[AccountInfo] ([ID], [Money], [UserInfoID], [Remark], [DelFlag], [SubTime], [ModifyOn], [AdminUser]) VALUES (13, CAST(100 AS Decimal(18, 0)), 32, N'1', 0, CAST(0x0000A7ED00B94509 AS DateTime), CAST(0x0000A7ED00B94509 AS DateTime), N'admin')
INSERT [dbo].[AccountInfo] ([ID], [Money], [UserInfoID], [Remark], [DelFlag], [SubTime], [ModifyOn], [AdminUser]) VALUES (14, CAST(100 AS Decimal(18, 0)), 32, NULL, 0, CAST(0x0000A7ED00B99028 AS DateTime), CAST(0x0000A7ED00B99028 AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[AccountInfo] OFF
SET IDENTITY_INSERT [dbo].[ActionInfo] ON 

INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (5, N'/UserInfo/Index', N'GET', CAST(0x0000A7E70092266E AS DateTime), CAST(0x0000A7E70092266E AS DateTime), N'用户列表', N'1', 1, 0, 1, N'/UploadFiles/UploadImg/d7e1da48-1f30-464b-adb2-f3b5ae80521f-5.jpg')
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (6, N'/RoleInfo/Index', N'GET', CAST(0x0000A7E700929050 AS DateTime), CAST(0x0000A7E700929050 AS DateTime), N'角色列表', N'2', 1, 0, 2, N'/UploadFiles/UploadImg/960d98e0-5f20-4cd5-b80e-0b96b63b2374-3.jpg')
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (7, N'/ActionInfo/Index', N'GET', CAST(0x0000A7E70092D2B8 AS DateTime), CAST(0x0000A7E70092D2B8 AS DateTime), N'权限列表', N'3', 1, 0, 3, N'/UploadFiles/UploadImg/f4e3a7d2-ad34-4455-a9e0-262e2f7afacb-4.jpg')
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (8, N'http://localhost:9889/Home/Index', N'GET', CAST(0x0000A7E700932ABC AS DateTime), CAST(0x0000A7E700932ABC AS DateTime), N'首页', N'普通管理可操作', 1, 0, 4, N'/UploadFiles/UploadImg/2fa512e3-e562-456c-a43d-c58556a55e3f-1.jpg')
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (9, N'http://www.baidu.com', N'GET', CAST(0x0000A7E700AAFEBC AS DateTime), CAST(0x0000A7E700AAFEBC AS DateTime), N'跳转百度', N'跳转外网测试', 1, 0, 5, N'/UploadFiles/UploadImg/ab4a83af-0120-4897-a222-dbfa5336158e-4.jpg')
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (10, N'/RoleInfo/GetRoleInfo', N'POST', CAST(0x0000A7E700B5AD60 AS DateTime), CAST(0x0000A7E700B5AD60 AS DateTime), N'获取角色信息', N'6', 0, 0, 6, NULL)
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (15, N'/Home/Index', N'GET', CAST(0x0000A7E900C300CB AS DateTime), CAST(0x0000A7E900C300CB AS DateTime), N'主菜单', N'主菜单的权限对平台所有用户开放', 0, 0, 0, NULL)
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (16, N'/UserInfo/GetUserInfo', N'POST', CAST(0x0000A7E900D5F8F4 AS DateTime), CAST(0x0000A7E900D5F8F4 AS DateTime), N'获取用户信息', N'测试获取用户列表信息', 0, 0, 7, NULL)
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (18, N'/BikeInfo/Index', N'GET', CAST(0x0000A7EC00A920AE AS DateTime), CAST(0x0000A7EC00A920AE AS DateTime), N'单车管理', N'测试测试', 1, 0, 10, N'/UploadFiles/UploadImg/c8338317-97b0-4048-ab02-b3d1f46e1dc5-footer-logo.png')
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (19, N'/AccountInfo/Index', N'GET', CAST(0x0000A7EC011AB0E5 AS DateTime), CAST(0x0000A7EC011AB0E5 AS DateTime), N'充值管理', N'测试充值管理', 1, 0, 11, N'/UploadFiles/UploadImg/2c5b4ff5-5e3f-4d01-ada7-635ba1410fc1-llogo.png')
INSERT [dbo].[ActionInfo] ([ID], [Url], [HttpMethod], [ModifyOn], [SubTime], [ActionName], [Remark], [IsMenu], [DelFlag], [Sort], [IsIcon]) VALUES (20, N'/YiquanInfo/Index', N'GET', CAST(0x0000A7EC012ACC60 AS DateTime), CAST(0x0000A7EC012ACC60 AS DateTime), N'翼券管理', N'翼券管理测试', 1, 0, 12, N'/UploadFiles/UploadImg/59c5b30b-2bcf-4bf0-a90c-15edee3c38e6-6.jpg')
SET IDENTITY_INSERT [dbo].[ActionInfo] OFF
SET IDENTITY_INSERT [dbo].[BikeInfo] ON 

INSERT [dbo].[BikeInfo] ([ID], [UID], [Name], [DelFlag], [SubTime], [ModifyOn], [AdminUser], [Counts], [Price], [TotalPrice]) VALUES (1, N'ZY0101011200000000', N'周易0', 0, CAST(0x0000A7EC00A9BF78 AS DateTime), CAST(0x0000A7EC00A9C0A4 AS DateTime), N'admin', 500, CAST(4 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[BikeInfo] OFF
SET IDENTITY_INSERT [dbo].[R_User_ActionInfo] ON 

INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (1, 0, 14, 7, 1)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (2, 0, 14, 8, 1)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (3, 1, 14, 5, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (4, 0, 14, 6, 1)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (5, 0, 14, 9, 1)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (6, 0, 14, 10, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (7, 1, 26, 15, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (8, 1, 26, 16, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (9, 1, 26, 5, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (10, 1, 26, 6, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (11, 1, 26, 7, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (12, 1, 26, 8, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (13, 1, 26, 9, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (14, 1, 26, 10, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (15, 1, 27, 5, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (16, 1, 27, 6, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (17, 1, 27, 15, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (18, 0, 27, 16, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (19, 0, 27, 10, 0)
INSERT [dbo].[R_User_ActionInfo] ([ID], [HasPerssion], [UserInfoID], [ActionInfoID], [DelFlag]) VALUES (20, 1, 27, 7, 0)
SET IDENTITY_INSERT [dbo].[R_User_ActionInfo] OFF
SET IDENTITY_INSERT [dbo].[RoleInfo] ON 

INSERT [dbo].[RoleInfo] ([ID], [Name], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (33, N'超级管理', 0, CAST(0x0000A7E700912CE3 AS DateTime), CAST(0x0000A7E700912CE3 AS DateTime), N'测试')
INSERT [dbo].[RoleInfo] ([ID], [Name], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (34, N'普通管理', 0, CAST(0x0000A7E7009147DE AS DateTime), CAST(0x0000A7E7009147DE AS DateTime), N'测试')
INSERT [dbo].[RoleInfo] ([ID], [Name], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (35, N'测试', 0, CAST(0x0000A7E700AE1B2F AS DateTime), CAST(0x0000A7E700AE1B2F AS DateTime), N'111')
INSERT [dbo].[RoleInfo] ([ID], [Name], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (36, N'测试2', 0, CAST(0x0000A7EC00BC50F2 AS DateTime), CAST(0x0000A7EC00BC50F2 AS DateTime), N'222')
INSERT [dbo].[RoleInfo] ([ID], [Name], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (37, N'23', 0, CAST(0x0000A7EC00C05CBC AS DateTime), CAST(0x0000A7EC00C05CBC AS DateTime), N'32')
SET IDENTITY_INSERT [dbo].[RoleInfo] OFF
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (33, 5)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (33, 6)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (33, 7)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (33, 9)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (33, 10)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (33, 18)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (33, 19)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (33, 20)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (34, 9)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (34, 18)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (35, 5)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (35, 6)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (35, 8)
INSERT [dbo].[RoleInfoActionInfo] ([RoleInfo_ID], [ActionInfo_ID]) VALUES (35, 18)
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [Name], [ShowName], [Pwd], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (1, N'xiaohuo', N'郭东生', N'123', 1, CAST(0x00008D3F00000000 AS DateTime), CAST(0x0000AE3000000000 AS DateTime), N'.。。。')
INSERT [dbo].[UserInfo] ([ID], [Name], [ShowName], [Pwd], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (2, N'admin', N'admin23', N'123456', 0, CAST(0x00008D3F00000000 AS DateTime), CAST(0x00008D5F00000000 AS DateTime), N'管理员测试账号')
INSERT [dbo].[UserInfo] ([ID], [Name], [ShowName], [Pwd], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (3, N'admin1', N'admin1', N'admin1', 1, CAST(0x00008D5F00000000 AS DateTime), CAST(0x00008D7C00000000 AS DateTime), N'管理员测试账号1')
INSERT [dbo].[UserInfo] ([ID], [Name], [ShowName], [Pwd], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (13, N'admin1', N'老郭', N'123456', 0, CAST(0x0000A7E700918907 AS DateTime), CAST(0x0000A7E700918907 AS DateTime), N'测试')
INSERT [dbo].[UserInfo] ([ID], [Name], [ShowName], [Pwd], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (14, N'123', N'1', N'1', 0, CAST(0x0000A7E700AE2B80 AS DateTime), CAST(0x0000A7E700AE2B80 AS DateTime), N'12q')
INSERT [dbo].[UserInfo] ([ID], [Name], [ShowName], [Pwd], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (26, N'sa', N'ssaa', N'sa', 0, CAST(0x0000A7E900C06295 AS DateTime), CAST(0x0000A7E900C06295 AS DateTime), N'sa')
INSERT [dbo].[UserInfo] ([ID], [Name], [ShowName], [Pwd], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (27, N'a', N'aa', N'a', 0, CAST(0x0000A7EB00B14942 AS DateTime), CAST(0x0000A7EB00B14942 AS DateTime), N'aa')
INSERT [dbo].[UserInfo] ([ID], [Name], [ShowName], [Pwd], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (31, N'小花', N'花花', N'111', 0, CAST(0x0000A7ED008EA2C5 AS DateTime), CAST(0x0000A7ED008EA2C5 AS DateTime), N'aaa')
INSERT [dbo].[UserInfo] ([ID], [Name], [ShowName], [Pwd], [DelFlag], [SubTime], [ModifyOn], [Remark]) VALUES (32, N'haha', N'234', N'234', 0, CAST(0x0000A7ED00B91A88 AS DateTime), CAST(0x0000A7ED00B91A88 AS DateTime), N'234')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
INSERT [dbo].[UserInfoRoleInfo] ([UserInfo_ID], [RoleInfo_ID]) VALUES (2, 33)
INSERT [dbo].[UserInfoRoleInfo] ([UserInfo_ID], [RoleInfo_ID]) VALUES (13, 34)
INSERT [dbo].[UserInfoRoleInfo] ([UserInfo_ID], [RoleInfo_ID]) VALUES (14, 35)
INSERT [dbo].[UserInfoRoleInfo] ([UserInfo_ID], [RoleInfo_ID]) VALUES (26, 35)
INSERT [dbo].[UserInfoRoleInfo] ([UserInfo_ID], [RoleInfo_ID]) VALUES (27, 35)
SET IDENTITY_INSERT [dbo].[YiquanInfo] ON 

INSERT [dbo].[YiquanInfo] ([ID], [Counts], [Remark], [SubTime], [ModifyOn], [DelFlag], [UserInfoID]) VALUES (1, 120, NULL, CAST(0x0000A7EC01683A03 AS DateTime), CAST(0x0000A7EC01683A03 AS DateTime), 0, 26)
INSERT [dbo].[YiquanInfo] ([ID], [Counts], [Remark], [SubTime], [ModifyOn], [DelFlag], [UserInfoID]) VALUES (4, 100, NULL, CAST(0x0000A7ED0093F4C9 AS DateTime), CAST(0x0000A7ED0093F4C9 AS DateTime), 0, 27)
INSERT [dbo].[YiquanInfo] ([ID], [Counts], [Remark], [SubTime], [ModifyOn], [DelFlag], [UserInfoID]) VALUES (5, 100, NULL, CAST(0x0000A7ED00B9450F AS DateTime), CAST(0x0000A7ED00B9450F AS DateTime), 0, 32)
INSERT [dbo].[YiquanInfo] ([ID], [Counts], [Remark], [SubTime], [ModifyOn], [DelFlag], [UserInfoID]) VALUES (6, 100, NULL, CAST(0x0000A7ED00B99033 AS DateTime), CAST(0x0000A7ED00B99033 AS DateTime), 0, 32)
SET IDENTITY_INSERT [dbo].[YiquanInfo] OFF
/****** Object:  Index [IX_FK_UserInfoAccountInfo]    Script Date: 2017-09-14 9:27:05 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserInfoAccountInfo] ON [dbo].[AccountInfo]
(
	[UserInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserInfoOrderInfo]    Script Date: 2017-09-14 9:27:05 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserInfoOrderInfo] ON [dbo].[OrderInfo]
(
	[UserInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ActionInfoR_User_Action]    Script Date: 2017-09-14 9:27:05 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ActionInfoR_User_Action] ON [dbo].[R_User_ActionInfo]
(
	[ActionInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserInfoR_User_Action]    Script Date: 2017-09-14 9:27:05 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserInfoR_User_Action] ON [dbo].[R_User_ActionInfo]
(
	[UserInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_RoleInfoActionInfo]    Script Date: 2017-09-14 9:27:05 ******/
ALTER TABLE [dbo].[RoleInfoActionInfo] ADD  CONSTRAINT [PK_RoleInfoActionInfo] PRIMARY KEY NONCLUSTERED 
(
	[RoleInfo_ID] ASC,
	[ActionInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RoleInfoActionInfo_ActionInfo]    Script Date: 2017-09-14 9:27:05 ******/
CREATE NONCLUSTERED INDEX [IX_FK_RoleInfoActionInfo_ActionInfo] ON [dbo].[RoleInfoActionInfo]
(
	[ActionInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_UserInfoRoleInfo]    Script Date: 2017-09-14 9:27:05 ******/
ALTER TABLE [dbo].[UserInfoRoleInfo] ADD  CONSTRAINT [PK_UserInfoRoleInfo] PRIMARY KEY NONCLUSTERED 
(
	[UserInfo_ID] ASC,
	[RoleInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserInfoRoleInfo_RoleInfo]    Script Date: 2017-09-14 9:27:05 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserInfoRoleInfo_RoleInfo] ON [dbo].[UserInfoRoleInfo]
(
	[RoleInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserInfoYiquanInfo]    Script Date: 2017-09-14 9:27:05 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserInfoYiquanInfo] ON [dbo].[YiquanInfo]
(
	[UserInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoAccountInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([ID])
GO
ALTER TABLE [dbo].[AccountInfo] CHECK CONSTRAINT [FK_UserInfoAccountInfo]
GO
ALTER TABLE [dbo].[OrderInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoOrderInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderInfo] CHECK CONSTRAINT [FK_UserInfoOrderInfo]
GO
ALTER TABLE [dbo].[R_User_ActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_ActionInfoR_User_Action] FOREIGN KEY([ActionInfoID])
REFERENCES [dbo].[ActionInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[R_User_ActionInfo] CHECK CONSTRAINT [FK_ActionInfoR_User_Action]
GO
ALTER TABLE [dbo].[R_User_ActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoR_User_Action] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([ID])
GO
ALTER TABLE [dbo].[R_User_ActionInfo] CHECK CONSTRAINT [FK_UserInfoR_User_Action]
GO
ALTER TABLE [dbo].[RoleInfoActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_RoleInfoActionInfo_ActionInfo] FOREIGN KEY([ActionInfo_ID])
REFERENCES [dbo].[ActionInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleInfoActionInfo] CHECK CONSTRAINT [FK_RoleInfoActionInfo_ActionInfo]
GO
ALTER TABLE [dbo].[RoleInfoActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_RoleInfoActionInfo_RoleInfo] FOREIGN KEY([RoleInfo_ID])
REFERENCES [dbo].[RoleInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleInfoActionInfo] CHECK CONSTRAINT [FK_RoleInfoActionInfo_RoleInfo]
GO
ALTER TABLE [dbo].[UserInfoRoleInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoRoleInfo_RoleInfo] FOREIGN KEY([RoleInfo_ID])
REFERENCES [dbo].[RoleInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInfoRoleInfo] CHECK CONSTRAINT [FK_UserInfoRoleInfo_RoleInfo]
GO
ALTER TABLE [dbo].[UserInfoRoleInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoRoleInfo_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([ID])
GO
ALTER TABLE [dbo].[UserInfoRoleInfo] CHECK CONSTRAINT [FK_UserInfoRoleInfo_UserInfo]
GO
ALTER TABLE [dbo].[YiquanInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoYiquanInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([ID])
GO
ALTER TABLE [dbo].[YiquanInfo] CHECK CONSTRAINT [FK_UserInfoYiquanInfo]
GO
USE [master]
GO
ALTER DATABASE [YuYiDB] SET  READ_WRITE 
GO
