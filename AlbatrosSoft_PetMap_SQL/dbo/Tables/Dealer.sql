CREATE TABLE [dbo].[Dealer] (
    [DealerId]              INT           IDENTITY (1, 1) NOT NULL,
    [Name]                  VARCHAR (200) NOT NULL,
    [Identification]        VARCHAR (50)  NOT NULL,
    [Address]               VARCHAR (200) NOT NULL,
    [Phone]                 VARCHAR (50)  NOT NULL,
    [MobileNumber]          VARCHAR (50)  NULL,
    [Email]                 VARCHAR (200) NOT NULL,
    [PrincipalContactName]  VARCHAR (200) NOT NULL,
    [PrincipalContactPhone] VARCHAR (200) NOT NULL,
    [Active]                BIT           NOT NULL,
    [CityId]                INT           NULL,
    [LogoIconName]          VARCHAR (30)  NULL,
    CONSTRAINT [PK_Dealer] PRIMARY KEY CLUSTERED ([DealerId] ASC)
);

