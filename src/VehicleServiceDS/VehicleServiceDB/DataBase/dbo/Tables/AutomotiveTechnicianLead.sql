CREATE TABLE [dbo].[AutomotiveTechnicianLead] (
    [AutomotiveTechnicianLeadId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]                       VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_AutomotiveTechnicianLead] PRIMARY KEY CLUSTERED ([AutomotiveTechnicianLeadId] ASC)
);

