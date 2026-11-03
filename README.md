# Marketplace ELT Pipeline

A side data engineering project I worked on to explore Google Cloud Dataform and Airbyte.

The idea was to move marketplace data from PostgreSQL into BigQuery using Airbyte, then use Dataform to transform the data for analysis.

## Tools I Used

- PostgreSQL (Neon)
- SQL
- Airbyte
- Google BigQuery
- Google Cloud Dataform


## Process

The pipeline follows this flow:

**PostgreSQL > Airbyte > BigQuery > Dataform**

I created three tables in PostgreSQL: `customers`, `products`, and `orders`, and populated them with sample marketplace data.

I then configured Airbyte to sync the tables into BigQuery, where the raw data is stored in the `marketplace_raw` dataset.

For the transformation part, I used Dataform to create an order staging table (`stg_orders`) and a product sales summary (`product_sales_summary`). The summary shows completed orders, quantities sold, and revenue for each product.

I also added data quality assertions to check for things like missing order IDs, invalid quantities, and negative prices.

## Testing OF New Records

After the initial sync, I inserted another order into PostgreSQL (`order_id = 121`) and ran Airbyte again.

I then re-executed the Dataform transformation and confirmed that the new order appeared in BigQuery.

This was to check that the pipeline could pick up newly added source records during subsequent syncs.

## Screenshots

Screenshots of the Airbyte sync, Dataform executions, and BigQuery results are included in the repository.

## Project Structure

- `data/` - sample CSV files
- `sql/` - PostgreSQL schema, validation, and new-record test scripts
- `dataform/definitions/` - Dataform SQLX transformations and assertions
- `screenshots/` - screenshots from the pipeline