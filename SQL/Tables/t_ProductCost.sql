
-------------------------------------------------------------------------------------------------------------
--
--  Table:          dbo.ProductCost
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
            AND     SO.name = 'ProductCost'
            AND     SO.type = 'U' )
    BEGIN
		Drop Table dbo.ProductCost
	End 


Create Table dbo.ProductCost
		(		
		ProductCostId			Int					Identity,
		ProductId				Int					FOREIGN KEY REFERENCES Product(ProductId),
		Price					Decimal(8,2),
		Cost					Decimal(8,2),
		BeginDate				DateTime,
		EndDate					DateTime,
		CreationDate			DateTime
		)
		
		ALTER TABLE	[dbo].[ProductCost]	ADD CONSTRAINT PK_ProductCost_Id				PRIMARY KEY (ProductCostId)
		ALTER TABLE [dbo].[ProductCost]	ADD CONSTRAINT DF_ProductCost_CreationDate		DEFAULT GETDATE() FOR CreationDate
		
	
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
