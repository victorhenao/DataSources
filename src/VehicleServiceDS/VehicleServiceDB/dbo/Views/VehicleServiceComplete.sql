CREATE VIEW dbo.VehicleServiceComplete
AS
SELECT        dbo.ServiceOrder.ServiceOrderId, dbo.ServiceOrder.RequestedDate, dbo.ServiceOrder.StartDate, dbo.ServiceOrder.EndDate, dbo.ServiceOrder.VehicleFk, dbo.ServiceOrder.ServiceOrderStatusFk, 
                         dbo.ServiceOrder.InvoiceFk, dbo.ServiceOrder.AutomotiveTechnicianLeadFk, dbo.Invoice.InvoiceId, dbo.Invoice.InvoiceNumber, dbo.Invoice.Taxes, dbo.Invoice.Value, dbo.Invoice.InvoicingDate, 
                         dbo.AutomotiveTechnicianLead.AutomotiveTechnicianLeadId, dbo.AutomotiveTechnicianLead.Name, dbo.ServiceOrderHistory.ServiceOrderHistoryId, dbo.ServiceOrderHistory.Date, 
                         dbo.ServiceOrderHistory.InitialStatusFK, dbo.ServiceOrderHistory.FinalStatusFk, dbo.ServiceOrderHistory.ServiceOrderFk, dbo.Vehicle.VehicleId, dbo.Vehicle.PlateNumber, dbo.Vehicle.LastServiceDate, 
                         dbo.Vehicle.VehicleModelFk, dbo.Vehicle.CustomerFk, dbo.VehicleModel.VehicleModelId, dbo.VehicleModel.Model, dbo.VehicleModel.VehicleBrandFk, dbo.VehicleBrand.VehicleBrandId, dbo.VehicleBrand.Brand, 
                         dbo.Customer.CustomerId, dbo.Customer.Name AS CustomerName, dbo.Customer.Address, dbo.Customer.PhoneNumer, dbo.ServiceOrderCategory.ServiceOrderCategoryId, dbo.ServiceOrderCategory.Comments, 
                         dbo.ServiceOrderCategory.CategoryFk, dbo.ServiceOrderCategory.ServiceOrderFk AS ServiceOrderCategoryServieOrderFk, dbo.ServiceOrderCategory.ServiceOrderCategoryStatusFk, 
                         dbo.ServiceOrderCategory.AutomotiveTechnicianFk, dbo.Category.CategoryId, dbo.Category.Category, dbo.AutomotiveTechnician.AutomotiveTechnicianId, dbo.AutomotiveTechnician.Name AS TechnicianName, 
                         dbo.ServiceOrderCategoryHistory.ServiceOrderCategoryHistoryId, dbo.ServiceOrderCategoryHistory.Date AS ServiceOrderCategoryHistoryDate, 
                         dbo.ServiceOrderCategoryHistory.InitialStatusFk AS ServiceOrderCategoryHistoryInitialStatusFk, dbo.ServiceOrderCategoryHistory.FinalStatusFk AS ServiceOrderCategoryHistoryFinalStatusFk, 
                         dbo.ServiceOrderCategoryHistory.ServiceOrderCategoryFk, dbo.OrderCategoryDetail.OrderCategoryDetailId, dbo.OrderCategoryDetail.Comments AS OrderCategoryDetailComments, 
                         dbo.OrderCategoryDetail.Findings, dbo.OrderCategoryDetail.StartDate AS OrderCategoryDetailStartDate, dbo.OrderCategoryDetail.EnDate AS OrderCategoryDetailEndDate, 
                         dbo.OrderCategoryDetail.OrderCategoryDetailStatusFk, dbo.OrderCategoryDetail.ServiceOrderCategoryFk AS OrderCategoryDetailServiceOrderCategoryFk, 
                         dbo.OrderCategoryDetailHistory.OrderCategoryDetailHitoryId, dbo.OrderCategoryDetailHistory.Date AS OrderCategoryDetailHistoryDate, 
                         dbo.OrderCategoryDetailHistory.InitialStatusFk AS OrderCategoryDetailHistoryInitialStatusFk, dbo.OrderCategoryDetailHistory.FinalStatusFk AS OrderCategoryDetailHistoryFinalStatusFk, 
                         dbo.OrderCategoryDetailHistory.OrderCategoryDetailFk, dbo.PartManteinance.PartManteinanceId, dbo.PartManteinance.SerialNumber, dbo.PartManteinance.Comments AS PartManteinanceComments, 
                         dbo.PartManteinance.OrderCategoryDetailFk AS PartManteinanceOrderCatgoryDetailFk, dbo.PartManteinance.ParfFk, dbo.PartReplacement.PartReplacementId, 
                         dbo.PartReplacement.SerialNumber AS PartReplacementSerialNumber, dbo.PartReplacement.Comments AS PartReplacementComments, 
                         dbo.PartReplacement.OrderCategoryDetailFk AS PartReplacementOrderCategoryDetalFk, dbo.PartReplacement.PartFk
