PRINT 'Merging DATA in table [dbo].[FruitVarieties] ...';
SET IDENTITY_INSERT [dbo].[FruitVarieties] ON

MERGE [dbo].[FruitVarieties] AS T
USING
(
	SELECT * 
	FROM (
	VALUES 
(1, 1, N'Granny Smith', NULL, NULL, N'https://en.wikipedia.org/wiki/Granny_Smith', NULL, NULL, 1, CAST(N'2016-06-23 12:27:53.223' AS DateTime), 1, CAST(N'2016-06-23 12:27:53.223' AS DateTime), 1, 1)
,(2, 1, N'Fuji', NULL, NULL, N'https://en.wikipedia.org/wiki/Fuji_(apple)', NULL, NULL, 1, CAST(N'2016-06-23 12:28:04.230' AS DateTime), 1, CAST(N'2016-06-23 12:28:04.230' AS DateTime), 1, 1)
,(3, 1, N'Honeycrisp', NULL, NULL, N'https://en.wikipedia.org/wiki/Honeycrisp', NULL, NULL, 1, CAST(N'2016-06-23 12:28:13.203' AS DateTime), 1, CAST(N'2016-06-23 12:28:13.203' AS DateTime), 1, 1)
,(4, 49, N'Clementine', NULL, NULL, N'https://en.wikipedia.org/wiki/Clementine', NULL, NULL, 1, CAST(N'2016-06-23 12:28:57.203' AS DateTime), 1, CAST(N'2016-06-23 12:28:57.203' AS DateTime), 1, 1)
,(5, 49, N'Tangerine', NULL, NULL, N'https://en.wikipedia.org/wiki/Tangerine', NULL, NULL, 1, CAST(N'2016-06-23 12:29:04.310' AS DateTime), 1, CAST(N'2016-06-23 12:29:04.310' AS DateTime), 1, 1)
,(6, 49, N'Blood', NULL, NULL, N'https://en.wikipedia.org/wiki/Blood_orange', NULL, NULL, 1, CAST(N'2016-06-23 12:30:12.033' AS DateTime), 1, CAST(N'2016-06-23 12:30:12.033' AS DateTime), 1, 1)
,(7, 49, N'Naval', NULL, NULL, N'https://en.wikipedia.org/wiki/Orange_(fruit)#Navel_oranges', NULL, NULL, 1, CAST(N'2016-06-23 12:30:47.233' AS DateTime), 1, CAST(N'2016-06-23 12:30:47.233' AS DateTime), 1, 1)) AS vtable 
	([FruitVarietyId], [FruitId], [Name], [Summary], [Description], [WikiLink], [StockImage], [AkaFruitVarietyId], [AddedBy], [AddedWhen], [UpdatedBy], [UpdatedWhen], [IsApproved], [IsActive])
) AS S
ON T.[FruitVarietyId] = S.[FruitVarietyId]
WHEN NOT MATCHED THEN INSERT
	([FruitVarietyId], [FruitId], [Name], [Summary], [Description], [WikiLink], [StockImage], [AkaFruitVarietyId], [AddedBy], [AddedWhen], [UpdatedBy], [UpdatedWhen], [IsApproved], [IsActive])
	VALUES
	(S.[FruitVarietyId], S.[FruitId], S.[Name], S.[Summary], S.[Description], S.[WikiLink], S.[StockImage], S.[AkaFruitVarietyId], S.[AddedBy], S.[AddedWhen], S.[UpdatedBy], S.[UpdatedWhen], S.[IsApproved], S.[IsActive])
WHEN MATCHED THEN UPDATE SET
	 T.[FruitId]           = S.[FruitId]			,
	 T.[Name]			   = S.[Name]				,
	 T.[Summary]		   = S.[Summary]			,
	 T.[Description]	   = S.[Description]		,
	 T.[WikiLink]		   = S.[WikiLink]			,
	 T.[StockImage]		   = S.[StockImage]			,
	 T.[AkaFruitVarietyId] = S.[AkaFruitVarietyId]	,
	 T.[AddedBy] 	       = S.[AddedBy] 	        ,
	 T.[AddedWhen] 	       = S.[AddedWhen] 	        ,
	 T.[UpdatedBy]	       = S.[UpdatedBy]	        ,
	 T.[UpdatedWhen]       = S.[UpdatedWhen]        ,
	 T.[IsApproved]	       = S.[IsApproved]	        ,
	 T.[IsActive]	       = S.[IsActive]
	 ;

DELETE FROM [dbo].[FruitVarieties]
WHERE [FruitVarietyId] > 7

SET IDENTITY_INSERT [dbo].[FruitVarieties] OFF

