CREATE TABLE [dbo].[Invoice] (
    [InvoiceId]     INT          IDENTITY (1, 1) NOT NULL,
    [InvoiceNumber] VARCHAR (50) NOT NULL,
    [Value]         INT          NOT NULL,
    [Taxes]         INT          NOT NULL,
    [InvoicingDate] DATETIME     NOT NULL,
    CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED ([InvoiceId] ASC)
);

