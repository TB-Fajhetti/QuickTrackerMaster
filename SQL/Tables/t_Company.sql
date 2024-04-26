
-------------------------------------------------------------------------------------------------------------
--
--  Table:          dbo.Company
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
            AND     SO.name = 'Company'
            AND     SO.type = 'U' )
    BEGIN
		Drop Table dbo.Company
	End 


Create Table dbo.Company
(		CompanyId				Int					Identity,
		Name					VarChar(100),
		Address1				VarChar(100),
		Address2				VarChar(100),
		City					VarChar(100),
		State					VarChar(5),
		ZipCode					VarChar(10),
		PhoneNumber				VarChar(25),
		CreationDate			DateTime
		--Manufacturer		
		)
		
		ALTER TABLE	[dbo].[Company]	ADD CONSTRAINT PK_Company_CompanyId PRIMARY KEY (CompanyId)
		ALTER TABLE [dbo].[Company]	ADD CONSTRAINT DF_Company_CreationDate	DEFAULT GETDATE() FOR CreationDate
		

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

PRINT 'End Time: ' + CONVERT ( varchar , GETDATE () , 121)
GO
