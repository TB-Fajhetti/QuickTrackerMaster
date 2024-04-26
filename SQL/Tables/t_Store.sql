
-------------------------------------------------------------------------------------------------------------
--
--  Table:          dbo.Store
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
            AND     SO.name = 'Store'
            AND     SO.type = 'U' )
    BEGIN
		Drop Table dbo.Store
	End 


Create Table dbo.Store
(		StoreId					Int					Identity,
		CompanyId				Int					FOREIGN KEY REFERENCES Company(CompanyId),
		Address1				VarChar(100),
		Address2				VarChar(100),
		City					VarChar(100),
		State					VarChar(5),
		ZipCode					VarChar(10),
		PhoneNumber				VarChar(25),
		Latitude				FLOAT,
		Longitude				FLOAT,
		TotalTrays				int,
		Status					VarChar(1),
		CreationDate			DateTime
				--Manufacturer		
		)
		
		ALTER TABLE	[dbo].[Store]	ADD CONSTRAINT PK_Store_StoreId			PRIMARY KEY (StoreId)
		ALTER TABLE [dbo].[Store]	ADD CONSTRAINT DF_Store_CreationDate	DEFAULT GETDATE() FOR CreationDate
		
	
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
