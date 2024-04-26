
-------------------------------------------------------------------------------------------------------------
--
--  Table:          dbo.Product
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
            AND     SO.name = 'Product'
            AND     SO.type = 'U' )
    BEGIN
		Drop Table dbo.Product
	End 


Create Table dbo.Product
		(		
		ProductId				Int					Identity,
		CategoryId				Int					FOREIGN KEY REFERENCES Category(CategoryId),
		CompanyId				Int					FOREIGN KEY REFERENCES Company(CompanyId),
		SKUNumber				Char(1),
		Status					Char(1),
		CreationDate			DateTime
		)
		
		ALTER TABLE	[dbo].[Product]	ADD CONSTRAINT PK_Product_Id				PRIMARY KEY (ProductId)
		ALTER TABLE [dbo].[Product]	ADD CONSTRAINT DF_Product_CreationDate		DEFAULT GETDATE() FOR CreationDate
		
	
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
