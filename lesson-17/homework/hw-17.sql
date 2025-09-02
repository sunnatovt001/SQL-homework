---GitHub---
--Homework-17--


create database f36_lesson17_hw
use f36_lesson17_hw 


--1. You must provide a report of all distributors and their sales by region. If a distributor did not have any sales for a region, rovide a zero-dollar value for that day. Assume there is at least one sale for each region
DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);

select*from #RegionSales


select 
    d.Distributor,
    r.Region,
    coalesce(sum(s.Sales), 0) as TotalSales
from (select distinct Distributor from #RegionSales) d
cross join (select distinct Region from #RegionSales) r
left join #RegionSales s
    on s.Distributor = d.Distributor
   and s.Region = r.Region
group by d.Distributor, r.Region
order by d.Distributor, r.Region


--2. Find managers with at least five direct reports

CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

select a.id,a.name,count(b.id) as Direct from Employee as a
join Employee as b on a.id=b.managerId
group by a.id,a.name
having count(b.id)>=5

--3. Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

select 
    p.product_id,
    p.product_name,
    sum(o.unit) as TotalUnits
from Products p
join Orders o 
    on p.product_id = o.product_id
where year(o.order_date) = 2020
  and month(o.order_date) = 2
group by p.product_id, p.product_name
having sum(o.unit) >= 100


--4. Write an SQL statement that returns the vendor from which each customer has placed the most orders

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');


select customerid, vendor_id, order_count
from (
    select 
        o.customer_id,
        o.vendor_id,
        count(*) as orders,
        row_number() over (
            partition by o.customer_id 
            order by count(*) desc
        ) as rn
    from Orders o
    group by o.customer_id, o.vendor_id
) t
where rn = 1;
