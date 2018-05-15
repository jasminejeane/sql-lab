-- 1.
SELECT item_no, item_description
FROM products
WHERE case_cost >= 100
AND pack >= 12;

-- 2.
SELECT  DISTINCT category_name, vendor_name
FROM products

-- 3.
SELECT * FROM products WHERE CAST(proof AS int) > 85;

-- 4.
WHERE category_name in (“PEACH BRANDIES”, “FLAVORED VODKA”, “FLAVORED RUM”)

-- 5.
SELECT * FROM products WHERE category_name LIKE I"%IMPORTED%";

-- 6.

SELECT vendor FROM sales WHERE category_name LIKE "%IMPORTED%" GROUP BY vendor ORDER BY SUM(total) DESC LIMIT 10

-- 7.

SELECT SUM(total), vendor, AVG(total) FROM sales WHERE category_name LIKE "%IMPORTED%" GROUP BY vendor HAVING SUM(total) > 100000 ORDER BY AVG(total) DESC

-- 8.

SELECT a.store_name, a.sales_2017, b.sales_2018, (b.sales_2018 - a.sales_2017) AS delta FROM ( (SELECT store_name, SUM(week1+week2+week3+week4) AS sales_2017 FROM fy17p GROUP BY store_name ) a INNER JOIN (SELECT store_name, SUM(week1+week2+week3+week4) AS sales_2018 FROM fy18p GROUP BY store_name ) b ON a.store_name = b.store_name ) ORDER BY delta DESC
