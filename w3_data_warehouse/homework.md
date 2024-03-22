## Week 3 Homework
ATTENTION: At the end of the submission form, you will be required to include a link to your GitHub repository or other public code-hosting site. This repository should contain your code for solving the homework. If your solution includes code that is not in file format (such as SQL queries or shell commands), please include these directly in the README file of your repository.

<b><u>Important Note:</b></u> <p> For this homework we will be using the 2022 Green Taxi Trip Record Parquet Files from the New York
City Taxi Data found here: </br> https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page </br>
If you are using orchestration such as Mage, Airflow or Prefect do not load the data into Big Query using the orchestrator.</br> 
Stop with loading the files into a bucket. </br></br>
<u>NOTE:</u> You will need to use the PARQUET option files when creating an External Table</br>

<b>SETUP:</b></br>
Create an external table using the Green Taxi Trip Records Data for 2022. </br>
Create a table in BQ using the Green Taxi Trip Records for 2022 (do not partition or cluster this table). </br>
</p>

### ***My approach***
- Just download all Green Taxi Trip Record Parquet Files from 2022 and save it in your local environment.
- In gcp storage, create a new folder and put all the green Taxi Trip Record Files via drag-and-drop.
- This is my path: mage-zoomcamp-matt-palmer-1/green_tripdata_2022
- Create `green_taxi` folder in BigQuery with Cloud Shell terminal:
```bash
Welcome to Cloud Shell! Type "help" to get started.
Your Cloud Platform project in this session is set to evident-beacon-412117.
Use “gcloud config set project [PROJECT_ID]” to change to a different project.
fatihoezkan93@cloudshell:~ (evident-beacon-412117)$ bq mk --location=EU evident-beacon-412117:green_taxi
Dataset 'evident-beacon-412117:green_taxi' successfully created.
fatihoezkan93@cloudshell:~ (evident-beacon-412117)$
```
***Create the external table:***

```sql
CREATE OR REPLACE EXTERNAL TABLE `evident-beacon-412117.green_taxi.external_green_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://mage-zoomcamp-matt-palmer-1/green_tripdata_2022/green_tripdata_2022-*.parquet']
);
```
***Create the table from the external table:***
```sql
CREATE TABLE `evident-beacon-412117.green_taxi.green_tripdata`
AS
SELECT *
FROM `evident-beacon-412117.green_taxi.external_green_tripdata`;
```


## Question 1:
Question 1: What is count of records for the 2022 Green Taxi Data??
- 65,623,481
- 840,402 👍
- 1,936,423
- 253,647

```sql
SELECT COUNT(*) FROM `evident-beacon-412117.green_taxi.external_green_tripdata`
```

## Question 2:
Write a query to count the distinct number of PULocationIDs for the entire dataset on both the tables.</br> 
What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?

- 0 MB for the External Table and 6.41MB for the Materialized Table 👍
- 18.82 MB for the External Table and 47.60 MB for the Materialized Table
- 0 MB for the External Table and 0MB for the Materialized Table
- 2.14 MB for the External Table and 0MB for the Materialized Table

```sql
SELECT DISTINCT COUNT(PULocationID) FROM `evident-beacon-412117.green_taxi.external_green_tripdata`;
```
```sql
SELECT DISTINCT COUNT(PULocationID) FROM `evident-beacon-412117.green_taxi.green_tripdata`;
```



## Question 3:
How many records have a fare_amount of 0?
- 12,488
- 128,219
- 112
- 1,622 👍

```sql
SELECT COUNT(fare_amount) FROM `evident-beacon-412117.green_taxi.external_green_tripdata`
WHERE fare_amount = 0;
```

## Question 4:
What is the best strategy to make an optimized table in Big Query if your query will always order the results by PUlocationID and filter based on lpep_pickup_datetime? (Create a new table with this strategy)
- Cluster on lpep_pickup_datetime Partition by PUlocationID
- Partition by lpep_pickup_datetime  Cluster on PUlocationID 👍
- Partition by lpep_pickup_datetime and Partition by PUlocationID
- Cluster on by lpep_pickup_datetime and Cluster on PUlocationID

The result of both are the same ***but*** the first query will cost 0 mb and the second one will cost around 114 mb.
```sql
CREATE OR REPLACE TABLE evident-beacon-412117.green_taxi.green_tripdata_partitoned_clustered
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID AS
SELECT * FROM evident-beacon-412117.green_taxi.external_green_tripdata;
```
```sql
CREATE OR REPLACE TABLE evident-beacon-412117.green_taxi.materialized_green_tripdata_partitoned_clustered
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID AS
SELECT * FROM evident-beacon-412117.green_taxi.green_tripdata;
```



## Question 5:
Write a query to retrieve the distinct PULocationID between lpep_pickup_datetime
06/01/2022 and 06/30/2022 (inclusive)</br>

Use the materialized table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you created for question 4 and note the estimated bytes processed. What are these values? </br>

Choose the answer which most closely matches.</br> 

- 22.82 MB for non-partitioned table and 647.87 MB for the partitioned table
- 12.82 MB for non-partitioned table and 1.12 MB for the partitioned table 👍
- 5.63 MB for non-partitioned table and 0 MB for the partitioned table
- 10.31 MB for non-partitioned table and 10.31 MB for the partitioned table

```sql
SELECT DISTINCT (PULocationID) FROM evident-beacon-412117.green_taxi.green_tripdata
WHERE Date(lpep_pickup_datetime) between '2022-06-01'AND '2022-06-30'
```
```sql
SELECT DISTINCT (PULocationID) FROM evident-beacon-412117.green_taxi.materialized_green_tripdata_partitoned_clustered
WHERE Date(lpep_pickup_datetime) between '2022-06-01'AND '2022-06-30'
```






## Question 6: 
Where is the data stored in the External Table you created?

- Big Query
- GCP Bucket 👍
- Big Table
- Container Registry


## Question 7:
It is best practice in Big Query to always cluster your data:
- True
- False 👍


## (Bonus: Not worth points) Question 8:
No Points: Write a SELECT count(*) query FROM the materialized table you created. How many bytes does it estimate will be read? Why?

***This query will process 0 B when run***
```sql
SELECT DISTINCT COUNT(*) FROM `evident-beacon-412117.green_taxi.green_tripdata`;
```

The query is a simple aggregation query counting the distinct values of all rows in the specified table. The fact that the query has a cost of 0 B processed doesn't mean it's entirely free; it indicates that the query is relatively lightweight in terms of data processing.

In some cases, queries that involve only metadata operations (such as retrieving the count of distinct values) may have a lower or zero-byte processed cost compared to queries that involve scanning and processing actual data.
 
