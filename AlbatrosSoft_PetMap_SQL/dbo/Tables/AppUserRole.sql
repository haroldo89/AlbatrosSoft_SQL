CREATE TABLE [dbo].[AppUserRole] (
    [RoleId]    INT          IDENTITY (1, 1) NOT NULL,
    [RoleName]  VARCHAR (50) NOT NULL,
    [ServiceId] INT          NULL,
    CONSTRAINT [PK_AppUserRole] PRIMARY KEY CLUSTERED ([RoleId] ASC)
);

