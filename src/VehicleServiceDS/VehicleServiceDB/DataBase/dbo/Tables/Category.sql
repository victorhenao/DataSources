CREATE TABLE [dbo].[Category] (
    [CategoryId] INT          IDENTITY (1, 1) NOT NULL,
    [Category]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);

