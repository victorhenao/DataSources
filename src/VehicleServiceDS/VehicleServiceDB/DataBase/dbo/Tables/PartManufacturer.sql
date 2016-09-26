CREATE TABLE [dbo].[PartManufacturer] (
    [PartManufacturerId] INT           IDENTITY (1, 1) NOT NULL,
    [ManufacturerName]   VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_PartManufacturer] PRIMARY KEY CLUSTERED ([PartManufacturerId] ASC)
);

