--Group By

--How many customers do we have in each country?
SELECT S1.companyname, S2.companyname, S1.country
FROM suppliers S1, suppliers S2
WHERE S1.country = S2.country AND S1.supplierid > S2.supplierid
ORDER BY S1.country;

--What is the number of products for each category?
SELECT S1.companyname, S2.companyname, S1.country
FROM suppliers S1, suppliers S2
WHERE S1.country = S2.country AND S1.supplierid > S2.supplierid
ORDER BY S1.country;

--What is the average number of items ordered for proucts ordered by the average amount?
SELECT productname, AVG(quantity)
FROM products
JOIN order_details ON products.productid = order_details.productid
GROUP BY productname
ORDER BY AVG(quantity) DESC;

--How many suppliers in each country?
SELECT country, COUNT(*)
FROM suppliers
GROUP BY country
ORDER BY COUNT(*) DESC;

--Total value of each product sold for year of 1997
SELECT country, COUNT(*)
FROM suppliers
GROUP BY country
ORDER BY COUNT(*) DESC;

--HAVING
--Difference between having and where

--Find products that sold less than $2000
SELECT productname, SUM(quantity * order_details.unitprice) AS TotalBought
FROM order_details
JOIN orders ON orders.orderid = order_details.orderid
JOIN products ON products.productid = order_details.productid
GROUP BY productname
HAVING SUM(quantity * order_details.unitprice) < 2000
ORDER BY TotalBought DESC;

--Customers that have bought more than $5000 of products
SELECT companyname, SUM(quantity * order_details.unitprice) AS TotalBought
FROM order_details
JOIN orders ON orders.orderid = order_details.orderid
JOIN customers ON customers.customerid = orders.customerid
GROUP BY companyname
HAVING SUM(quantity * order_details.unitprice) > 5000
ORDER BY TotalBought DESC;

--Union
--Combine the results of 2 or more queries

--Find products get a list of all customer and supplier company names
SELECT companyname
FROM customers
UNION
SELECT companyname
FROM suppliers;

--Find cities of all customers and suppliers. with one record for each companites city
SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers

--Distinct countries of all our customers and suppliers in alphabetical orders
SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country ASC;

--All list of countries of our suppliers and customers. with a record for each Combine
SELECT country
FROM customers
UNION ALL
SELECT country
FROM suppliers
ORDER BY country ASC;
