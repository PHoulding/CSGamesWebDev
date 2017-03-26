/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.

The bucket count should be set to about two times the 
maximum expected number of distinct values in the 
index key, rounded up to the nearest power of two.
*/

CREATE TABLE [dbo].[video_tags_t]
(
	[Id] INT NOT NULL PRIMARY KEY, --NONCLUSTERED HASH WITH (BUCKET_COUNT = 131072), 
    [Video_Id] INT NULL, 
    [Tag_Id] INT NULL,
	CONSTRAINT [FK_VideoTag_Video] FOREIGN KEY ([Video_Id]) REFERENCES [dbo].[video_t]([Id]),
	CONSTRAINT [FK_VideoTag_Tag] FOREIGN KEY ([Tag_Id]) REFERENCES [dbo].[tags_t]([Id])  
) --WITH (MEMORY_OPTIMIZED = ON)