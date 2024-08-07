
/****** Object:  Table [dbo].[tblActivity]    Script Date: 10/06/2024 13:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActivity](
	[ActivityNumber] [int] NOT NULL,
	[Date] [date] NULL,
	[ActivityName] [varchar](100) NULL,
	[Time] [time](7) NULL,
	[MaxParticipants] [int] NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAnnouncement]    Script Date: 10/06/2024 13:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnnouncement](
	[AnnouncementID] [int] NOT NULL,
	[Date] [date] NULL,
	[Content] [text] NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AnnouncementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 10/06/2024 13:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [varchar](255) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFacility]    Script Date: 10/06/2024 13:43:59 ******/
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
/****** Object:  Table [dbo].[tblGoodMorningPolicy]    Script Date: 10/06/2024 13:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGoodMorningPolicy](
	[IdentificationNumber] [int] NOT NULL,
	[DateTime] [datetime] NULL,
	[DepartmentID] [int] NULL,
	[ResidentNumber] [int] NULL,
 CONSTRAINT [PK__tblGoodM__9CD146950D8B2485] PRIMARY KEY CLUSTERED 
(
	[IdentificationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHobby]    Script Date: 10/06/2024 13:43:59 ******/
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
/****** Object:  Table [dbo].[tblInitiative]    Script Date: 10/06/2024 13:43:59 ******/
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
PRIMARY KEY CLUSTERED 
(
	[InitiativeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblObituary]    Script Date: 10/06/2024 13:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblObituary](
	[ObituaryNumber] [int] NOT NULL,
	[Date] [date] NULL,
	[Description] [text] NULL,
	[ResidentNumber] [int] NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ObituaryNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResident]    Script Date: 10/06/2024 13:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResident](
	[ResidentNumber] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[ID] [varchar](20) NULL,
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
PRIMARY KEY CLUSTERED 
(
	[ResidentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidentCommittee]    Script Date: 10/06/2024 13:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResidentCommittee](
	[CommitteeID] [int] NOT NULL,
	[CommitteeName] [varchar](100) NULL,
	[MeetingSummery] [text] NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommitteeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidentHasHobby]    Script Date: 10/06/2024 13:43:59 ******/
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
/****** Object:  Table [dbo].[tblResidentParticipatingInActivity]    Script Date: 10/06/2024 13:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResidentParticipatingInActivity](
	[ActivityNumber] [int] NOT NULL,
	[ResidentNumber] [int] NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityNumber] ASC,
	[ResidentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidentParticipatingInInitiative]    Script Date: 10/06/2024 13:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResidentParticipatingInInitiative](
	[InitiativeNumber] [int] NOT NULL,
	[ResidentNumber] [int] NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[InitiativeNumber] ASC,
	[ResidentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidentPartOfResidentCommittee]    Script Date: 10/06/2024 13:43:59 ******/
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/06/2024 13:43:59 ******/
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
INSERT [dbo].[tblActivity] ([ActivityNumber], [Date], [ActivityName], [Time], [MaxParticipants], [DepartmentID]) VALUES (7269, CAST(N'2024-06-15' AS Date), N'Morning Yoga Session', CAST(N'10:30:00' AS Time), 25, NULL)
INSERT [dbo].[tblActivity] ([ActivityNumber], [Date], [ActivityName], [Time], [MaxParticipants], [DepartmentID]) VALUES (7978, CAST(N'2024-07-01' AS Date), N'Afternoon Painting Class', CAST(N'14:30:00' AS Time), 15, NULL)
GO
INSERT [dbo].[tblGoodMorningPolicy] ([IdentificationNumber], [DateTime], [DepartmentID], [ResidentNumber]) VALUES (0, CAST(N'2024-06-02T22:49:09.083' AS DateTime), NULL, 1961469256)
GO
INSERT [dbo].[tblResident] ([ResidentNumber], [FirstName], [LastName], [PhoneNumber], [ID], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID]) VALUES (527729557, N'string', N'string', N'string', N'string', CAST(N'2024-06-02' AS Date), N'string', NULL, NULL, 0x, N'string', N'string', NULL, N'string', N'string', NULL)
INSERT [dbo].[tblResident] ([ResidentNumber], [FirstName], [LastName], [PhoneNumber], [ID], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID]) VALUES (975836016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblResident] ([ResidentNumber], [FirstName], [LastName], [PhoneNumber], [ID], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID]) VALUES (1606914115, N't', N't', N'05t55', N'1234', CAST(N'1994-06-02' AS Date), N'השרון', NULL, NULL, 0x, N'מלחין', N'kg@gmail.com', NULL, N'1234', N'Sub186', NULL)
INSERT [dbo].[tblResident] ([ResidentNumber], [FirstName], [LastName], [PhoneNumber], [ID], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID]) VALUES (1815931484, N'Anita', N'Steblyanko', N'0545424643', N'222', CAST(N'2000-10-11' AS Date), N'חיפה', NULL, NULL, 0x, N'מורה', N'anita10012@gmail.com', NULL, N'222', N'Amz913', NULL)
INSERT [dbo].[tblResident] ([ResidentNumber], [FirstName], [LastName], [PhoneNumber], [ID], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID]) VALUES (1961469256, N'אניטה', N'סטבליאנקו', N'0545424643', N'111', CAST(N'1999-11-11' AS Date), N'כרמיאל', NULL, NULL, 0x, N'סטודנטית', N'anita10012@gmail.com', NULL, N'111', N'dvr213', NULL)
INSERT [dbo].[tblResident] ([ResidentNumber], [FirstName], [LastName], [PhoneNumber], [ID], [DateOfBirth], [PreviousAddress], [Seniority], [CurrentAddress], [ResidentImage], [Profession], [Email], [AboutMe], [Username], [Password], [DepartmentID]) VALUES (2062798989, N'Yael', N'Sela', N'0555', N'123', CAST(N'1990-06-02' AS Date), N'הוד השרון', NULL, NULL, 0x, N'מרצה', N'ys@gmail.com', NULL, N'123', N'Sku186', NULL)
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (1, N'SuperAdmin', N'SuperAdmin', 1, N'Super Admin')
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (3, N'SuperAdmin1', N'SuperAdmin1', 1, N'Super Admin')
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (4, N'string', N'string', 0, N'string')
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (5, N'SuperAdmin2', N'SuperAdmin', 1, N'Super Admin')
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [RoleNumber], [RoleName]) VALUES (6, N'Welfare', N'Welfare', 2, N'Department manager')
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUsers__536C85E45BC6ECF0]    Script Date: 10/06/2024 13:44:00 ******/
ALTER TABLE [dbo].[tblUsers] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblResidentHasHobby] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblResidentParticipatingInActivity] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblResidentParticipatingInInitiative] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblResidentPartOfResidentCommittee] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblActivity]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[tblAnnouncement]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[tblFacility]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[tblGoodMorningPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK__tblGoodMo__Depar__4CA06362] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[tblGoodMorningPolicy] NOCHECK CONSTRAINT [FK__tblGoodMo__Depar__4CA06362]
GO
ALTER TABLE [dbo].[tblInitiative]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([ResidentNumber])
GO
ALTER TABLE [dbo].[tblObituary]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[tblObituary]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([ResidentNumber])
GO
ALTER TABLE [dbo].[tblResident]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[tblResidentCommittee]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[tblResidentHasHobby]  WITH CHECK ADD FOREIGN KEY([HobbyNumber])
REFERENCES [dbo].[tblHobby] ([HobbyNumber])
GO
ALTER TABLE [dbo].[tblResidentHasHobby]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([ResidentNumber])
GO
ALTER TABLE [dbo].[tblResidentParticipatingInActivity]  WITH CHECK ADD FOREIGN KEY([ActivityNumber])
REFERENCES [dbo].[tblActivity] ([ActivityNumber])
GO
ALTER TABLE [dbo].[tblResidentParticipatingInActivity]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([ResidentNumber])
GO
ALTER TABLE [dbo].[tblResidentParticipatingInInitiative]  WITH CHECK ADD FOREIGN KEY([InitiativeNumber])
REFERENCES [dbo].[tblInitiative] ([InitiativeNumber])
GO
ALTER TABLE [dbo].[tblResidentParticipatingInInitiative]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([ResidentNumber])
GO
ALTER TABLE [dbo].[tblResidentPartOfResidentCommittee]  WITH CHECK ADD FOREIGN KEY([CommitteeID])
REFERENCES [dbo].[tblResidentCommittee] ([CommitteeID])
GO
ALTER TABLE [dbo].[tblResidentPartOfResidentCommittee]  WITH CHECK ADD FOREIGN KEY([ResidentNumber])
REFERENCES [dbo].[tblResident] ([ResidentNumber])
GO

