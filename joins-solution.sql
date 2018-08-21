--Get all customers and their addresses.
SELECT * FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";
--Get all orders and their line items.
SELECT "orders"."id", "products"."description", "line_items"."quantity" FROM "orders" JOIN "line_items" ON "orders"."id" = "line_items"."order_id" JOIN "products" ON "line_items"."product_id" = "products"."id";
--Which warehouses have cheetos?
SELECT * FROM "warehouse" JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" JOIN "products" ON "warehouse_product"."product_id" = "products"."id" WHERE "description" ILIKE 'cheetos';
--Which warehouses have diet pepsi?
SELECT * FROM "warehouse" JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" JOIN "products" ON "warehouse_product"."product_id" = "products"."id" WHERE "description" ILIKE 'diet pepsi';
--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", count("orders"."id") FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id" JOIN "orders" ON "addresses"."id" = "orders"."address_id" GROUP BY "customers"."first_name";  
--How many customers do we have?
SELECT count(*) FROM "customers";
--How many products do we carry?
SELECT count(*) FROM "products";
--What is the total available on-hand quantity of diet pepsi?
SELECT count("warehouse_product"."on_hand") FROM "warehouse_product" JOIN "products" ON "warehouse_product"."product_id" = "products"."id" WHERE "products"."description" ILIKE 'diet pepsi'; 
--(Stretch) How much was the total cost for each order?
--(Stretch) How much has each customer spent in total?
--(Stretch) How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).

