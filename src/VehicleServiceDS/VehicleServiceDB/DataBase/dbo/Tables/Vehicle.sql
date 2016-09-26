CREATE TABLE [dbo].[Vehicle] (
    [VehicleId]       INT          IDENTITY (1, 1) NOT NULL,
    [PlateNumber]     VARCHAR (50) NOT NULL,
    [LastServiceDate] DATETIME     CONSTRAINT [DF_Vehicle_LastServiceDate] DEFAULT (getdate()) NULL,
    [VehicleModelFk]  INT          NOT NULL,
    [CustomerFk]      INT          NOT NULL,
    CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED ([VehicleId] ASC),
    CONSTRAINT [FK_Vehicle_Customer] FOREIGN KEY ([CustomerFk]) REFERENCES [dbo].[Customer] ([CustomerId]),
    CONSTRAINT [FK_Vehicle_Model] FOREIGN KEY ([VehicleModelFk]) REFERENCES [dbo].[VehicleModel] ([VehicleModelId])
);

