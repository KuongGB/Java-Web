USE [master]
GO
/****** Object:  Database [LibraryOnline]    Script Date: 25/7/2023 6:49:30 PM ******/
CREATE DATABASE [LibraryOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.CUONGK16\MSSQL\DATA\LibraryOnline.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.CUONGK16\MSSQL\DATA\LibraryOnline_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryOnline] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LibraryOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryOnline] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LibraryOnline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LibraryOnline]
GO
/****** Object:  Table [dbo].[books]    Script Date: 25/7/2023 6:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[author] [nvarchar](25) NULL,
	[cid] [int] NULL,
	[img] [varchar](25) NULL,
	[description] [nvarchar](35) NULL,
	[vip] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bookshelf]    Script Date: 25/7/2023 6:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookshelf](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [varchar](15) NULL,
	[bid] [int] NULL,
	[isFinish] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categories]    Script Date: 25/7/2023 6:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 25/7/2023 6:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[uid] [varchar](15) NOT NULL,
	[fullname] [varchar](25) NULL,
	[pass] [varchar](15) NOT NULL,
	[role] [char](2) NOT NULL,
	[vip] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (1, N'Brazen and the Beast', N'Sarah MacLean', 7, N'book1.jpg', N'Best Romance Book', 1)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (2, N'The Savior', N'J.R Ward', 7, N'book2.jpg', N'Romance Book', 0)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (3, N'The Night Fire', N'Michael Connelly', 6, N'book3.jpg', N'Best Detective and Mystery Book', 1)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (4, N'Bird Box', N'Josh Malerman', 2, N'book4.jpg', N'Best Horror Book', 1)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (5, N'Carrie', N'Stephen King', 1, N'book5.jpg', N'Horror Book', 0)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (6, N'The Haunting of Hill House', N'Shirley Jackson', 2, N'book6.jpg', N'Horror Book', 0)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (7, N'The Help', N'Kathryn Stockett', 4, N'book7.jpg', N'Historical Fiction Book', 0)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (8, N'Ninth House', N'Leigh Bardugo', 1, N'book8.jpg', N'Best Fantasy Book', 1)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (9, N'CIRCE', N'Madeline Miller', 1, N'book9.jpg', N'Fantasy Book', 0)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (10, N'The Call of the Wild', N'Jack London', 5, N'book10.jpg', N'Action and Adventure Book', 0)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (11, N'Life Of Pi', N'Yann Martel', 5, N'book11.jpg', N'Action and Adventure Book', 0)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (12, N'The Hitchhiker''s Guide to the Galaxy', N'Douglas Adams', 3, N'book12.jpg', N'Best Humour and Satire Book', 1)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (13, N'The Color of Magic', N'Terry Pratchett', 3, N'book13.jpg', N'Humour and Satire Book', 0)
INSERT [dbo].[books] ([id], [name], [author], [cid], [img], [description], [vip]) VALUES (15, N'A Study in Scarlet', N'Authur Conan Doyle', 6, N'book14.jpg', N'Detective and Mystery Book', 0)
SET IDENTITY_INSERT [dbo].[books] OFF
SET IDENTITY_INSERT [dbo].[bookshelf] ON 

INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (8, N'vipday', 4, 1)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (9, N'vipday', 1, 1)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (10, N'vipday', 6, 0)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (11, N'vipday', 12, 0)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (24, N'cuong1', 2, 1)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (27, N'cuong1', 1, 0)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (53, N'cuong1', 6, 1)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (168, N'cuong', 2, 1)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (172, N'cuong', 3, 0)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (174, N'cuong', 1, 0)
INSERT [dbo].[bookshelf] ([id], [uid], [bid], [isFinish]) VALUES (176, N'cuong2', 1, 0)
SET IDENTITY_INSERT [dbo].[bookshelf] OFF
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([cid], [name]) VALUES (1, N'Fantasy')
INSERT [dbo].[categories] ([cid], [name]) VALUES (2, N'Horror')
INSERT [dbo].[categories] ([cid], [name]) VALUES (3, N'Humour and satire')
INSERT [dbo].[categories] ([cid], [name]) VALUES (4, N'Historical fiction')
INSERT [dbo].[categories] ([cid], [name]) VALUES (5, N'Action and Adventure')
INSERT [dbo].[categories] ([cid], [name]) VALUES (6, N'Detective and Mystery')
INSERT [dbo].[categories] ([cid], [name]) VALUES (7, N'Romance')
SET IDENTITY_INSERT [dbo].[categories] OFF
INSERT [dbo].[users] ([uid], [fullname], [pass], [role], [vip]) VALUES (N'admin', N'SuperAdmin', N'1', N'AD', 1)
INSERT [dbo].[users] ([uid], [fullname], [pass], [role], [vip]) VALUES (N'admin1', N'SupaAdmin', N'112', N'AD', 1)
INSERT [dbo].[users] ([uid], [fullname], [pass], [role], [vip]) VALUES (N'cuong', N'KuongNe', N'1', N'US', 1)
INSERT [dbo].[users] ([uid], [fullname], [pass], [role], [vip]) VALUES (N'cuong1', N'cuongdeptrai', N'1', N'US', 1)
INSERT [dbo].[users] ([uid], [fullname], [pass], [role], [vip]) VALUES (N'cuong2', N'cuong', N'1', N'US', 1)
INSERT [dbo].[users] ([uid], [fullname], [pass], [role], [vip]) VALUES (N'vipday', N'Trinh Cuong', N'1', N'US', 1)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__bookshel__B09918BB7B4F6363]    Script Date: 25/7/2023 6:49:30 PM ******/
ALTER TABLE [dbo].[bookshelf] ADD UNIQUE NONCLUSTERED 
(
	[uid] ASC,
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[categories] ([cid])
GO
ALTER TABLE [dbo].[bookshelf]  WITH CHECK ADD FOREIGN KEY([bid])
REFERENCES [dbo].[books] ([id])
GO
ALTER TABLE [dbo].[bookshelf]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([uid])
GO
USE [master]
GO
ALTER DATABASE [LibraryOnline] SET  READ_WRITE 
GO
