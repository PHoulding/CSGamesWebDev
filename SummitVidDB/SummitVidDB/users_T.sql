/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.

The bucket count should be set to about two times the 
maximum expected number of distinct values in the 
index key, rounded up to the nearest power of two.
*/

CREATE TABLE [dbo].[users_t]
(
	[Id] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 131072), 
    [username] VARCHAR(50) NOT NULL, 
    [password_hash] BINARY(50) NOT NULL, 
    INDEX [IX_users_t_username] NONCLUSTERED HASH (username) WITH (BUCKET_COUNT = 131072)
) WITH (MEMORY_OPTIMIZED = ON)