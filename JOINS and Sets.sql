use sample;

select * from customers;
select * from orders;

insert into customers (CustomerID, Name) values (6, 'Bob');
insert into orders (OrderID, CustomerID) values (106, '5');

-- inner joins
select * from customers c inner join orders o on c.CustomerID = o.CustomerID;

-- left join
select * from customers c left join orders o on c.CustomerID = o.CustomerID;

-- left anti join 
select * from customers c left join orders o on c.CustomerID = o.CustomerID where o.OrderID is null;
-- Right join
select * from orders o right join customers c on c.CustomerID = o.CustomerID;

-- Right Anti join
select * from orders o right join customers c on c.CustomerID = o.CustomerID where o.OrderID is null;

-- Full join
select * from customers c left join orders o on c.CustomerID = o.CustomerID
union
select * from orders o right join customers c on c.CustomerID = o.CustomerID;

-- self join
SELECT c.Name AS Customer1, s.Name AS Customer2 FROM customers c
JOIN customers s ON c.CustomerID <> s.CustomerID;

-- union (Remove duplicate records)
select Name from customers union select OrderID from orders;

select Name from customers union all select OrderID from orders;

