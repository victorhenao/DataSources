CREATE TABLE [dbo].[AutomotiveTechnician] (
    [AutomotiveTechnicianId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]                   VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_AutomotiveTechnician] PRIMARY KEY CLUSTERED ([AutomotiveTechnicianId] ASC)
);

