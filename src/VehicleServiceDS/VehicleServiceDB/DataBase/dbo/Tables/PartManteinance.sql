CREATE TABLE [dbo].[PartManteinance] (
    [PartManteinanceId]     INT           IDENTITY (1, 1) NOT NULL,
    [SerialNumber]          VARCHAR (50)  NOT NULL,
    [Comments]              VARCHAR (800) NOT NULL,
    [OrderCategoryDetailFk] INT           NOT NULL,
    [ParfFk]                INT           NOT NULL,
    CONSTRAINT [PK_PartManteinance] PRIMARY KEY CLUSTERED ([PartManteinanceId] ASC),
    CONSTRAINT [FK_PartManteinance_CategoryDetail] FOREIGN KEY ([OrderCategoryDetailFk]) REFERENCES [dbo].[OrderCategoryDetail] ([OrderCategoryDetailId]),
    CONSTRAINT [FK_PartManteinance_Part] FOREIGN KEY ([ParfFk]) REFERENCES [dbo].[Part] ([PartId])
);

