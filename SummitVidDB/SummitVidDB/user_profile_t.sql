/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.

The bucket count should be set to about two times the 
maximum expected number of distinct values in the 
index key, rounded up to the nearest power of two.
*/

CREATE TABLE [dbo].[user_profile_t]
(
	[Id] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 131072),
	[User_Id] INT NOT NULL,
	[Bio] NVARCHAR(MAX) NULL, 
    [picture_location] NVARCHAR(MAX) NULL, 
    CONSTRAINT [FK_Users_Profiles] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[users_t]([Id]), 
) WITH (MEMORY_OPTIMIZED = ON)