CREATE VIEW dbo.VehicleServiceComplete
AS
SELECT        dbo.ServiceOrder.ServiceOrderId, dbo.ServiceOrder.RequestedDate, dbo.ServiceOrder.StartDate, dbo.ServiceOrder.EndDate, dbo.ServiceOrder.VehicleFk, dbo.ServiceOrder.ServiceOrderStatusFk, 
                         dbo.ServiceOrder.InvoiceFk, dbo.ServiceOrder.AutomotiveTechnicianLeadFk, dbo.Invoice.InvoiceId, dbo.Invoice.InvoiceNumber, dbo.Invoice.Taxes, dbo.Invoice.Value, dbo.Invoice.InvoicingDate, 
                         dbo.AutomotiveTechnicianLead.AutomotiveTechnicianLeadId, dbo.AutomotiveTechnicianLead.Name, dbo.ServiceOrderStatus.ServiceOrderStatusId, dbo.ServiceOrderStatus.Name AS ServiceOrderStatusName, 
                         dbo.ServiceOrderStatus.Description
FROM            dbo.ServiceOrder INNER JOIN
                         dbo.Invoice ON dbo.ServiceOrder.InvoiceFk = dbo.Invoice.InvoiceId INNER JOIN
                         dbo.AutomotiveTechnicianLead ON dbo.ServiceOrder.AutomotiveTechnicianLeadFk = dbo.AutomotiveTechnicianLead.AutomotiveTechnicianLeadId INNER JOIN
                         dbo.ServiceOrderStatus ON dbo.ServiceOrder.ServiceOrderStatusFk = dbo.ServiceOrderStatus.ServiceOrderStatusId
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VehicleServiceComplete';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N' End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2010
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VehicleServiceComplete';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ServiceOrder"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Invoice"
            Begin Extent = 
               Top = 6
               Left = 323
               Bottom = 136
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "AutomotiveTechnicianLead"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 102
               Right = 777
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServiceOrderStatus"
            Begin Extent = 
               Top = 102
               Left = 532
               Bottom = 215
               Right = 730
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 24
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1155
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VehicleServiceComplete';

