CREATE TABLE [dbo].[ServiceOrder] (
    [ServiceOrderId]             INT      IDENTITY (1, 1) NOT NULL,
    [RequestedDate]              DATETIME CONSTRAINT [DF_ServiceOrder_RequestedDate] DEFAULT (getdate()) NOT NULL,
    [StartDate]                  DATETIME NULL,
    [EndDate]                    DATETIME NULL,
    [VehicleFk]                  INT      NOT NULL,
    [ServiceOrderStatusFk]       INT      NOT NULL,
    [InvoiceFk]                  INT      NULL,
    [AutomotiveTechnicianLeadFk] INT      NOT NULL,
    CONSTRAINT [PK_ServiceOrder] PRIMARY KEY CLUSTERED ([ServiceOrderId] ASC),
    CONSTRAINT [FK_ServiceOrder_AutomotiveTechnicianLead] FOREIGN KEY ([AutomotiveTechnicianLeadFk]) REFERENCES [dbo].[AutomotiveTechnicianLead] ([AutomotiveTechnicianLeadId]),
    CONSTRAINT [FK_ServiceOrder_Invoice] FOREIGN KEY ([InvoiceFk]) REFERENCES [dbo].[Invoice] ([InvoiceId]),
    CONSTRAINT [FK_ServiceOrder_ServiceOrderStatus] FOREIGN KEY ([ServiceOrderStatusFk]) REFERENCES [dbo].[ServiceOrderStatus] ([ServiceOrderStatusId]),
    CONSTRAINT [FK_ServiceOrder_Vehicle] FOREIGN KEY ([VehicleFk]) REFERENCES [dbo].[Vehicle] ([VehicleId])
);

