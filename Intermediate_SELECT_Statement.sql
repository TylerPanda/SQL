--Order By

--List of countries of suppliers in alphabetical order and cities of suppliers in opposite alphabetical order
SELECT DISTINCT country, city
FROM suppliers
ORDER BY country ASC, city DESC;

--Get a list of product names and unit prices order by price hightest to lowest and product name a to z (if they have same price)
SELECT productname, unitprice
FROM products
ORDER BY productname ASC, unitprice DESC;


--Using MIN and MAX Functions

--When was first order ordered from Italy?
SELECT MIN(orderdate)
FROM orders
WHERE shipcountry = 'Italy';

--When was last order shipped to Canada?
SELECT MAX(shippeddate)
FROM orders
WHERE shipcountry = 'Canada';

--Find the slowest order sent to France based on order date versus ship date
SELECT MAX(shippeddate - orderdate)
FROM orders
WHERE shipcountry = 'France';


--Using AVG and SUM

--What was average freight of orders shipped to Brazil?
SELECT AVG(freight)
FROM orders
WHERE shipcountry = 'Brazil';

--How many individual items of tofu (productid = 14) were ordered?
SELECT SUM(quantity)
FROM order_details
WHERE productid = 14;

--What was the average number of Steeleye Stout (productid = 35) per order?
SELECT AVG(quantity)
FROM order_details
WHERE productid = 35;


--Using LIKE to match pattern

--a% start with a
--%e end with e
--%bob% bob in name somewhere
--A%i start with A and end with i
--_a% has a as second letter
--E_%_% start with E and has at least 2 other letters

--What customers have a contact whose first name starts with D?
SELECT companyname, contactname
FROM customers
WHERE contactname LIKE 'D%';

--Which of our suppliers have 'or' as the 2nd and 3rd letters in the company  name?
SELECT companyname
FROM suppliers
WHERE companyname LIKE '_or%';

--Which customer company names end in 'er'?
SELECT companyname
FROM customers
WHERE companyname LIKE '%er';


--Renaming colums with Alias

--For each order detail and name the field TotalSpent?
SELECT unitprice * quantity AS TotalSpent
FROM order_details;

--Use the alias in rest of query order the previous query by TotalSpent DESC.
SELECT unitprice * quantity AS TotalSpent
FROM order_details
ORDER BY TotalSpent DESC;

--Calculate our inventory value of products and return as InventoryOnHand and order by column desc
SELECT productname, unitprice * unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory DESC;


--Limit to control number od records returned

--Find 3 most experience order details will need to use calculated fields, order by and limit.
SELECT orderid, unitprice * quantity AS TotalSpent
FROM order_details
ORDER BY TotalSpent DESC
LIMIT 3;

--Calculate the 2 products with the least inventory in stock?
SELECT productname, unitprice * unitsinstock AS Inventory
FROM products
ORDER BY Inventory ASC
LIMIT 2;


--NULL Values

--How many customers don't have region value?
SELECT COUNT(*)
FROM customers
WHERE region IS NULL;

--How many suppliers have a region value?
SELECT COUNT(*)
FROM suppliers
WHERE region IS NOT NULL;

--How many orders did not have a ship region?
SELECT COUNT(*)
FROM orders
WHERE shipregion IS NULL;
