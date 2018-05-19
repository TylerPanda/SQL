--SQL = Structured Query Language

--Select all from customers table
SELECT *
FROM customers;

--Select all from employees tablecord
SELECT *
FROM employees;

--Select companyname, city and country of all our  supppliers
SELECT companyname, city, country
FROM suppliers;

--Select the name and description of all our product categories
SELECT categoryname, description
FROM categories;

--What countries do our customers come from?
SELECT DISTINCT country
FROM customers;

--What are the unique regions our customers are in?
SELECT DISTINCT region
FROM suppliers;

--Counting Results

--How many produts do we carry
SELECT COUNT(*)
FROM products;

--How many orders do we had?
SELECT COUNT(*)
FROM products;

--How many cities are our suplliers?
SELECT COUNT(DISTINCT city)
FROM suppliers;

--How many distinct products have been ordered?
SELECT COUNT(DISTINCT productid)
FROM order_details;

--List our customerid and different between ship date and order date for all orders
SELECT customerid, shippeddate - orderdate
FROM orders;

--Select the amount spent on order details(price times quantity)?
SELECT orderid, unitprice * quantity
FROM order_details;
