CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[PlaceId] [varchar](150) NULL,
	[Name] [nvarchar](150) NULL,
	[Coordinates] [geography] NULL,
	[Description] [nvarchar](500) NULL,
	[IsPermanent] [bit] NOT NULL CONSTRAINT [DF_Locations_IsPermanent]  DEFAULT ((1)),
	[AkaLocationId] [int] NULL,
	[AddedBy] [int] NOT NULL,
	[AddedWhen] [datetime] NOT NULL CONSTRAINT [DF_Locations_AddedWhen]  DEFAULT (getutcdate()),
	[UpdatedBy] [int] NOT NULL,
	[UpdatedWhen] [datetime] NOT NULL CONSTRAINT [DF_Locations_UpdatedWhen]  DEFAULT (getutcdate()),
	[IsApproved] [bit] NOT NULL CONSTRAINT [DF_Locations_IsApproved]  DEFAULT ((1)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Locations_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED (	[LocationId] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 Go
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Locations] FOREIGN KEY([AkaLocationId])REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Locations]
GO
