CREATE OR REPLACE external table YellowTripdata
location=@DATAMONSTER.DBO.Clause_Azure_table/YellowTripdata/
 REFRESH_ON_CREATE =  FALSE
 AUTO_REFRESH = FALSE
 FILE_FORMAT = (TYPE = PARQUET)
 TABLE_FORMAT = DELTA;

CREATE OR REPLACE external table YellowParq
(
    VendorID INT AS (value:VendorID::INT), 
    tpep_pickup_datetime TIMESTAMP AS (value:tpep_pickup_datetime::TIMESTAMP), 
    tpep_dropoff_datetime TIMESTAMP AS (value:tpep_dropoff_datetime::TIMESTAMP),
    passenger_count INT AS (value:passenger_count::INT),
    trip_distance DECIMAL AS (value:trip_distance::DECIMAL), 
    RateCodeID INT AS (value:RateCodeID::INT),  
    store_and_fwd_flag STRING  AS (value:store_and_fwd_flag::STRING), 
    PULocationID INT AS (value:PULocationID::INT),  
    DOLocationID INT AS (value:DOLocationID::INT), 
    payment_type INT AS (value:payment_type::INT),  
    fare_amount DECIMAL AS (value:fare_amount::DECIMAL), 
    extra DECIMAL AS (value:extra::DECIMAL),
    mta_tax DECIMAL AS (value:mta_tax::DECIMAL),
    tip_amount DECIMAL AS (value:tip_amount::DECIMAL),
    tolls_amount DECIMAL AS (value:tolls_amount::DECIMAL),
    improvement_surcharge DECIMAL AS (value:improvement_surcharge::DECIMAL),
    total_amount DECIMAL AS (value:total_amount::DECIMAL),
    congestion_surcharge STRING AS (value:congestion_surcharge::STRING)
)
location=@DATAMONSTER.DBO.Clause_Azure_table/YellowTripdata/
 REFRESH_ON_CREATE =  FALSE
 AUTO_REFRESH = FALSE
 FILE_FORMAT = (TYPE = PARQUET);
 

 SELECT * FROM DATAMONSTER.DBO.YELLOWPARQ;

 CREATE MATERIALIZED VIEW Test_Yellow_Table_vw
 AS SELECT * FROM DATAMONSTER.DBO.YELLOWTRIPDATA;


 select * from Test_Yellow_Table_vw