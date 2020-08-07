CREATE TABLE [dbo].[AppUser] (
    [UserID]   INT        IDENTITY (1, 1) NOT NULL,
    [UserName] NCHAR (10) NULL,
    [Password] NCHAR (10) NULL,
    CONSTRAINT [PK_AppUser] PRIMARY KEY CLUSTERED ([UserID] ASC)
);

