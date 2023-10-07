CREATE OR REPLACE STORAGE INTEGRATION clause_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'AZURE'
  ENABLED = TRUE
  AZURE_TENANT_ID = '<tenant id>'
  STORAGE_ALLOWED_LOCATIONS = ('azure://<storageaccount>.blob.core.windows.net/snowflakestage/Delta_Demo/');





//Stage using the integration
CREATE OR REPLACE STAGE Clause_Azure_stage
  STORAGE_INTEGRATION = clause_int
  URL = 'azure://<storageaccount>.blob.core.windows.net/snowflakestage/Delta_Demo/'

//instead of using integration you can use a les safe method of using SAS_Token
CREATE STAGE Clause_Azure_table
CREDENTIALS = ( AZURE_SAS_TOKEN = '<SAS_TOKEN>' )
URL = 'azure://<storageaccount>.blob.core.windows.net/snowflakestage/Delta_Demo/'
 

DESC STAGE DATAMONSTER.DBO.CLAUSE_AZURE_STAGE;

