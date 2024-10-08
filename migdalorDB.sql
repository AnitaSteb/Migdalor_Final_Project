USE [master]
GO
/****** Object:  Database [migdalorDB]    Script Date: 9/2/2024 8:57:45 PM ******/
CREATE DATABASE [migdalorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'migdalorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\migdalorDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'migdalorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\migdalorDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [migdalorDB] SET COMPATIBILITY_LEVEL = 160
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
USE [migdalorDB]
GO
/****** Object:  Table [dbo].[tblActivity]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActivity](
	[Id] [int] NOT NULL,
	[Date] [date] NULL,
	[ActivityName] [varchar](50) NULL,
	[Time] [time](7) NULL,
	[MaxParticipants] [int] NULL,
	[DepartmentID] [int] NULL,
	[Description] [varchar](300) NULL,
	[Interests] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAnnouncement]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnnouncement](
	[Id] [int] NOT NULL,
	[Date] [date] NULL,
	[Content] [text] NULL,
	[DepartmentID] [int] NULL,
	[Subject] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[Id] [int] NOT NULL,
	[DepartmentName] [varchar](255) NULL,
	[ManagerPhoneNumber] [varchar](20) NULL,
	[DepartmentManager] [varchar](20) NULL,
	[DepartmentDays] [varchar](50) NULL,
	[DepartmentHours] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFacility]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFacility](
	[FacilityID] [int] NOT NULL,
	[FacilityName] [varchar](100) NULL,
	[OpeningHours] [time](7) NULL,
	[ClosingHours] [time](7) NULL,
	[OperatingDays] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGoodMorningPolicy]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGoodMorningPolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[ResidentNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHobby]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHobby](
	[HobbyNumber] [int] NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[HobbyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInitiative]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInitiative](
	[InitiativeNumber] [int] NOT NULL,
	[InitiativeName] [varchar](100) NULL,
	[Location] [varchar](255) NULL,
	[Date] [date] NULL,
	[StartHour] [time](7) NULL,
	[EndHour] [time](7) NULL,
	[InitiativeType] [varchar](50) NULL,
	[InvitationDescription] [text] NULL,
	[ResidentNumber] [int] NULL,
	[MaxParticipants] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InitiativeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblObituary]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblObituary](
	[ObituaryNumber] [int] NOT NULL,
	[Date] [date] NULL,
	[Description] [text] NULL,
	[DepartmentID] [int] NULL,
	[CemeteryName] [varchar](100) NULL,
	[ShivaAddress] [varchar](100) NULL,
	[DeceasedName] [varchar](100) NULL,
	[ResidentId] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ObituaryNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResident]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResident](
	[Id] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[DateOfBirth] [date] NULL,
	[PreviousAddress] [varchar](255) NULL,
	[Seniority] [int] NULL,
	[CurrentAddress] [varchar](255) NULL,
	[ResidentImage] [varbinary](max) NULL,
	[Profession] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[AboutMe] [text] NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[DepartmentID] [int] NULL,
	[ResidentId] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidentCommittee]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResidentCommittee](
	[CommitteeID] [int] NOT NULL,
	[CommitteeName] [varchar](100) NULL,
	[ResidentManager] [int] NULL,
	[ResponsibilityDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[CommitteeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidentHasHobby]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResidentHasHobby](
	[HobbyNumber] [int] NOT NULL,
	[ResidentNumber] [int] NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[HobbyNumber] ASC,
	[ResidentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidentParticipatingInActivity]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResidentParticipatingInActivity](
	[ResidentNumber] [int] NOT NULL,
	[ActivityNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ResidentNumber] ASC,
	[ActivityNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidentParticipatingInInitiative]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResidentParticipatingInInitiative](
	[ResidentNumber] [int] NOT NULL,
	[InitiativeNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ResidentNumber] ASC,
	[InitiativeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidentPartOfResidentCommittee]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResidentPartOfResidentCommittee](
	[CommitteeID] [int] NOT NULL,
	[ResidentNumber] [int] NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommitteeID] ASC,
	[ResidentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 9/2/2024 8:57:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[RoleNumber] [int] NULL,
	[RoleName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblActivity] ([Id], [Date], [ActivityName], [Time], [MaxParticipants], [DepartmentID], [Description], [Interests]) VALUES (57, CAST(N'2024-08-31' AS Date), N'בינגו', CAST(N'20:10:00' AS Time), 20, NULL, N'יש היום בינגו', N'בינגו')
INSERT [dbo].[tblActivity] ([Id], [Date], [ActivityName], [Time], [MaxParticipants], [DepartmentID], [Description], [Interests]) VALUES (1581, CAST(N'2024-09-01' AS Date), N'פעילות חדשה לדוגמה', CAST(N'16:41:00' AS Time), 1, NULL, N'בדיקה', N'בדיקה')
INSERT [dbo].[tblActivity] ([Id], [Date], [ActivityName], [Time], [MaxParticipants], [DepartmentID], [Description], [Interests]) VALUES (4789, CAST(N'2024-08-29' AS Date), N'בדיקה', CAST(N'15:25:00' AS Time), 2, NULL, N'bhfgdhhg', N'cdscdcs')
INSERT [dbo].[tblActivity] ([Id], [Date], [ActivityName], [Time], [MaxParticipants], [DepartmentID], [Description], [Interests]) VALUES (5113, CAST(N'2024-09-06' AS Date), N'FSFSD', CAST(N'16:52:00' AS Time), 4, NULL, N'fgsdgsdf', N'check')
INSERT [dbo].[tblActivity] ([Id], [Date], [ActivityName], [Time], [MaxParticipants], [DepartmentID], [Description], [Interests]) VALUES (5791, CAST(N'2024-09-01' AS Date), N'בדיקה מקסימום משתתפים', CAST(N'22:07:00' AS Time), 0, NULL, N'בדיקה', N'בדיקה')
INSERT [dbo].[tblActivity] ([Id], [Date], [ActivityName], [Time], [MaxParticipants], [DepartmentID], [Description], [Interests]) VALUES (6967, CAST(N'2024-08-28' AS Date), N'string', CAST(N'10:00:00' AS Time), 2, NULL, N'string', N'string')
GO
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (26515501, CAST(N'2024-09-02' AS Date), N'עריכה', NULL, N'עריכה')
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (97352191, CAST(N'2024-09-01' AS Date), N'הודעה', NULL, NULL)
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (122428348, CAST(N'2024-08-31' AS Date), N'cshev', NULL, NULL)
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (267453984, CAST(N'2024-08-31' AS Date), N'סתם הודעה', NULL, NULL)
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (523162001, CAST(N'2024-08-27' AS Date), N'בדיקה', NULL, NULL)
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (741562879, CAST(N'2024-09-02' AS Date), N'daadsd', NULL, N'dasdsa')
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (1339773988, CAST(N'2024-08-29' AS Date), N'message', NULL, NULL)
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (1369379399, CAST(N'2024-08-31' AS Date), N'c=בדיקה', NULL, NULL)
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (1493180708, CAST(N'2024-08-31' AS Date), N'בדיקה', NULL, NULL)
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (1587183698, CAST(N'2024-08-29' AS Date), N'another message', NULL, NULL)
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (1703706451, CAST(N'2024-08-31' AS Date), N'הי כולם
יש בינגו ב 20:00', NULL, NULL)
INSERT [dbo].[tblAnnouncement] ([Id], [Date], [Content], [DepartmentID], [Subject]) VALUES (1970617450, CAST(N'2024-08-29' AS Date), N'Hello Everybody', NULL, NULL)
GO
INSERT [dbo].[tblFacility] ([FacilityID], [FacilityName], [OpeningHours], [ClosingHours], [OperatingDays], [PhoneNumber], [DepartmentID]) VALUES (405918997, N'מרפאה', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), N'ראשון - חמישי', N'04-6062629', NULL)
GO
INSERT [dbo].[tblInitiative] ([InitiativeNumber], [InitiativeName], [Location], [Date], [StartHour], [EndHour], [InitiativeType], [InvitationDescription], [ResidentNumber], [MaxParticipants]) VALUES (4202, N'בדיקה', N'Ramat Gan, ISR', CAST(N'2024-09-10' AS Date), CAST(N'02:12:00' AS Time), CAST(N'05:15:00' AS Time), NULL, N'dasdadsa', 886119921, 5)
GO
INSERT [dbo].[tblObituary] ([ObituaryNumber], [Date], [Description], [DepartmentID], [CemeteryName], [ShivaAddress], [DeceasedName], [ResidentId]) VALUES (5385, CAST(N'2024-09-01' AS Date), N'string', NULL, N'string', N'string', N'string', N'string')
GO
INSERT [dbo].[tblResident] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID], [ResidentId]) VALUES (415124019, N'פאר זוהר', N'פיכמן', N'0526770546', CAST(N'2024-09-26' AS Date), N'רמת גן', NULL, NULL, NULL, N'שינוי', N'peerfikhman@gmail.com', NULL, N'666', N'a165e952', NULL, N'666')
INSERT [dbo].[tblResident] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID], [ResidentId]) VALUES (874923989, N'פאר זוהר', N'פיכמן', N'0526770546', CAST(N'2024-09-10' AS Date), N'שינוי', NULL, NULL, NULL, N'sdadadsa', N'peerfikhman@gmail.com', NULL, N'77777777', N'800fad8b', NULL, N'204683650')
INSERT [dbo].[tblResident] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID], [ResidentId]) VALUES (886119921, N'פאר', N'פיכמן', N'0526770546', NULL, NULL, NULL, N'רמת גן', NULL, N'מתכנת', N'peerfikhman@gmail.com', NULL, N'204683650', N'02cf8e28', NULL, NULL)
INSERT [dbo].[tblResident] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID], [ResidentId]) VALUES (2014044100, N'אניטה', N'אנטה', N'0526770546', CAST(N'2024-08-30' AS Date), N'רמת גן', NULL, NULL, NULL, N'מתכנת', N'anita10012@gmail.com', NULL, N'555555555', N'c6be6ae2', NULL, N'555555555')
GO
INSERT [dbo].[tblResidentCommittee] ([CommitteeID], [CommitteeName], [ResidentManager], [ResponsibilityDescription]) VALUES (11747379, N'בדיקה', 2014044100, N'בדיקה')
GO
INSERT [dbo].[tblResidentParticipatingInActivity] ([ResidentNumber], [ActivityNumber]) VALUES (886119921, 1581)
GO
INSERT [dbo].[tblResidentParticipatingInInitiative] ([ResidentNumber], [InitiativeNumber]) VALUES (886119921, 4202)
GO
INSERT [dbo].[tblResidentPartOfResidentCommittee] ([CommitteeID], [ResidentNumber], [isActive]) VALUES (11747379, 2014044100, 0)
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (1, N'SuperAdmin', N'SuperAdmin', 1, N'Super Admin')
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (3, N'SuperAdmin1', N'SuperAdmin1', 1, N'Super Admin')
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (4, N'string', N'string', 0, N'string')
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (5, N'SuperAdmin2', N'SuperAdmin', 1, N'Super Admin')
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (6, N'Welfare', N'Welfare', 2, N'Department manager')
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
/****** Object:  Index [UQ_Date_ResidentNumber]    Script Date: 9/2/2024 8:57:45 PM ******/
ALTER TABLE [dbo].[tblGoodMorningPolicy] ADD  CONSTRAINT [UQ_Date_ResidentNumber] UNIQUE NONCLUSTERED 
(
	[Date] ASC,
	[ResidentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUsers__536C85E4B9BDDEC0]    Script Date: 9/2/2024 8:57:45 PM ******/
ALTER TABLE [dbo].[tblUsers] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblResidentHasHobby] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblResidentPartOfResidentCommittee] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblActivity]  WITH NOCHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([Id])
GO
ALTER TABLE [dbo].[tblAnnouncement]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([Id])
GO
ALTER TABLE [dbo].[tblFacility]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([Id])
GO
ALTER TABLE [dbo].[tblGoodMorningPolicy]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblInitiative]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([Id])
GO
ALTER TABLE [dbo].[tblObituary]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([Id])
GO
ALTER TABLE [dbo].[tblResident]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([Id])
GO
ALTER TABLE [dbo].[tblResidentCommittee]  WITH CHECK ADD FOREIGN KEY([ResidentManager])
REFERENCES [dbo].[tblResident] ([Id])
GO
ALTER TABLE [dbo].[tblResidentHasHobby]  WITH CHECK ADD FOREIGN KEY([HobbyNumber])
REFERENCES [dbo].[tblHobby] ([HobbyNumber])
GO
ALTER TABLE [dbo].[tblResidentHasHobby]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([Id])
GO
ALTER TABLE [dbo].[tblResidentParticipatingInActivity]  WITH CHECK ADD FOREIGN KEY([ActivityNumber])
REFERENCES [dbo].[tblActivity] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblResidentParticipatingInActivity]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblResidentParticipatingInInitiative]  WITH CHECK ADD FOREIGN KEY([InitiativeNumber])
REFERENCES [dbo].[tblInitiative] ([InitiativeNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblResidentParticipatingInInitiative]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblResidentPartOfResidentCommittee]  WITH CHECK ADD FOREIGN KEY([CommitteeID])
REFERENCES [dbo].[tblResidentCommittee] ([CommitteeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblResidentPartOfResidentCommittee]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [migdalorDB] SET  READ_WRITE 
GO
