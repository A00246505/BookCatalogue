/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.2000)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [books]    Script Date: 12/17/2021 10:47:11 PM ******/
CREATE DATABASE [books]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'books', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\books.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'books_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\books_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [books] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [books].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [books] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [books] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [books] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [books] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [books] SET ARITHABORT OFF 
GO
ALTER DATABASE [books] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [books] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [books] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [books] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [books] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [books] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [books] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [books] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [books] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [books] SET  DISABLE_BROKER 
GO
ALTER DATABASE [books] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [books] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [books] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [books] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [books] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [books] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [books] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [books] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [books] SET  MULTI_USER 
GO
ALTER DATABASE [books] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [books] SET DB_CHAINING OFF 
GO
ALTER DATABASE [books] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [books] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [books] SET DELAYED_DURABILITY = DISABLED 
GO
USE [books]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 12/17/2021 10:47:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Title] [varchar](100) NULL,
	[Author] [varchar](100) NULL,
	[ISBN] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/17/2021 10:47:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryType]    Script Date: 12/17/2021 10:47:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryType](
	[Type] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([ID], [CategoryId], [Title], [Author], [ISBN]) VALUES (1, 1, N'The Alchemist', N'Paulo Coelho', N'453')
INSERT [dbo].[Book] ([ID], [CategoryId], [Title], [Author], [ISBN]) VALUES (2, 2, N'Harry Potter', N'J K Rowling', N'373')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Type], [Description]) VALUES (1, 1, N'Fiction is very creative work, portraying people , places in imaginary ways')
INSERT [dbo].[Category] ([CategoryID], [Type], [Description]) VALUES (2, 2, N'Horros fiction is intended to frighten scare.')
INSERT [dbo].[Category] ([CategoryID], [Type], [Description]) VALUES (3, 3, N'Fantasy fiction is most about things which could not happen in real world')
INSERT [dbo].[Category] ([CategoryID], [Type], [Description]) VALUES (4, 4, N'Adventure fiction is a type of romance that usually presents danger')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CategoryType] ON 

INSERT [dbo].[CategoryType] ([Type], [Name]) VALUES (1, N'Fiction')
INSERT [dbo].[CategoryType] ([Type], [Name]) VALUES (2, N'Horror')
INSERT [dbo].[CategoryType] ([Type], [Name]) VALUES (3, N'Fantasy')
INSERT [dbo].[CategoryType] ([Type], [Name]) VALUES (4, N'Adventure')
SET IDENTITY_INSERT [dbo].[CategoryType] OFF
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[CategoryType] ([Type])
GO
USE [master]
GO
ALTER DATABASE [books] SET  READ_WRITE 
GO
