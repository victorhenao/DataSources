CREATE TABLE [dbo].[ServiceOrderHistory] (
    [ServiceOrderHistoryId] INT      IDENTITY (1, 1) NOT NULL,
    [Date]                  DATETIME CONSTRAINT [DF_ServiceOrderHistory_Date] DEFAULT (getdate()) NOT NULL,
    [InitialStatusFK]       INT      NULL,
    [FinalStatusFk]         INT      NOT NULL,
    [ServiceOrderFk]        INT      NOT NULL,
    CONSTRAINT [PK_ServiceOrderStatusHistory] PRIMARY KEY CLUSTERED ([ServiceOrderHistoryId] ASC),
    CONSTRAINT [FK_ServiceOrderHistory_ServiceOrder] FOREIGN KEY ([ServiceOrderFk]) REFERENCES [dbo].[ServiceOrder] ([ServiceOrderId]),
    CONSTRAINT [FK_ServiceOrderHistory_ServiceOrderStatus_Final] FOREIGN KEY ([FinalStatusFk]) REFERENCES [dbo].[ServiceOrderStatus] ([ServiceOrderStatusId]),
    CONSTRAINT [FK_ServiceOrderHistory_ServiceOrderStatus_Initial] FOREIGN KEY ([InitialStatusFK]) REFERENCES [dbo].[ServiceOrderStatus] ([ServiceOrderStatusId])
);

