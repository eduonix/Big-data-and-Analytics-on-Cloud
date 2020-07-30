-- Create table stmt

CREATE TABLE `kelangovan-test-project.krish_test.demo_table` (

name String,
address String,
phone_number Int64
);


-- Insert into created table using console

INSERT INTO `kelangovan-test-project.krish_test.demo_table` (name, address, phone_number)
VALUES('Demo', 'Bq Dataset', '000001');

-- Query using BQ command from Terminal

bq query --use_legacy_sql=false \
'SELECT
   COUNT(*)
 FROM
   `bigquery-public-data`.samples.shakespeare'


-- Create table with partition by column

CREATE TABLE `kelangovan-test-project.krish_test.demo_table` (

name String,
address String,
phone_number Int64,
entry_date DATETIME
)

PARTITION BY entry_date ;
