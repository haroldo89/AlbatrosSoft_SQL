CREATE TABLE [dbo].[AppUser] (
    [UserId]             INT          IDENTITY (1, 1) NOT NULL,
    [Username]           VARCHAR (20) NOT NULL,
    [Password]           VARCHAR (20) NOT NULL,
    [CreationDate]       DATETIME     NOT NULL,
    [ExpirationDate]     DATETIME     NOT NULL,
    [ChangePasswordDate] DATETIME     NULL,
    [Active]             BIT          NOT NULL,
    [ContactId]          INT          NOT NULL,
    [RoleId]             INT          NOT NULL,
    CONSTRAINT [PK_AppUser] PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [FK_APPUSER_REFERENCE_APPUSERR] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AppUserRole] ([RoleId]),
    CONSTRAINT [FK_APPUSER_REFERENCE_CONTACT] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([ContactId])
);


GO
CREATE NONCLUSTERED INDEX [IX_FK_APPUSER_REFERENCE_APPUSERR]
    ON [dbo].[AppUser]([RoleId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FK_APPUSER_REFERENCE_CONTACT]
    ON [dbo].[AppUser]([ContactId] ASC);

