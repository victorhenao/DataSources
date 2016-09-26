CREATE TABLE [dbo].[PartReplacement] (
    [PartReplacementId]     INT           IDENTITY (1, 1) NOT NULL,
    [SerialNumber]          VARCHAR (50)  NOT NULL,
    [Comments]              VARCHAR (800) NOT NULL,
    [OrderCategoryDetailFk] INT           NOT NULL,
    [PartFk]                INT           NOT NULL,
    CONSTRAINT [PK_PartReplacement] PRIMARY KEY CLUSTERED ([PartReplacementId] ASC),
    CONSTRAINT [FK_PartReplacement_CategoryDetail] FOREIGN KEY ([OrderCategoryDetailFk]) REFERENCES [dbo].[OrderCategoryDetail] ([OrderCategoryDetailId]),
    CONSTRAINT [FK_PartReplacement_Part] FOREIGN KEY ([PartFk]) REFERENCES [dbo].[Part] ([PartId])
);

