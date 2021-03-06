CREATE TABLE [dbo].[UserLevels](
	[UserLevelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_UserLevels_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_UserLevels] PRIMARY KEY CLUSTERED 
(
	[UserLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
