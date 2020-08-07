CREATE TABLE [dbo].[Customer] (
    [CustomerId]   INT           IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (50)  NULL,
    [Lastname]     VARCHAR (50)  NULL,
    [Address]      VARCHAR (250) NULL,
    [Telephone1]   VARCHAR (50)  NULL,
    [Telephone2]   VARCHAR (50)  NULL,
    [MobilePhone1] VARCHAR (50)  NULL,
    [MobilePhone2] VARCHAR (50)  NULL,
    [Document]     INT           NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);

