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

-- Checking null values in payment table
select 
sum(case when payment_id is null then 1 else 0 end) as payment_id_nulls,
sum(case when order_id is null then 1 else 0 end) as order_id_nulls,
sum(case when payment_method is null then 1 else 0 end) payment_method_nulls,
sum(case when amount is null then 1 else 0 end) as amount_nulls,
sum(case when transaction_status is null then 1 else 0 end) as transaction_status_nulls
from payment;

-- Checking null values in product table
select 
sum(case when product_id is null then 1 else 0 end) as product_id_nulls,
sum(case when product_name is null then 1 else 0 end) as product_name_nulls,
sum(case when category is null then 1 else 0 end) category_nulls,
sum(case when price is null then 1 else 0 end) as price_nulls,
sum(case when supplier_id is null then 1 else 0 end) as supplier_id_nulls
from products;

-- Checking null values in shipment table
select 
sum(case when shipment_id is null then 1 else 0 end) as shipment_id_nulls,
sum(case when order_id is null then 1 else 0 end) as order_id_nulls,
sum(case when shipment_date is null then 1 else 0 end) shipment_date_nulls,
sum(case when carrier is null then 1 else 0 end) as carrier_nulls,
sum(case when tracking_number is null then 1 else 0 end) as tracking_number_nulls,
sum(case when delivery_date is null then 1 else 0 end) as delivery_date_null,
sum(case when shipment_status is null then 1 else 0 end) as shipment_status_nulls
from shipment;

-- checking null values in reviews table
select 
sum(case when review_id is null then 1 else 0 end) as review_id_nulls,
sum(case when product_id is null then 1 else 0 end) as product_id_nulls,
sum(case when customer_id is null then 1 else 0 end) customer_id_nulls,
sum(case when rating is null then 1 else 0 end) as rating_nulls,
sum(case when review_text is null then 1 else 0 end) as review_text_nulls,
sum(case when review_date is null then 1 else 0 end) as review_date_nulls
from reviews;

-- Checking null values suppliers table
select 
sum(case when supplier_name is null then 1 else 0 end) as supplier_name_nulls,
sum(case when supplier_id is null then 1 else 0 end) as supplier_id_nulls,
sum(case when contact_name is null then 1 else 0 end) contact_name_nulls,
sum(case when address is null then 1 else 0 end) as address_nulls,
sum(case when phone_number is null then 1 else 0 end) as phone_number_nulls,
sum(case when email is null then 1 else 0 end) as email_nulls
from suppliers;

-- Customers Table:

-- Total Customers
select count(*) as total_customers from customers;

-- Top 5 customer–product–category purchase records by amount
select c.last_name,
c.email,
p.category,
p.product_name,
sum(oi.price_at_purchase) as total_purchase_amount 
from customers c
inner join orders o
on c.customer_id = o.customer_id
inner join order_items oi
on oi.order_id = o.order_id
inner join products p
on oi.product_id = p.product_id
group by c.last_name,c.email,p.category,p.product_name
order by total_purchase_amount desc
limit 5;

-- Orders Table:

-- Number of orders per customer
 select c.last_name,count(o.order_id) as total_orders from customers c 
 inner join orders o
 on c.customer_id = o.customer_id
 group by c.last_name
 order by total_orders desc;

-- Average Order value
 select round(avg(total_price),2) as avg_order_value from orders;

 
-- Products Table:

-- Different Categories
select distinct category from products;

-- Average,Minimun,Maximum and Total price from product table
select 
category,
sum(price) as total_price,
round(avg(price),2) as average_price,
min(price) as minimum_price,
max(price) as maximum_price
from products
group by category
order by total_price desc;

-- Count of Products per Category
select
category,
count(product_name) as total_products 
from products
group by category
order by total_products desc;

