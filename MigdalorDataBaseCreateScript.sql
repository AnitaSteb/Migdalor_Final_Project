USE [master]
GO

/****** Object:  Database [migdalorDB]    Script Date: 9/2/2024 7:33:05 PM ******/
CREATE DATABASE [migdalorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'migdalorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\migdalorDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'migdalorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\migdalorDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [migdalorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [migdalorDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [migdalorDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [migdalorDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [migdalorDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [migdalorDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [migdalorDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [migdalorDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [migdalorDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [migdalorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [migdalorDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [migdalorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [migdalorDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [migdalorDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [migdalorDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [migdalorDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [migdalorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [migdalorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [migdalorDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [migdalorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [migdalorDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [migdalorDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [migdalorDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [migdalorDB] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [migdalorDB] SET  MULTI_USER 
GO

ALTER DATABASE [migdalorDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [migdalorDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [migdalorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [migdalorDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [migdalorDB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [migdalorDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [migdalorDB] SET QUERY_STORE = ON
GO

ALTER DATABASE [migdalorDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

ALTER DATABASE [migdalorDB] SET  READ_WRITE 
GO


