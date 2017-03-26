/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.

The bucket count should be set to about two times the 
maximum expected number of distinct values in the 
index key, rounded up to the nearest power of two.
*/

CREATE TABLE [dbo].[watch_history_t]
(
	[Id] INT NOT NULL PRIMARY KEY, --NONCLUSTERED HASH WITH (BUCKET_COUNT = 131072), 
    [User_id] INT NOT NULL, 
    [Video_id] INT NOT NULL, 
    [Watched] DATETIME NOT NULL,
	CONSTRAINT [FK_Users_WatchHistory] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[users_t]([Id]), 
	CONSTRAINT [FK_Videos_WatchHistory] FOREIGN KEY ([Video_Id]) REFERENCES [dbo].[video_t]([Id])
) --WITH (MEMORY_OPTIMIZED = ON)