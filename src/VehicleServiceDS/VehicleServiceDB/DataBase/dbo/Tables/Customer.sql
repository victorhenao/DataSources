CREATE TABLE [dbo].[Customer] (
    [CustomerId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (250) NOT NULL,
    [Address]    VARCHAR (250) NOT NULL,
    [PhoneNumer] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);

