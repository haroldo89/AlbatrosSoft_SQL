CREATE TABLE [dbo].[Customer] (
    [CustomerId]           INT           IDENTITY (1, 1) NOT NULL,
    [Name]                 VARCHAR (200) NOT NULL,
    [Identification]       VARCHAR (50)  NOT NULL,
    [IdentificationTypeId] INT           NOT NULL,
    [Address]              VARCHAR (200) NOT NULL,
    [Phone]                VARCHAR (50)  NULL,
    [MobileNumber]         VARCHAR (50)  NULL,
    [Email]                VARCHAR (200) NOT NULL,
    [CreationDate]         DATETIME      NOT NULL,
    [LogoIconName]         VARCHAR (80)  NULL,
    [Active]               BIT           NOT NULL,
    [BillingStatusId]      INT           NOT NULL,
    [DealerId]             INT           NOT NULL,
    [CityId]               INT           NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC),
    CONSTRAINT [FK_CUSTOMER_REFERENCE_CUSTOMER] FOREIGN KEY ([BillingStatusId]) REFERENCES [dbo].[CustomerBillingStatus] ([BillingStatusId]),
    CONSTRAINT [FK_CUSTOMER_REFERENCE_DEALER] FOREIGN KEY ([DealerId]) REFERENCES [dbo].[Dealer] ([DealerId]),
    CONSTRAINT [FK_CUSTOMER_REFERENCE_IDENTIFI] FOREIGN KEY ([IdentificationTypeId]) REFERENCES [dbo].[IdentificationType] ([IdentificationTypeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_FK_CUSTOMER_REFERENCE_CUSTOMER]
    ON [dbo].[Customer]([BillingStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FK_CUSTOMER_REFERENCE_DEALER]
    ON [dbo].[Customer]([DealerId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FK_CUSTOMER_REFERENCE_IDENTIFI]
    ON [dbo].[Customer]([IdentificationTypeId] ASC);

