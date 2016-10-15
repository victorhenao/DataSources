CREATE PROCEDURE uspVehicleServicecomplete
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

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
                         dbo.PartReplacement.OrderCategoryDetailFk AS PartReplacementOrderCategoryDetalFk, dbo.PartReplacement.PartFk, Part_1.PartId AS PartmanteinancePartId, Part_1.Name AS PartmanteinancePartName, 
                         dbo.Part.PartId AS PartReplacementPartId, dbo.Part.Name AS PartReplacementPartName, dbo.PartManufacturer.ManufacturerName AS ManufacturerNameManteinance, 
                         PartManufacturer_1.ManufacturerName AS ManufacturerNameReplacement
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
                         dbo.PartReplacement ON dbo.OrderCategoryDetail.OrderCategoryDetailId = dbo.PartReplacement.OrderCategoryDetailFk INNER JOIN
                         dbo.Part ON dbo.PartReplacement.PartFk = dbo.Part.PartId INNER JOIN
                         dbo.Part AS Part_1 ON dbo.PartManteinance.ParfFk = Part_1.PartId INNER JOIN
                         dbo.PartManufacturer ON Part_1.PartManufacturerFk = dbo.PartManufacturer.PartManufacturerId INNER JOIN
                         dbo.PartManufacturer AS PartManufacturer_1 ON dbo.Part.PartManufacturerFk = PartManufacturer_1.PartManufacturerId
END