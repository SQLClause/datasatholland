CREATE OR REPLACE MASKING POLICY geoloc AS (val varchar) returns varchar ->
  CASE
    WHEN current_role() IN ('ACCOUNTADMIN') THEN val
    ELSE '*********'
  END;


ALTER TABLE DATAMONSTER.DBO.TRIP MODIFY COLUMN PICKUPLATLONG SET MASKING POLICY geoloc;

//change role to public to see the masked result
SELECT TOP 10 * FROM DATAMONSTER.DBO.TRIP