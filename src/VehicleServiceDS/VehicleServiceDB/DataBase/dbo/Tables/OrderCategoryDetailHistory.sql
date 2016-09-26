CREATE TABLE [dbo].[OrderCategoryDetailHistory] (
    [OrderCategoryDetailHitoryId] INT      IDENTITY (1, 1) NOT NULL,
    [Date]                        DATETIME NOT NULL,
    [InitialStatusFk]             INT      NULL,
    [FinalStatusFk]               INT      NOT NULL,
    [OrderCategoryDetailFk]       INT      NOT NULL,
    CONSTRAINT [PK_OrderCategoryDetailHistory] PRIMARY KEY CLUSTERED ([OrderCategoryDetailHitoryId] ASC),
    CONSTRAINT [FK_OrderCategoryDetailHistory_OrderCategoryDetail] FOREIGN KEY ([OrderCategoryDetailFk]) REFERENCES [dbo].[OrderCategoryDetail] ([OrderCategoryDetailId]),
    CONSTRAINT [FK_OrderCategoryDetailHistory_OrderCategoryDetailStatus_Final] FOREIGN KEY ([FinalStatusFk]) REFERENCES [dbo].[OrderCategoryDetailStatus] ([OrderCategoryDetailStatusId]),
    CONSTRAINT [FK_OrderCategoryDetailHistory_OrderCategoryDetailStatus_Initial] FOREIGN KEY ([InitialStatusFk]) REFERENCES [dbo].[OrderCategoryDetailStatus] ([OrderCategoryDetailStatusId])
);

