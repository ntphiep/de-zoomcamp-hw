# Introduction

Text note file in this project: [Note](https://docs.google.com/document/u/0/d/e/2PACX-1vRJUuGfzgIdbkalPgg2nQ884CnZkCg314T_OBq-_hfcowPxNIA0-z5OtMTDzuzute9VBHMjNYZFTCc1/pub?pli=1)

Run the following to create Psql container.
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