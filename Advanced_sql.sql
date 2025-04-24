use customers;


-- case in
select *, 
case 
	when price >20 then 'High'
    when price >=15 and price <=20 then 'Medium'
    else 'low' end as price_range
 from products
 order by price desc;
 
 select * from customers;
 
 create temporary table temp as select * from customers;
 select * from temp;
 
 drop table temp;
 
 create temporary table temp as select Country, Score from customers;
 select * from temp;
 
 drop table temp;
 
  select * from ordersarchive;
  
  -- subquery
  -- select * from ordersarchive where OrderID in (
  -- select distinct OrderID from ordersarchive where OrderDate between '2024-05-01' and '2024-05-31'
  -- )
  
   select * from ordersarchive where OrderID in (
   select distinct OrderID from ordersarchive where OrderDate not between '2024-05-01' and '2024-05-31'
  );