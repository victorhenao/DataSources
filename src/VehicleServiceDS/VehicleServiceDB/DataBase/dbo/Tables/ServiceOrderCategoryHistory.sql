CREATE TABLE [dbo].[ServiceOrderCategoryHistory] (
    [ServiceOrderCategoryHistoryId] INT      IDENTITY (1, 1) NOT NULL,
    [Date]                          DATETIME CONSTRAINT [DF_ServiceOrderCategoryHistory_Date] DEFAULT (getdate()) NOT NULL,
    [InitialStatusFk]               INT      NULL,
    [FinalStatusFk]                 INT      NOT NULL,
    [ServiceOrderCategoryFk]        INT      NOT NULL,
    CONSTRAINT [PK_ServiceOrderCategoryHistory] PRIMARY KEY CLUSTERED ([ServiceOrderCategoryHistoryId] ASC),
    CONSTRAINT [FK_ServiceOrderCategoryHistory_ServiceOrderCategory] FOREIGN KEY ([ServiceOrderCategoryFk]) REFERENCES [dbo].[ServiceOrderCategory] ([ServiceOrderCategoryId]),
    CONSTRAINT [FK_ServiceOrderCategoryHistory_ServiceOrderCategoryStatus_Final] FOREIGN KEY ([FinalStatusFk]) REFERENCES [dbo].[ServiceOrderCategoryStatus] ([ServiceOrderCategoryStatusId]),
    CONSTRAINT [FK_ServiceOrderCategoryHistory_ServiceOrderCategoryStatus_Initial] FOREIGN KEY ([InitialStatusFk]) REFERENCES [dbo].[ServiceOrderCategoryStatus] ([ServiceOrderCategoryStatusId])
);

