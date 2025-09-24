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



-- Data Exploration

-- Count of customers rows (10,000)
select count(*) from customers; 

-- Count of orders rows (15,000)
select count(*) from orders;

-- Count of order_items rows (20,000)
select count(*) from order_items;

-- Count of payments rows (15,000)
select count(*) from payment;

-- Count of products rows (2000)
select count(*) from products;

-- Count of reviews rows (1,160)
select count(*) from reviews;

-- Count of shipment rows (15,000)
select count(*) from shipment;

-- Count of suppliers rows (100)
select count(*) from suppliers;

-- Checking null values in customer table
select 
sum(case when customer_id is null then 1 else 0 end) as customer_id_nulls,
sum(case when first_name is null then 1 else 0 end) as first_name_nulls,
sum(case when last_name is null then 1 else 0 end) as last_name_nulls,
sum(case when address is null then 1 else 0 end) as address_nulls,
sum(case when email is null then 1 else 0 end) as email_nulls,
sum(case when phone_number is null then 1 else 0 end) as phone_number_nulls
from customers

-- Checking null values in order table
select 
sum(case when order_id is null then 1 else 0 end) as order_id_nulls,
sum(case when order_date is null then 1 else 0 end) as order_date_nulls,
sum(case when customer_id is null then 1 else 0 end) customer_id_nulls,
sum(case when total_price is null then 1 else 0 end) as total_price_nulls
from orders

-- Checking null values in order-item table
select 
sum(case when order_item_id is null then 1 else 0 end) as order_item_id_nulls,
sum(case when order_id is null then 1 else 0 end) as order_id_nulls,
sum(case when product_id is null then 1 else 0 end) product_id_nulls,
sum(case when quantity is null then 1 else 0 end) as quantity_nulls,
sum(case when price_at_purchase is null then 1 else 0 end) as price_at_purchase_nulls
from order_items;

-- Checking null values in payment
select 
sum(case when payment_id is null then 1 else 0 end) as payment_id_nulls,
sum(case when order_id is null then 1 else 0 end) as order_id_nulls,
sum(case when payment_method is null then 1 else 0 end) payment_method_nulls,
sum(case when amount is null then 1 else 0 end) as amount_nulls,
sum(case when transaction_status is null then 1 else 0 end) as transaction_status_nulls
from payment;