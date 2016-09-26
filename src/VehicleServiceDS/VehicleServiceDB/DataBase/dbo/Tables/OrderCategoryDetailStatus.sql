CREATE TABLE [dbo].[OrderCategoryDetailStatus] (
    [OrderCategoryDetailStatusId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]                        VARCHAR (50)  NOT NULL,
    [Description]                 VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_OrderCategoryDetailStatus] PRIMARY KEY CLUSTERED ([OrderCategoryDetailStatusId] ASC)
);

