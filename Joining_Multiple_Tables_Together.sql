--Inner JOIN for Two tables

--Inner Join
--Connect customers to orders bring back company name, order date and ship country
SELECT companyname, orderdate, shipcountry
FROM customers
JOIN orders ON orders.customerid = customers.customerid;

--Connect employees to orders and pull back first name, last name and order date for all orders
SELECT firstname, lastname, orderdate
FROM employees
JOIN orders ON employees.employeeid = orders.employeeid;

--Connect products to suppliers and pull back company name, unit cost and units in stock
SELECT companyname, productname, unitprice, unitsinstock
FROM suppliers
JOIN products ON products.supplierid = suppliers.supplierid
ORDER BY companyname ASC;


--Left Join:
--Pull back all records in first table and any matching records in second table

--Connect customers to orders bring back company name, and order id
SELECT companyname, orderid
FROM customers
LEFT JOIN orders ON orders.customerid = customers.customerid;

--Look for customers without orders use WHERE with IS NULL
SELECT companyname, orderid
FROM customers
LEFT JOIN orders ON orders.customerid = customers.customerid
WHERE orderid IS NULL;

--Do a left join between products and order_details
SELECT productname, orderid
FROM products
LEFT JOIN order_details ON products.productid = order_details.productid;

SELECT productname, orderid
FROM products
LEFT JOIN order_details ON products.productid = order_details.productid
WHERE orderid IS NULL;


--Right Join
--Pull back matching records in first table and all records in second table

--Connect orders to customers bring back company name, and order id, using reverse table order from last lesson
SELECT companyname, orderid
FROM orders
RIGHT JOIN customers ON customers.customerid = orders.customerid;

SELECT companyname, orderid
FROM orders
RIGHT JOIN customers ON customers.customerid = orders.customerid
WHERE orderid IS NULL;

--Do a right join between customer demo and customers
SELECT companyname, customercustomerdemo.customerid
FROM customercustomerdemo
RIGHT JOIN customers ON customers.customerid = customercustomerdemo.customerid;


--Full Join
--Pull all records in first table and all records in second table

--Connect orders to customers bring back company name, and order id
SELECT companyname, orderid
FROM customers
FULL JOIN orders ON orders.customerid = customers.customerid;

--Do a full join between products and categories
SELECT productname, categoryname
FROM products
FULL JOIN categories ON categories.categoryid = products.categoryid;


--Self join
--Connect a table back to self

--Find customers who are in the same city
SELECT C1.companyname, C2.companyname, C1.city
FROM customers C1, customers C2
WHERE C1.city = C2.city AND C1.customerid > C2.customerid;

--Find suppliers from same country
SELECT S1.companyname, S2.companyname, S1.country
FROM suppliers S1, suppliers S2
WHERE S1.country = S2.country AND S1.supplierid > S2.supplierid
ORDER BY S1.country;
