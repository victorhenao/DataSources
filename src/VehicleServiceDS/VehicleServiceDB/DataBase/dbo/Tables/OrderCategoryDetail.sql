CREATE TABLE [dbo].[OrderCategoryDetail] (
    [OrderCategoryDetailId]       INT           IDENTITY (1, 1) NOT NULL,
    [Comments]                    VARCHAR (800) NOT NULL,
    [Findings]                    VARCHAR (800) NOT NULL,
    [StartDate]                   DATETIME      NOT NULL,
    [EnDate]                      DATETIME      NOT NULL,
    [ServiceOrderCategoryFk]      INT           NOT NULL,
    [OrderCategoryDetailStatusFk] INT           NOT NULL,
    CONSTRAINT [PK_CategoryDetail] PRIMARY KEY CLUSTERED ([OrderCategoryDetailId] ASC),
    CONSTRAINT [FK_OrderCategoryDetail_OrderCategoryDetailStatus] FOREIGN KEY ([OrderCategoryDetailStatusFk]) REFERENCES [dbo].[OrderCategoryDetailStatus] ([OrderCategoryDetailStatusId]),
    CONSTRAINT [FK_OrderCategoryDetail_ServiceOrderCategory] FOREIGN KEY ([ServiceOrderCategoryFk]) REFERENCES [dbo].[ServiceOrderCategory] ([ServiceOrderCategoryId])
);

