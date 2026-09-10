----Top discounts
----Revenue by category
----Out of stock products
----Price per gram
----Inventory weight
----etc.

#Find the top 10 best-value products based on the discount percentage
select distinct name,mrp,discountPercent from zepto 
order by discountPercent desc
limit 10;

#what are the products with high mrp  but out of stock
select distinct name,mrp from zepto 
where  outOfStock = "TRUE" and mrp >300;

#calculate Estimated Revenue for each Category
select category,sum(discountedSellingPrice*availableQuantity) as estimated_revenue
from zepto
group by Category;

#find all products where mrp is greater than 500 and discount is less than 10%
select * 
from zepto
where mrp >500 and discountPercent<10;

#identify the top 5 categories offering the highest average discount percentage
select  Category,round(avg(discountPercent),2) as avghighestdiscountPercentage
from zepto
group by Category
order by avghighestdiscountPercentage desc
limit 5;

#Find the price per gram for products above 100g and sort by best value
select distinct name,round(discountedSellingPrice/weightInGms,2)as priceperGRAM
from zepto
where weightInGms >=100
order by priceperGRAM ;

#Group the products into categories like Low,Medium,Bulk
select distinct name,weightInGms,
case when weightInGms <1000 then "low"
     when weightInGms <5000 then "Medium"
     else "High"
     end as weightCategory
	from zepto
ORDER BY weightInGms;

#What is the total Inventory Weigth Per Category
select Category,sum(weightInGms * availableQuantity) as totalWeight  from zepto
group by Category
order by totalWeight;
