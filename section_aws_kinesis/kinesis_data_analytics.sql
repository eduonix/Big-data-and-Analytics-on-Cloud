-- Create a STREAM for producing the analytics result

CREATE OR REPLACE STREAM "DEMO_STREAM" (
sector VARCHAR(16),
count_of_ticker DOUBLE
);


-- Create a PUMP to insert results into the STREAM that we created above

CREATE OR REPLACE PUMP "DEMO_PUMP" AS INSERT INTO "DEMO_STREAM"

SELECT STREAM
  sector,
  COUNT(*) OVER(PARTITION BY sector RANGE INTERVAL '10' SECOND PRECEDING) AS count_of_ticker
FROM "SOURCE_SQL_STREAM_001"
;