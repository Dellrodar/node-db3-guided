-- Northwind DB
-- getting Sum of column
SELECT SUM("Quantity")
FROM "OrderDetail"
WHERE "ProductID" = 11;

-- making that sum a column called Total
SELECT SUM("Quantity") AS "Total"
FROM "OrderDetail"
WHERE "ProductID" = 11;

-- Sum of All products
SELECT SUM("Quantity") AS "Total"
FROM "OrderDetail";

--totaling quantiy by productId
SELECT "ProductId", SUM("Quantity") AS "Total"
FROM "OrderDetail"
GROUP BY "ProductId";

-- Counting all products and seperating by CategoryId
SELECT "CategoryId",
COUNT() "TotalProducts"
FROM "Product"
GROUP BY "CategoryId";

-- Query into multiple tables
SELECT *
FROM "OrderDetail"
JOIN "Product"
ON "OrderDetail"."ProductId" = "Product"."Id"
LIMIT 1000; --Limit imposed as this is over 651k entries

-- shortening with aliases
SELECT o."Id", o."Quantity", p."ProductName"
FROM "OrderDetail" AS o
JOIN "Product" AS p
ON o."ProductId" = p."Id";

-- Joining and filtering an employees first and last name based off an order number
SELECT e."FirstName", e."LastName"
FROM "Order" AS o
JOIN "Employee" as e
ON o."EmployeeId" = e."Id"
WHERE o."Id" = 16608;

-- Example of default INNER JOIN
SELECT
  c."ContactName" "CustomerName",
  e."FirstName" || " " || e."LastName" "EmployeeName"
FROM "Order" AS o
JOIN "Employee" as e
ON o."EmployeeId" = e."Id"
JOIN "Customer" as c
ON o."CustomerId" = c."Id"
WHERE o."Id" = 16608;

--