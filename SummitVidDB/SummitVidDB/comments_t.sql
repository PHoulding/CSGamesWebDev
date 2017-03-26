/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.

The bucket count should be set to about two times the 
maximum expected number of distinct values in the 
index key, rounded up to the nearest power of two.
*/

CREATE TABLE [dbo].[comments_t]
(
	[Id] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 131072), 
    [Author_Id] INT NOT NULL, 
    [Video_Id] INT NOT NULL, 
    [Comment] NVARCHAR(50) NOT NULL, 
    [Associated_Frame_Seconds] INT NULL, 
    [Created] DATETIME NOT NULL,
	CONSTRAINT [FK_Users_Comments] FOREIGN KEY ([Author_Id]) REFERENCES [dbo].[users_t]([Id]),
	CONSTRAINT [FK_Videos_Comments] FOREIGN KEY ([Video_Id]) REFERENCES [dbo].[video_t]([Id]),  
) WITH (MEMORY_OPTIMIZED = ON)