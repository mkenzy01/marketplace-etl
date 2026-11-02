-- Use AFTER the first Airbyte sync to test a second sync.
-- Re-running this insert will not duplicate the row.
INSERT INTO orders (order_id,customer_id,product_id,quantity,unit_price_ngn,ordered_at,status)
VALUES (121,1,2,2,17500.00,'2026-11-01 10:00:00','completed')
ON CONFLICT (order_id) DO NOTHING;
