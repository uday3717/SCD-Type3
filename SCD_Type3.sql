create table product_scd3(
product_id integer,
product_name varchar(50),
old_product_name varchar(50) default null,
product_price integer,
old_product_price integer default null
);
------
select * from product_scd3
delete from product_scd3 where product_id=3
-----
drop table product_scd3
----
select * from products_stg
--
update product_scd3 set old,product_name=product_name,old_product_price=product_price where product_id in (select a.product_id from product_scd3 a join products_stg b on a.product_id=b.product_id)
---
update product_scd3 set product_price = products_stg.product_price,product_name=products_stg.product_name from products_stg where product_scd3.product_id=products_stg.product_id