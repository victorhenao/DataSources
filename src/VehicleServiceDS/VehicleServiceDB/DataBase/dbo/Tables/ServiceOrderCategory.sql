CREATE TABLE [dbo].[ServiceOrderCategory] (
    [ServiceOrderCategoryId]       INT           IDENTITY (1, 1) NOT NULL,
    [Comments]                     VARCHAR (800) NOT NULL,
    [CategoryFk]                   INT           NOT NULL,
    [ServiceOrderFk]               INT           NOT NULL,
    [ServiceOrderCategoryStatusFk] INT           NOT NULL,
    [AutomotiveTechnicianFk]       INT           NULL,
    CONSTRAINT [PK_OrderCategory] PRIMARY KEY CLUSTERED ([ServiceOrderCategoryId] ASC),
    CONSTRAINT [FK_OrderCategory_ServiceOrder] FOREIGN KEY ([ServiceOrderFk]) REFERENCES [dbo].[ServiceOrder] ([ServiceOrderId]),
    CONSTRAINT [FK_ServiceOrderCategory_AutomotiveTechnician] FOREIGN KEY ([AutomotiveTechnicianFk]) REFERENCES [dbo].[AutomotiveTechnician] ([AutomotiveTechnicianId]),
    CONSTRAINT [FK_ServiceOrderCategory_Category] FOREIGN KEY ([CategoryFk]) REFERENCES [dbo].[Category] ([CategoryId]),
    CONSTRAINT [FK_ServiceOrderCategory_ServiceOrderCategoryStatus] FOREIGN KEY ([ServiceOrderCategoryStatusFk]) REFERENCES [dbo].[ServiceOrderCategoryStatus] ([ServiceOrderCategoryStatusId])
);

