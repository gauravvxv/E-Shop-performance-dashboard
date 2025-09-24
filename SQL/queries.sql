-- CREATE TABLES

-- Customers 
create table customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
address VARCHAR(200),
email VARCHAR(200),
phone_number VARCHAR(12)
)

-- Orders
create table orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
total_price DECIMAL(10,2)
)

-- Order_items
create table order_items(
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
price_at_pruchase DECIMAL(10,2)
)

-- Payments
create table payment (
payment_id INT PRIMARY KEY,
order_id INT,
payment_method VARCHAR(20),
amount DECIMAL(10,2),
transaction_status varchar(12)
)

-- Products
create table products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(20),
price DECIMAL(10,2),
supplier_id INT
)

-- Reviews
create table reviews (
review_id INT PRIMARY KEY,
product_id INT,
customer_id INT,
rating INT,
review_text VARCHAR(200),
review_date DATE
)

-- Shipment
create table shipment (
shipment_id INT PRIMARY KEY,
order_id INT,
shipment_date DATE,
carrier VARCHAR(10),
tracking_number VARCHAR(10),
delivery_date DATE,
shipment_status VARCHAR(12)
)

-- Suppliers
create table suppliers (
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(100),
contact_name VARCHAR(50),
address VARCHAR(200),
phone_number VARCHAR(15),
email VARCHAR(50)
)
