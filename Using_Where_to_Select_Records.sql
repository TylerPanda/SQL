--All suppliers from Berlin
SELECT *
FROM suppliers
WHERE city = 'Berlin'

--Find all customer names and contacts that we have in Mexcio?
SELECT companyname, contacts
FROM customers
WHERE country = 'Mexico'

--By employee with id of 3
SELECT COUNT(*)
FROM orders
WHERE employeeid = 3;

--That had more than 20 items ordered?
SELECT COUNT(*)
FROM order_details
WHERE quantity > 20;

--How many orders had a freight cost equal to or greater than $250
SELECT COUNT(*)
FROM orders
WHERE freight >=250;

--That were ordered before or after January 01, 1998
SELECT COUNT(*)
FROM orders
WHERE orderdate >= '1998-01-01';

--How many orders shipped before July 5, 1997
SELECT COUNT(*)
FROM orders
WHERE shippeddate < '1997-07-05';

--Shipped to Germany and freight cost more than $100
SELECT COUNT(*)
FROM orders
WHERE shipcountry = 'Germany' AND freight > 100;

--Distinct customers where orders were shipped shipped via United Package (id = 2) and the ship country is Brazil.
SELECT DISTINCT customerid
FROM orders
WHERE shipcountry = 'Brazil' AND shipvia = 2;

--Do we have in USA or Canada
SELECT COUNT(*)
FROM customers
WHERE country = 'USA' OR country = 'Canada';

--How many suppliers do we have in Germany and Spain?
SELECT COUNT(*)
FROM suppliers
WHERE country = 'Germany' OR country = 'Spain';

--How many orders shipped to USA, Brazil and Argentina
SELECT COUNT(*)
FROM orders
WHERE shipcountry = 'USA' OR shipcountry = 'Brazil' OR shipcountry = 'Argentina';

--Are not in France
SELECT COUNT(*)
FROM customers
WHERE NOT country = 'France';

--How many suppliers are not in USA
SELECT COUNT(*)
FROM suppliers
WHERE NOT country = 'USA';

--Are shipped to Germany and freight charges < 50 or > 175
SELECT COUNT(*)
FROM orders
WHERE shipcountry = 'Germany' AND (freight < 50 OR freight > 175);

--How many orders shipped to Canada or Spain and shippeddate after May 1, 1997
SELECT COUNT(*)
FROM orders
WHERE (shipcountry = 'Canada' OR shipcountry = 'Spain') AND shippeddate > '1997-05-01';

--Have a unit price between $10 and $20
SELECT COUNT (*)
FROM order_details
WHERE unitprice BETWEEN 10 AND 20;

--How many orders shipped between June 1, 1996 and September 30, 1997
SELECT COUNT (*)
FROM orders
WHERE shippeddate BETWEEN '1996-06-01' AND '1996-09-30';

--How many suppliers are located in Germany, France, Spain and Italy
SELECT COUNT (*)
FROM suppliers
WHERE country in ('Germany', 'France', 'Spain', 'Italy');

--How many products do we have in category 1, 4, 6, and 7
SELECT COUNT (*)
FROM products
WHERE categoryid in (1, 4, 6 ,7);
