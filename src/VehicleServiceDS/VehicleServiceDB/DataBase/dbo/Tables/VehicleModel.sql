CREATE TABLE [dbo].[VehicleModel] (
    [VehicleModelId] INT        IDENTITY (1, 1) NOT NULL,
    [Model]          NCHAR (30) NOT NULL,
    [VehicleBrandFk] INT        NOT NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([VehicleModelId] ASC),
    CONSTRAINT [FK_VehicleModel_VehicleBrand] FOREIGN KEY ([VehicleBrandFk]) REFERENCES [dbo].[VehicleBrand] ([VehicleBrandId])
);

