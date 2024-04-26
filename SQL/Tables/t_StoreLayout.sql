
-------------------------------------------------------------------------------------------------------------
--
--  Table:          dbo.StoreLayout
--  Author:         Tracy Baird
--  Description:    
--
--  History:        04/24/2024 - First Created
--  Date			Modified By    Modification    
--  ----------		------------   ------------------------------------------------------------------------
--  
-------------------------------------------------------------------------------------------------------------
IF EXISTS( SELECT  'X'
            FROM    sys.objects SO (nolock)
                inner join sys.schemas SS (nolock)
                    on SS.schema_id = SO.schema_id
            WHERE   SS.name = 'dbo'
            AND     SO.name = 'StoreLayout'
            AND     SO.type = 'U' )
    BEGIN
		Drop Table dbo.StoreLayout
	End 


Create Table dbo.StoreLayout
(		StoreLayoutId			Int					Identity,
		StoreId					Int					FOREIGN KEY REFERENCES Store(StoreId),
		CoolerNumber			Int,
		ShelfNumber				Int,
		ColumnNumber			Int,
		InventoryTotal			Int,
		ProductId				Int					FOREIGN KEY REFERENCES Product(ProductId),
		PositionFee				Decimal(10,2),
		BeginDate				DateTime,
		EndDate					DateTime,
		Status					VarChar(1),
		CreationDate			DateTime
				--Manufacturer		
		)
		
		ALTER TABLE	[dbo].[StoreLayout]	ADD CONSTRAINT PK_StoreLayout_StoreLayoutId PRIMARY KEY (StoreLayoutId)
		ALTER TABLE [dbo].[StoreLayout]	ADD CONSTRAINT DF_StoreLayout_CreationDate	DEFAULT GETDATE() FOR CreationDate
		
	
GO
 
--IF EXISTS( SELECT  'X'
--            FROM    sys.objects SO (nolock)
--                inner join sys.schemas SS (nolock)
--                    on SS.schema_id = SO.schema_id
--            WHERE   SS.name = 'dbo'
--            AND     SO.name = 'Company'
--            AND     SO.type = 'U' )
--   BEGIN
--    GRANT SELECT, INSERT, UPDATE, DELETE ON Company TO Everyone
--	PRINT 'GRANTED SCUD PERMISSIONS TO Everyone '
--  END
--GO

--PRINT 'End Time: ' + CONVERT ( varchar , GETDATE () , 121)
--GO
