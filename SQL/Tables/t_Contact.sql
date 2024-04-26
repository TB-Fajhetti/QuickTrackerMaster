
-------------------------------------------------------------------------------------------------------------
--
--  Table:          dbo.Contact
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
            AND     SO.name = 'Contact'
            AND     SO.type = 'U' )
    BEGIN
		Drop Table dbo.Contact
	End 


Create Table dbo.Contact
(		ContactId				Int					Identity,
		CompanyId				Int					FOREIGN KEY REFERENCES Company(CompanyId),
		FirstName				VarChar(50),
		LastName				VarChar(50),
		EmailAddress			VarChar(100),
		PhoneNumber				VarChar(25),
		Status					VarChar(1),
		CreationDate			DateTime
				--Manufacturer		
		)
		
		ALTER TABLE	[dbo].[Contact]	ADD CONSTRAINT PK_Contact_ContactId PRIMARY KEY (ContactId)
		ALTER TABLE [dbo].[Contact]	ADD CONSTRAINT DF_Contact_CreationDate	DEFAULT GETDATE() FOR CreationDate
		
	
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
