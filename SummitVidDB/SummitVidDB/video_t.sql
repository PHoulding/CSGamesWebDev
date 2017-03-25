/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.

The bucket count should be set to about two times the 
maximum expected number of distinct values in the 
index key, rounded up to the nearest power of two.
*/

CREATE TABLE [dbo].[video_t]
(
	[Id] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 131072), 
    [User_Id] INT NOT NULL, 
    [Title] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(MAX) NULL, 
    [Duration_seconds] INT NOT NULL, 
    [Thumbnail] NVARCHAR(MAX) NOT NULL, 
    [File_Location] NVARCHAR(MAX) NOT NULL, 
    [View_Count] INT NOT NULL DEFAULT 0, 
    [uploaded] DATETIME NOT NULL, 
    [likes_count] INT NOT NULL DEFAULT 0, 
    [dislikes_count] INT NOT NULL DEFAULT 0,
	CONSTRAINT [FK_Users_Videos] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[users_t]([Id]), 
) WITH (MEMORY_OPTIMIZED = ON)