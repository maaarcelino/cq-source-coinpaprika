# Table: coinpaprika_exchanges

This table shows data for Coinpaprika Exchanges.

The primary key for this table is **id**.

## Columns

| Name          | Type          |
| ------------- | ------------- |
|_cq_id|`uuid`|
|_cq_parent_id|`uuid`|
|id (PK)|`utf8`|
|name|`utf8`|
|message|`utf8`|
|description|`utf8`|
|active|`bool`|
|website_status|`bool`|
|api_status|`bool`|
|markets_data_fetched|`bool`|
|rank|`int64`|
|adjusted_rank|`int64`|
|reported_rank|`int64`|
|currencies|`int64`|
|markets|`int64`|
|adjusted_volume_24h_share|`float64`|
|fiats|`json`|
|quotes|`json`|
|links|`json`|
|last_updated|`utf8`|