CREATE TABLE [dbo].[ServiceOrderCategoryStatus] (
    [ServiceOrderCategoryStatusId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]                         VARCHAR (50)  NOT NULL,
    [Description]                  VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_ServiceOrderCategoryStatus] PRIMARY KEY CLUSTERED ([ServiceOrderCategoryStatusId] ASC)
);

