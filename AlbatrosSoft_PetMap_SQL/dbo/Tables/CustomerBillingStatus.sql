CREATE TABLE [dbo].[CustomerBillingStatus] (
    [BillingStatusId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (200) NOT NULL,
    [Alias]           VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_CustomerBillingStatus] PRIMARY KEY CLUSTERED ([BillingStatusId] ASC)
);

