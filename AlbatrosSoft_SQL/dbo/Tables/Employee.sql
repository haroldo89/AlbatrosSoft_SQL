CREATE TABLE [dbo].[Employee] (
    [EmployeeId]   INT           IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (50)  NULL,
    [Lastname]     VARCHAR (50)  NULL,
    [Address]      VARCHAR (250) NULL,
    [Telephone1]   VARCHAR (50)  NULL,
    [Telephone2]   VARCHAR (50)  NULL,
    [MobilePhone1] VARCHAR (50)  NULL,
    [MobilePhone2] VARCHAR (50)  NULL,
    [DepartmentId] INT           NULL,
    [Document]     INT           NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([EmployeeId] ASC),
    FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId])
);

