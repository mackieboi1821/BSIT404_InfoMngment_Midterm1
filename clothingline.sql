USE [master]
GO
/****** Object:  Database [db_clothingline]    Script Date: 2/11/2020 10:58:00 PM ******/
CREATE DATABASE [db_clothingline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_clothingline', FILENAME = N'E:\Programs\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_clothingline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_clothingline_log', FILENAME = N'E:\Programs\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_clothingline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_clothingline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_clothingline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_clothingline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_clothingline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_clothingline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_clothingline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_clothingline] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_clothingline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_clothingline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_clothingline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_clothingline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_clothingline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_clothingline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_clothingline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_clothingline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_clothingline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_clothingline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_clothingline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_clothingline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_clothingline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_clothingline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_clothingline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_clothingline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_clothingline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_clothingline] SET RECOVERY FULL 
GO
ALTER DATABASE [db_clothingline] SET  MULTI_USER 
GO
ALTER DATABASE [db_clothingline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_clothingline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_clothingline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_clothingline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_clothingline] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_clothingline', N'ON'
GO
ALTER DATABASE [db_clothingline] SET QUERY_STORE = OFF
GO
USE [db_clothingline]
GO
/****** Object:  Table [dbo].[tbl_employee]    Script Date: 2/11/2020 10:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](20) NULL,
	[Lname] [varchar](20) NULL,
	[address] [varchar](20) NULL,
	[email] [varchar](20) NULL,
	[contact] [decimal](18, 0) NULL,
	[position] [varchar](20) NULL,
	[role] [varchar](20) NULL,
	[rate] [decimal](11, 10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_products]    Script Date: 2/11/2020 10:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[description] [varchar](120) NULL,
	[size] [varchar](20) NULL,
	[price] [decimal](11, 2) NULL,
	[timestamps] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_suppliers]    Script Date: 2/11/2020 10:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_suppliers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[description] [varchar](120) NULL,
	[address] [varchar](20) NULL,
	[contact] [decimal](18, 0) NULL,
	[timestamps] [datetime] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [db_clothingline] SET  READ_WRITE 
GO
