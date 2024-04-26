
-------------------------------------------------------------------------------------------------------------
--
--  Table:          dbo.TransactionLog
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
            AND     SO.name = 'TransactionLog'
            AND     SO.type = 'U' )
    BEGIN
		Drop Table dbo.TransactionLog
	End 


Create Table dbo.TransactionLog
(		TransactionLogId		Int					Identity,
		StoreLayoutId			Int					FOREIGN KEY REFERENCES StoreLayout(StoreLayoutId),
		StoreId					Int					FOREIGN KEY REFERENCES Store(StoreId),
		AddedRemoved			Char(1),
		CreationDate			DateTime
		)
		
		ALTER TABLE	[dbo].[TransactionLog]	ADD CONSTRAINT PK_TransactionLog_TransactionLogId	PRIMARY KEY (TransactionLogId)
		ALTER TABLE [dbo].[TransactionLog]	ADD CONSTRAINT DF_TransactionLog_CreationDate		DEFAULT GETDATE() FOR CreationDate
		
	
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
