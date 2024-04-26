
-------------------------------------------------------------------------------------------------------------
--
--  Table:          dbo.Category
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
            AND     SO.name = 'Category'
            AND     SO.type = 'U' )
    BEGIN
		Drop Table dbo.Category
	End 


Create Table dbo.Category
		(		
		CategoryId				Int					Identity,
		Name					VarChar(25),
		Type					VarChar(25),
		Status					Char(1),
		CreationDate			DateTime
		)
		
		ALTER TABLE	[dbo].[Category]	ADD CONSTRAINT PK_Category_Id				PRIMARY KEY (CategoryId)
		ALTER TABLE [dbo].[Category]	ADD CONSTRAINT DF_Category_CreationDate		DEFAULT GETDATE() FOR CreationDate
		
	
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
