----NULL values
----Duplicate check
----Remove price 0
----Convert paise to rupees
----Data Cleaning             
----Products with price 0

select * from zepto
where mrp=0 or discountedSellingPrice = 0 ;


SET SQL_SAFE_UPDATES = 0;
DELETE FROM zepto 
WHERE mrp = 0 OR discountedSellingPrice = 0;

SET SQL_SAFE_UPDATES = 1;

#convert paise to rupees
update zepto 
set mrp=mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto;