FROM            dbo.ServiceOrder INNER JOIN
                         dbo.Invoice ON dbo.ServiceOrder.InvoiceFk = dbo.Invoice.InvoiceId INNER JOIN
                         dbo.AutomotiveTechnicianLead ON dbo.ServiceOrder.AutomotiveTechnicianLeadFk = dbo.AutomotiveTechnicianLead.AutomotiveTechnicianLeadId INNER JOIN
                         dbo.ServiceOrderHistory ON dbo.ServiceOrder.ServiceOrderId = dbo.ServiceOrderHistory.ServiceOrderFk INNER JOIN
                         dbo.Vehicle ON dbo.ServiceOrder.VehicleFk = dbo.Vehicle.VehicleId INNER JOIN
                         dbo.VehicleModel ON dbo.Vehicle.VehicleModelFk = dbo.VehicleModel.VehicleModelId INNER JOIN
                         dbo.VehicleBrand ON dbo.VehicleModel.VehicleBrandFk = dbo.VehicleBrand.VehicleBrandId INNER JOIN
                         dbo.Customer ON dbo.Vehicle.CustomerFk = dbo.Customer.CustomerId INNER JOIN
                         dbo.ServiceOrderCategory ON dbo.ServiceOrder.ServiceOrderId = dbo.ServiceOrderCategory.ServiceOrderFk INNER JOIN
                         dbo.Category ON dbo.ServiceOrderCategory.CategoryFk = dbo.Category.CategoryId INNER JOIN
                         dbo.AutomotiveTechnician ON dbo.ServiceOrderCategory.AutomotiveTechnicianFk = dbo.AutomotiveTechnician.AutomotiveTechnicianId INNER JOIN
                         dbo.ServiceOrderCategoryHistory ON dbo.ServiceOrderCategory.ServiceOrderCategoryId = dbo.ServiceOrderCategoryHistory.ServiceOrderCategoryFk INNER JOIN
                         dbo.OrderCategoryDetail ON dbo.ServiceOrderCategory.ServiceOrderCategoryId = dbo.OrderCategoryDetail.ServiceOrderCategoryFk INNER JOIN
                         dbo.OrderCategoryDetailHistory ON dbo.OrderCategoryDetail.OrderCategoryDetailId = dbo.OrderCategoryDetailHistory.OrderCategoryDetailFk INNER JOIN
                         dbo.PartManteinance ON dbo.OrderCategoryDetail.OrderCategoryDetailId = dbo.PartManteinance.OrderCategoryDetailFk INNER JOIN
                         dbo.PartReplacement ON dbo.OrderCategoryDetail.OrderCategoryDetailId = dbo.PartReplacement.OrderCategoryDetailFk
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 3, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VehicleServiceComplete';




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'          End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 234
               Left = 247
               Bottom = 364
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServiceOrderCategory"
            Begin Extent = 
               Top = 234
               Left = 455
               Bottom = 364
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Category"
            Begin Extent = 
               Top = 234
               Left = 741
               Bottom = 330
               Right = 911
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AutomotiveTechnician"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 462
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServiceOrderCategoryHistory"
            Begin Extent = 
               Top = 390
               Left = 296
               Bottom = 520
               Right = 548
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "OrderCategoryDetail"
            Begin Extent = 
               Top = 390
               Left = 586
               Bottom = 520
               Right = 827
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "OrderCategoryDetailHistory"
            Begin Extent = 
               Top = 462
               Left = 38
               Bottom = 592
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "PartManteinance"
            Begin Extent = 
               Top = 522
               Left = 316
               Bottom = 652
               Right = 525
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "PartReplacement"
            Begin Extent = 
               Top = 522
               Left = 563
               Bottom = 652
               Right = 772
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 78
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 15', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VehicleServiceComplete';




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
         Top = -576
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
         Begin Table = "ServiceOrderHistory"
            Begin Extent = 
               Top = 102
               Left = 532
               Bottom = 232
               Right = 736
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Vehicle"
            Begin Extent = 
               Top = 102
               Left = 774
               Bottom = 232
               Right = 947
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "VehicleModel"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VehicleBrand"
            Begin Extent = 
               Top = 138
               Left = 247
               Bottom = 234
               Right = 417
  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VehicleServiceComplete';




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'00
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2520
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

