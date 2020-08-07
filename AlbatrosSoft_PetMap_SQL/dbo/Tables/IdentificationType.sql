CREATE TABLE [dbo].[IdentificationType] (
    [IdentificationTypeId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]                 VARCHAR (200) NOT NULL,
    [Alias]                VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_IdentificationType] PRIMARY KEY CLUSTERED ([IdentificationTypeId] ASC)
);

