CREATE TABLE [dbo].[ServiceOrderStatus] (
    [ServiceOrderStatusId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]                 VARCHAR (50)  NOT NULL,
    [Description]          VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_ServiceOrderStatus] PRIMARY KEY CLUSTERED ([ServiceOrderStatusId] ASC)
);

