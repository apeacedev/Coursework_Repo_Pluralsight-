PRINT 'Merging DATA in table [dbo].[Votes] ...';
SET IDENTITY_INSERT [dbo].[Votes] ON 

MERGE [dbo].[Votes] AS T
USING
(
	SELECT * 
	FROM (
	VALUES 
(1, 1, 3, 1, 3, CAST(N'2016-06-24 20:50:40.343' AS DateTime), 3, CAST(N'2016-06-24 20:50:40.343' AS DateTime), 1, 1)
,(2, 2, 4, 1, 2, CAST(N'2016-06-24 20:50:56.520' AS DateTime), 2, CAST(N'2016-06-24 20:50:56.520' AS DateTime), 1, 1)
,(3, 3, 5, 1, 5, CAST(N'2016-06-24 20:51:07.657' AS DateTime), 5, CAST(N'2016-06-24 20:51:07.657' AS DateTime), 1, 1)
,(4, 4, 4, 1, 4, CAST(N'2016-06-24 20:51:31.213' AS DateTime), 4, CAST(N'2016-06-24 20:51:31.213' AS DateTime), 1, 1)
,(5, 4, 3, 0, 3, CAST(N'2016-06-24 20:51:37.957' AS DateTime), 3, CAST(N'2016-06-24 20:51:37.957' AS DateTime), 1, 1)
,(6, 4, 2, 0, 2, CAST(N'2016-06-24 20:51:47.240' AS DateTime), 2, CAST(N'2016-06-24 20:51:47.240' AS DateTime), 1, 1)
,(7, 4, 5, 0, 5, CAST(N'2016-06-24 20:51:58.310' AS DateTime), 5, CAST(N'2016-06-24 20:51:58.310' AS DateTime), 1, 1)
,(8, 4, 6, 0, 6, CAST(N'2016-06-24 20:52:15.980' AS DateTime), 6, CAST(N'2016-06-24 20:52:15.980' AS DateTime), 1, 1)) AS vtable 
([VoteId], [ReviewId], [UserId], [UpVote], [AddedBy], [AddedWhen], [UpdatedBy], [UpdatedWhen], [IsApproved], [IsActive])
) AS S
ON T.[VoteId] = S.[VoteId]
WHEN NOT MATCHED THEN INSERT
	([VoteId], [ReviewId], [UserId], [UpVote], [AddedBy], [AddedWhen], [UpdatedBy], [UpdatedWhen], [IsApproved], [IsActive])
	VALUES
	(S.[VoteId], S.[ReviewId], S.[UserId], S.[UpVote], S.[AddedBy], S.[AddedWhen], S.[UpdatedBy], S.[UpdatedWhen], S.[IsApproved], S.[IsActive])
WHEN MATCHED THEN UPDATE SET
	 T.[ReviewId]		   = S.[ReviewId]			,
	 T.[UserId]			   = S.[UserId]				,
	 T.[UpVote]			   = S.[UpVote]				,
	 T.[AddedBy] 	       = S.[AddedBy] 	        ,
	 T.[AddedWhen] 	       = S.[AddedWhen] 	        ,
	 T.[UpdatedBy]	       = S.[UpdatedBy]	        ,
	 T.[UpdatedWhen]       = S.[UpdatedWhen]        ,
	 T.[IsApproved]	       = S.[IsApproved]	        ,
	 T.[IsActive]	       = S.[IsActive]
	 ;

DELETE FROM [dbo].[Votes]
WHERE [VoteId] > 8;


SET IDENTITY_INSERT [dbo].[Votes] OFF

