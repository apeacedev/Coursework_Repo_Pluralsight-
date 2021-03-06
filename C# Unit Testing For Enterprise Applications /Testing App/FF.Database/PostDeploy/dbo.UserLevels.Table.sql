PRINT 'Merging DATA in table [dbo].[UserLevels] ...';
SET IDENTITY_INSERT [dbo].[UserLevels] ON

MERGE [dbo].[UserLevels] AS T
USING
(
	SELECT * 
	FROM (
	VALUES 
(1, N'System', 0, 1)
,(2, N'Owner', 1, 1)
,(3, N'Administrator', 2, 1)
,(4, N'Moderator', 3, 1)
,(5, N'Power User', 4, 1)
,(6, N'New User', 5, 1)
,(7, N'Unverified', 6, 1)) AS vtable 
	([UserLevelId], [Name], [Rank], [IsActive])
) AS S
ON T.[UserLevelId] = S.[UserLevelId]
WHEN NOT MATCHED THEN INSERT
	([UserLevelId], [Name], [Rank], [IsActive])
	VALUES
	(S.[UserLevelId], S.[Name], S.[Rank], S.[IsActive])
WHEN MATCHED THEN UPDATE SET
	 T.[Name]			   = S.[Name]			,
	 T.[Rank]		       = S.[Rank]			,
	 T.[IsActive]	       = S.[IsActive]
	 ;

DELETE FROM [dbo].[UserLevels]
WHERE [UserLevelId] > 7;


SET IDENTITY_INSERT [dbo].[UserLevels] OFF
