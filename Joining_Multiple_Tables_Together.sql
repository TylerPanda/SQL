--Inner JOIN for Two tables

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
