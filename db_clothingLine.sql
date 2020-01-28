USE [master]
GO
/****** Object:  Database [db_clothingLine]    Script Date: 1/28/2020 3:07:39 PM ******/
CREATE DATABASE [db_clothingLine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_clothingLine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\db_clothingLine.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_clothingLine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\db_clothingLine_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_clothingLine] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_clothingLine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_clothingLine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_clothingLine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_clothingLine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_clothingLine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_clothingLine] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_clothingLine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_clothingLine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_clothingLine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_clothingLine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_clothingLine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_clothingLine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_clothingLine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_clothingLine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_clothingLine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_clothingLine] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_clothingLine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_clothingLine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_clothingLine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_clothingLine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_clothingLine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_clothingLine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_clothingLine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_clothingLine] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_clothingLine] SET  MULTI_USER 
GO
ALTER DATABASE [db_clothingLine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_clothingLine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_clothingLine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_clothingLine] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [db_clothingLine] SET DELAYED_DURABILITY = DISABLED 
GO
USE [db_clothingLine]
GO
/****** Object:  Table [dbo].[tbl_employee]    Script Date: 1/28/2020 3:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_employee](
	[id] [int] NOT NULL,
	[first_name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[contact] [decimal](18, 0) NULL,
	[postion] [varchar](255) NULL,
	[role] [varchar](255) NULL,
	[rate] [decimal](11, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 1/28/2020 3:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_product](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[size] [decimal](18, 0) NULL,
	[price] [decimal](11, 2) NULL,
	[timestamps] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_suppliers]    Script Date: 1/28/2020 3:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_suppliers](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[contact] [decimal](18, 0) NULL,
	[timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [db_clothingLine] SET  READ_WRITE 
GO
