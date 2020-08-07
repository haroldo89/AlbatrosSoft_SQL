CREATE TABLE [dbo].[Contact] (
    [ContactId]            INT           IDENTITY (1, 1) NOT NULL,
    [Identification]       VARCHAR (50)  NOT NULL,
    [IdentificationTypeId] INT           NOT NULL,
    [FirstName]            VARCHAR (200) NOT NULL,
    [LastName]             VARCHAR (200) NOT NULL,
    [Email]                VARCHAR (200) NOT NULL,
    [Phone]                VARCHAR (50)  NULL,
    [MobileNumber]         VARCHAR (50)  NULL,
    [Active]               BIT           NOT NULL,
    [ContactTypeId]        INT           NOT NULL,
    [CustomerId]           INT           NOT NULL,
    [ExternalCode]         VARCHAR (15)  NULL,
    CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ([ContactId] ASC),
    CONSTRAINT [FK_CONTACT_REFERENCE_CONTACTT] FOREIGN KEY ([ContactTypeId]) REFERENCES [dbo].[ContactType] ([ContactTypeId]),
    CONSTRAINT [FK_CONTACT_REFERENCE_CUSTOMER] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId]),
    CONSTRAINT [FK_CONTACT_REFERENCE_IDENTIFI] FOREIGN KEY ([IdentificationTypeId]) REFERENCES [dbo].[IdentificationType] ([IdentificationTypeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_FK_CONTACT_REFERENCE_CONTACTT]
    ON [dbo].[Contact]([ContactTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FK_CONTACT_REFERENCE_CUSTOMER]
    ON [dbo].[Contact]([CustomerId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FK_CONTACT_REFERENCE_IDENTIFI]
    ON [dbo].[Contact]([IdentificationTypeId] ASC);

