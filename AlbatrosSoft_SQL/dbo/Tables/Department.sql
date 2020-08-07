CREATE TABLE [dbo].[Department] (
    [DepartmentId] INT           IDENTITY (1, 1) NOT NULL,
    [Description]  VARCHAR (250) NULL,
    CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([DepartmentId] ASC)
);

