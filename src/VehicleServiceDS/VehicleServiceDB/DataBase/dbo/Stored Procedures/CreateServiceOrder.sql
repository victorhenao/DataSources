CREATE PROCEDURE [dbo].[CreateServiceOrder]
AS
BEGIN
	
	SET NOCOUNT ON;

    BEGIN TRANSACTION NewServiceOrder
	BEGIN TRY
		DECLARE @smallest int = 1
		DECLARE @largest int

		-- BEGIN Invoice
		DECLARE @idInvoice int

		DECLARE @invoice int
		DECLARE @invoiceNumber varchar(50)
		SET @smallest = 111111
		SET @largest = 999999
		SELECT @invoice = RAND()*(@largest-@smallest)+@smallest;
		SET @invoiceNumber = 'INV'  + CONVERT(varchar(50), @invoice)

		DECLARE @value int
		DECLARE @taxes int
		SET @smallest = 1000000
		SET @largest = 5000000
		SELECT @value = RAND()*(@largest-@smallest)+@smallest;
		SET @taxes = @value * 0.15

		INSERT INTO [dbo].[Invoice]
					([InvoiceNumber]
					,[Value]
					,[Taxes]
					,[InvoicingDate])
				VALUES
					(@invoiceNumber
					,@value
					,@taxes
					,GETDATE())

		SELECT @idInvoice = SCOPE_IDENTITY()

		-- END Invoice

		-- BEGIN ServiceOrder
		DECLARE @idServiceOrder int
	
		DECLARE @technicialLeadFk int
		DECLARE @maxTechnicialLeadFk int	
		SELECT @maxTechnicialLeadFk = MAX(AutomotiveTechnicianLeadId) FROM AutomotiveTechnicianLead	
		SET @smallest = 1
		SET @largest = @maxTechnicialLeadFk
		SELECT @technicialLeadFk = RAND()*(@largest-@smallest)+@smallest;

		DECLARE @vehicleFk int
		DECLARE @maxVehicleFk int	
		SELECT @maxVehicleFk = MAX(VehicleId) FROM Vehicle
		SET @largest = @maxVehicleFk
		SELECT @vehicleFk = RAND()*(@largest-@smallest)+@smallest;

		INSERT INTO [dbo].[ServiceOrder]
					([RequestedDate]
					,[StartDate]
					,[EndDate]
					,[VehicleFk]
					,[ServiceOrderStatusFk]
					,[InvoiceFk]
					,[AutomotiveTechnicianLeadFk])
				VALUES
					(GETDATE()
					,DATEADD(day,1,GETDATE())
					,DATEADD(day,3,GETDATE())
					,@vehicleFk
					,1
					,@idInvoice
					,@technicialLeadFk)

		SELECT @idServiceOrder = SCOPE_IDENTITY()

		-- END ServiceOrder

		-- BEGIN ServiceOrderHistory

		INSERT INTO [dbo].[ServiceOrderHistory]
					([Date]
					,[InitialStatusFK]
					,[FinalStatusFk]
					,[ServiceOrderFk])
				VALUES
					(GETDATE()
					,NULL
					,1
					,@idServiceOrder)

		INSERT INTO [dbo].[ServiceOrderHistory] ([Date] ,[InitialStatusFK] ,[FinalStatusFk] ,[ServiceOrderFk]) VALUES (DATEADD(HOUR,5,GETDATE()),1,2,@idServiceOrder)
		INSERT INTO [dbo].[ServiceOrderHistory] ([Date] ,[InitialStatusFK] ,[FinalStatusFk] ,[ServiceOrderFk]) VALUES (DATEADD(HOUR,15,GETDATE()),2,3,@idServiceOrder)
		INSERT INTO [dbo].[ServiceOrderHistory] ([Date] ,[InitialStatusFK] ,[FinalStatusFk] ,[ServiceOrderFk]) VALUES (DATEADD(HOUR,25,GETDATE()),3,4,@idServiceOrder)
		INSERT INTO [dbo].[ServiceOrderHistory] ([Date] ,[InitialStatusFK] ,[FinalStatusFk] ,[ServiceOrderFk]) VALUES (DATEADD(HOUR,35,GETDATE()),4,5,@idServiceOrder)
		INSERT INTO [dbo].[ServiceOrderHistory] ([Date] ,[InitialStatusFK] ,[FinalStatusFk] ,[ServiceOrderFk]) VALUES (DATEADD(HOUR,45,GETDATE()),5,6,@idServiceOrder)
		INSERT INTO [dbo].[ServiceOrderHistory] ([Date] ,[InitialStatusFK] ,[FinalStatusFk] ,[ServiceOrderFk]) VALUES (DATEADD(HOUR,55,GETDATE()),6,7,@idServiceOrder)

		--END ServiceOrderHistory

		-- BEGIN ServiceOrderCategory
		DECLARE @idServiceCategoryOrder int

		DECLARE @categoryFk int
		DECLARE @maxCategoryFk int	
		SELECT @maxCategoryFk = MAX(CategoryId) FROM Category	
		SET @smallest = 1
		SET @largest = @maxCategoryFk
		SELECT @categoryFk = RAND()*(@largest-@smallest)+@smallest;

		DECLARE @technicianFk int
		DECLARE @maxTechnicianFk int	
		SELECT @maxTechnicianFk = MAX(AutomotiveTechnicianId) FROM AutomotiveTechnician	
		SET @largest = @maxTechnicianFk
		SELECT @technicianFk = RAND()*(@largest-@smallest)+@smallest;

		INSERT INTO [dbo].[ServiceOrderCategory]
					([Comments]
					,[CategoryFk]
					,[ServiceOrderFk]
					,[ServiceOrderCategoryStatusFk]
					,[AutomotiveTechnicianFk])
				VALUES
					('Interdum et malesuada fames ac ante ipsum primis in faucibus. In ipsum urna, feugiat sed ultricies at, ullamcorper at tortor. Sed ullamcorper egestas est, vitae hendrerit mi lobortis nec. Nam efficitur sapien at dictum lacinia. Praesent sem est, placerat nec scelerisque non, consequat sed leo. Nunc suscipit et nunc ac fringilla. Phasellus nec diam vitae purus pharetra ornare a id eros. Fusce semper scelerisque faucibus. Pellentesque ex arcu, malesuada nec maximus sit amet, ultrices et arcu. Quisque enim orci, consectetur posuere ligula ut, volutpat pellentesque lorem. In hac habitasse platea dictumst. Nulla et libero vitae lectus malesuada vulputate a vitae libero. Mauris pellentesque mollis feugiat. In eu sollicitudin lacus. Mauris non nunc odio.'
					,@categoryFk
					,@idServiceOrder
					,1
					,@technicianFk)

		SELECT @idServiceCategoryOrder = SCOPE_IDENTITY()

		-- END ServiceOrderCategory

		-- BEGIN ServiceOrderCategoryHistory

		INSERT INTO [dbo].[ServiceOrderCategoryHistory]
				   ([Date]
				   ,[InitialStatusFk]
				   ,[FinalStatusFk]
				   ,[ServiceOrderCategoryFk])
			 VALUES
				   (GETDATE()
				   ,NULL
				   ,1
				   ,@idServiceCategoryOrder)

		INSERT INTO [dbo].[ServiceOrderCategoryHistory] ([Date],[InitialStatusFk],[FinalStatusFk],[ServiceOrderCategoryFk]) VALUES (DATEADD(HOUR,10,GETDATE()),1,2,@idServiceCategoryOrder)
		INSERT INTO [dbo].[ServiceOrderCategoryHistory] ([Date],[InitialStatusFk],[FinalStatusFk],[ServiceOrderCategoryFk]) VALUES (DATEADD(HOUR,30,GETDATE()),2,3,@idServiceCategoryOrder)
		INSERT INTO [dbo].[ServiceOrderCategoryHistory] ([Date],[InitialStatusFk],[FinalStatusFk],[ServiceOrderCategoryFk]) VALUES (DATEADD(HOUR,40,GETDATE()),3,4,@idServiceCategoryOrder)

		-- END ServiceOrderCategoryHistory

		-- BEGIN OrderCategoryDetail
		DECLARE @idOrderCategoryDetail int

		INSERT INTO [dbo].[OrderCategoryDetail]
					([Comments]
					,[Findings]
					,[StartDate]
					,[EnDate]
					,[ServiceOrderCategoryFk]
					,[OrderCategoryDetailStatusFk])
				VALUES
					('Interdum et malesuada fames ac ante ipsum primis in faucibus. In ipsum urna, feugiat sed ultricies at, ullamcorper at tortor. Sed ullamcorper egestas est, vitae hendrerit mi lobortis nec. Nam efficitur sapien at dictum lacinia. Praesent sem est, placerat nec scelerisque non, consequat sed leo. Nunc suscipit et nunc ac fringilla. Phasellus nec diam vitae purus pharetra ornare a id eros. Fusce semper scelerisque faucibus. Pellentesque ex arcu, malesuada nec maximus sit amet, ultrices et arcu. Quisque enim orci, consectetur posuere ligula ut, volutpat pellentesque lorem. In hac habitasse platea dictumst. Nulla et libero vitae lectus malesuada vulputate a vitae libero. Mauris pellentesque mollis feugiat. In eu sollicitudin lacus. Mauris non nunc odio.'
					,'Mauris eros sem, blandit at ante sit amet, semper sollicitudin metus. Proin auctor consequat mauris, sed blandit leo viverra ac. Sed leo lorem, dictum quis sem nec, pharetra tincidunt turpis. Nulla facilisi. Mauris ut arcu at lorem consectetur pellentesque at ut lectus. Fusce sed ipsum eu tortor rutrum efficitur in pretium metus. Ut elementum luctus nulla eu fringilla. Mauris eros sem, blandit at ante sit amet, semper sollicitudin metus. Proin auctor consequat mauris, sed blandit leo viverra ac. Sed leo lorem, dictum quis sem nec, pharetra tincidunt turpis. Nulla facilisi. Mauris ut arcu at lorem consectetur pellentesque at ut lectus. Fusce sed ipsum eu tortor rutrum efficitur in pretium metus. Ut elementum luctus nulla eu fringilla.'
					,GETDATE()
					,DATEADD(day,2,GETDATE())
					,@idServiceCategoryOrder
					,1)
	
		SELECT @idOrderCategoryDetail = SCOPE_IDENTITY()

		-- END OrderCategoryDetail

		-- BEGIN OrderCategoryDetailHistory

		INSERT INTO [dbo].[OrderCategoryDetailHistory]
					([Date]
					,[InitialStatusFk]
					,[FinalStatusFk]
					,[OrderCategoryDetailFk])
				VALUES
					(GETDATE()
					,NULL
					,1
					,@idOrderCategoryDetail)

		INSERT INTO [dbo].[OrderCategoryDetailHistory]([Date],[InitialStatusFk],[FinalStatusFk],[OrderCategoryDetailFk]) VALUES (DATEADD(HOUR,10,GETDATE()),1,2,@idOrderCategoryDetail)
		INSERT INTO [dbo].[OrderCategoryDetailHistory]([Date],[InitialStatusFk],[FinalStatusFk],[OrderCategoryDetailFk]) VALUES (DATEADD(HOUR,20,GETDATE()),2,3,@idOrderCategoryDetail)
		INSERT INTO [dbo].[OrderCategoryDetailHistory]([Date],[InitialStatusFk],[FinalStatusFk],[OrderCategoryDetailFk]) VALUES (DATEADD(HOUR,30,GETDATE()),3,4,@idOrderCategoryDetail)
		INSERT INTO [dbo].[OrderCategoryDetailHistory]([Date],[InitialStatusFk],[FinalStatusFk],[OrderCategoryDetailFk]) VALUES (DATEADD(HOUR,40,GETDATE()),4,5,@idOrderCategoryDetail)
		INSERT INTO [dbo].[OrderCategoryDetailHistory]([Date],[InitialStatusFk],[FinalStatusFk],[OrderCategoryDetailFk]) VALUES (DATEADD(HOUR,50,GETDATE()),5,6,@idOrderCategoryDetail)
		INSERT INTO [dbo].[OrderCategoryDetailHistory]([Date],[InitialStatusFk],[FinalStatusFk],[OrderCategoryDetailFk]) VALUES (DATEADD(HOUR,60,GETDATE()),6,7,@idOrderCategoryDetail)

		-- END OrderCategoryDetailHistory

		-- BEGIN PartManteinance
		DECLARE @partManteinanceQuantity int
		DECLARE @contador int = 1

		SET @smallest = 1
		SET @largest = 5
		SELECT @partManteinanceQuantity = RAND()*(@largest-@smallest)+@smallest;

		DECLARE @partFk int
		DECLARE @maxPartFk int

		WHILE @contador <= @partManteinanceQuantity
		BEGIN			
			SELECT @maxPartFk = MAX(PartId) FROM Part	
			SET @smallest = 1
			SET @largest = @maxPartFk
			SELECT @partFk = RAND()*(@largest-@smallest)+@smallest;

			DECLARE @serial int
			DECLARE @serialNumber varchar(50)
			SET @smallest = 111111
			SET @largest = 999999
			SELECT @serial = RAND()*(@largest-@smallest)+@smallest;
			SET @serialNumber = 'PART-Serial-'  + CONVERT(varchar(50), @invoice)

			INSERT INTO [dbo].[PartManteinance]
						([SerialNumber]
						,[Comments]
						,[OrderCategoryDetailFk]
						,[ParfFk])
					VALUES
						(@serialNumber
						,'Interdum et malesuada fames ac ante ipsum primis in faucibus. In ipsum urna, feugiat sed ultricies at, ullamcorper at tortor. Sed ullamcorper egestas est, vitae hendrerit mi lobortis nec. Nam efficitur sapien at dictum lacinia. Praesent sem est, placerat nec scelerisque non, consequat sed leo. Nunc suscipit et nunc ac fringilla. Phasellus nec diam vitae purus pharetra ornare a id eros. Fusce semper scelerisque faucibus. Pellentesque ex arcu, malesuada nec maximus sit amet, ultrices et arcu. Quisque enim orci, consectetur posuere ligula ut, volutpat pellentesque lorem. In hac habitasse platea dictumst. Nulla et libero vitae lectus malesuada vulputate a vitae libero. Mauris pellentesque mollis feugiat. In eu sollicitudin lacus. Mauris non nunc odio.'
						,@idOrderCategoryDetail
						,@partFk)

			SET @contador = @contador + 1
		END

		-- END PartManteinance

		-- BEGIN PartReplacement

		DECLARE @partReplacementQuantity int
		SET @contador = 1

		SET @smallest = 1
		SET @largest = 5
		SELECT @partReplacementQuantity = RAND()*(@largest-@smallest)+@smallest;	

		WHILE @contador <= @partReplacementQuantity
		BEGIN			
			SELECT @maxPartFk = MAX(PartId) FROM Part	
			SET @smallest = 1
			SET @largest = @maxPartFk
			SELECT @partFk = RAND()*(@largest-@smallest)+@smallest;

			SET @smallest = 111111
			SET @largest = 999999
			SELECT @serial = RAND()*(@largest-@smallest)+@smallest;
			SET @serialNumber = 'PART-Serial-'  + CONVERT(varchar(50), @invoice)

			INSERT INTO [dbo].[PartReplacement]
						([SerialNumber]
						,[Comments]
						,[OrderCategoryDetailFk]
						,[PartFk])
					VALUES
						(@serialNumber
						,'Interdum et malesuada fames ac ante ipsum primis in faucibus. In ipsum urna, feugiat sed ultricies at, ullamcorper at tortor. Sed ullamcorper egestas est, vitae hendrerit mi lobortis nec. Nam efficitur sapien at dictum lacinia. Praesent sem est, placerat nec scelerisque non, consequat sed leo. Nunc suscipit et nunc ac fringilla. Phasellus nec diam vitae purus pharetra ornare a id eros. Fusce semper scelerisque faucibus. Pellentesque ex arcu, malesuada nec maximus sit amet, ultrices et arcu. Quisque enim orci, consectetur posuere ligula ut, volutpat pellentesque lorem. In hac habitasse platea dictumst. Nulla et libero vitae lectus malesuada vulputate a vitae libero. Mauris pellentesque mollis feugiat. In eu sollicitudin lacus. Mauris non nunc odio.'
						,@idOrderCategoryDetail
						,@partFk)

			SET @contador = @contador + 1
		END

		-- END PartReplacement

		COMMIT TRANSACTION NewServiceOrder

	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION NewServiceOrder

		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() as ErrorState,
        ERROR_PROCEDURE() as ErrorProcedure,
        ERROR_LINE() as ErrorLine,
        ERROR_MESSAGE() as ErrorMessage;
	END CATCH  
END
