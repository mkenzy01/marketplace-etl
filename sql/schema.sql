-- PostgreSQL 14+; run against a dedicated database (e.g. soum_demo).
CREATE TABLE IF NOT EXISTS customers (
  customer_id INTEGER PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  city TEXT NOT NULL,
  signup_date DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL,
  category TEXT NOT NULL,
  unit_price_ngn NUMERIC(12,2) NOT NULL CHECK (unit_price_ngn >= 0)
);
CREATE TABLE IF NOT EXISTS orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
  product_id INTEGER NOT NULL REFERENCES products(product_id),
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  unit_price_ngn NUMERIC(12,2) NOT NULL CHECK (unit_price_ngn >= 0),
  ordered_at TIMESTAMP NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('completed','pending','cancelled','refunded'))
);
