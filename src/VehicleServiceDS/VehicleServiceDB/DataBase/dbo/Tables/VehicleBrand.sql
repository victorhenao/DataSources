CREATE TABLE [dbo].[VehicleBrand] (
    [VehicleBrandId] INT          IDENTITY (1, 1) NOT NULL,
    [Brand]          VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED ([VehicleBrandId] ASC)
);

