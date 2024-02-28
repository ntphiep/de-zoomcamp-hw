# Introduction

Run 
```bash
docker-compose up -d
```

The PgAdmin UI will run on localhost:8080

To download the dataset:

```bash
wget -P .\dataset\ https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz
```

To unzip .gz file:
```
 gzip -d .\dataset\yellow_tripdata_2021-01.csv.gz
```