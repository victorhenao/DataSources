CREATE TABLE [dbo].[Part] (
    [PartId]             INT           IDENTITY (1, 1) NOT NULL,
    [Name]               VARCHAR (100) NOT NULL,
    [Description]        VARCHAR (500) NOT NULL,
    [PartManufacturerFk] INT           NOT NULL,
    CONSTRAINT [PK_Part] PRIMARY KEY CLUSTERED ([PartId] ASC),
    CONSTRAINT [FK_Part_PartManufacturer] FOREIGN KEY ([PartManufacturerFk]) REFERENCES [dbo].[PartManufacturer] ([PartManufacturerId])
);

