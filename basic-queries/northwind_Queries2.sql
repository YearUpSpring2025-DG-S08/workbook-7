-- -1. How many suppliers are there? Use a query!
SELECT SUM(SupplierID) AS num_of_suppliers
FROM
northwind.suppliers;

-- 2. What is the sum of all the employee's salaries?
SELECT SUM(Salary) AS sum_of_employee_salaries
FROM 
northwind.employees;

-- 3. What is the price of the cheapest item that Northwind sells?
SELECT ProductName, UnitPrice AS cheapest_item_sold
FROM
northwind.products
WHERE
UnitPrice = (SELECT MIN(UnitPrice) FROM northwind.products);


-- 4. What is the average price of items that Northwind sells?
SELECT AVG(UnitPrice) AS avg_price_of_items_sold
FROM
northwind.products;

-- 5. What is the price of the most expensive item that Northwind sells?
SELECT MAX(UnitPrice) AS most_expensive_item
FROM
northwind.products;

-- 6. What is the supplier ID of each supplier and the number of items they
-- supply? You can answer this query by only looking at the Products table.
SELECT 
SupplierID, SUM(ProductID) AS sum_of_items_supplied
FROM
northwind.products
GROUP BY
SupplierID;

-- 7. What is the category ID of each category and the average price of each item
-- in the category? You can answer this query by only looking at the Products
-- table
SELECT 
CategoryID, AVG(UnitPrice) AS avg_price_of_items_sold
FROM
northwind.products
GROUP BY
CategoryID;

-- 8. For suppliers that provide at least 5 items to Northwind, what is the
-- supplier ID of each supplier and the number of items they supply? You
-- can answer this query by only looking at the Products table
SELECT
SupplierID, COUNT(CategoryID) AS num_of_items_supplied
FROM
northwind.products
GROUP BY
SupplierID
HAVING
COUNT(CategoryID) >= 5;

-- 9. List the product id, product name, and inventory value (calculated by
-- multiplying unit price by the number of units on hand). Sort the results in
-- descending order by value. If two or more have the same value, order by
-- product name
SELECT
ProductID, ProductName, SUM(UnitPrice * UnitsInStock) AS inventory_value
FROM
northwind.products
GROUP BY
ProductID
ORDER BY
inventory_value DESC, ProductName ASC
