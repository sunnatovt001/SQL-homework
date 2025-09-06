---GitHub---
--Homework-18--

create database f36_lesson18_hw
use f36_lesson18_hw



CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');


select*from Products
select*from Sales


--1. Create a temporary table named MonthlySales to store the total quantity sold and total revenue for each product in the current month.
--Return: ProductID, TotalQuantity, TotalRevenue

select ProductID,Quantity,Price from(
	select p.ProductID,p.ProductName,s.SaleDate,s.Quantity,p.Price from Products as p
	join Sales as s on p.ProductID=s.ProductID
) as MonthlySales  


--2. Create a view named vw_ProductSalesSummary that returns product info along with total sales quantity across all time.
--Return: ProductID, ProductName, Category, TotalQuantitySold

go
create view vw_ProductSalesSummary as
select p.ProductID,p.ProductName,p.Category,sum(s.Quantity) as TotalQuantitySold from Products as p
join Sales as s on p.ProductID=s.ProductID
group by p.ProductID,p.ProductName,p.Category

select*from vw_ProductSalesSummary

--3. Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
--Return: total revenue for the given product ID

create function fn_GetTotalRevenueForProduct (@ProductID int)
returns decimal(18,2)
as
begin
    declare @TotalRevenue decimal(18,2);

    select @TotalRevenue = sum(s.Quantity * p.Price)
    from Sales as s
    join Products as p on s.ProductID = p.ProductID
    where p.ProductID = @ProductID;

    return @TotalRevenue;
end


select dbo.fn_GetTotalRevenueForProduct(1)


--4. Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.

create function fn_GetSalesByCategory (@Category varchar(50))
returns table
as
return(
    select ProductName,SUM(s.quantity) as TotalQuantity,sum(s.Quantity*p.price) as TotalRevenue
    from Products as p
	join Sales as s on p.ProductID=p.ProductID
	where p.Category = @Category
	group by p.ProductName)

select * from dbo.fn_GetSalesByCategory('Electronics');


--5. You have to create a function that get one argument as input from user and the function should return 'Yes' if the input number is a prime number and 'No' otherwise. You can start it like this:

go
create function dbo.fn_IsPrime (@Number int)
returns varchar(3)
as
begin
    declare @i int = 2
    declare @Result varchar(3) = 'Yes'

    if @Number <= 1
        set @Result = 'No'
    else
    begin
        while @i <= sqrt(@Number)
        begin
            if @Number % @i = 0
            begin
                set @Result = 'No'
                break
            end
            set @i = @i + 1
        end
    end

    return @Result
end


select dbo.fn_IsPrime(7) 
select dbo.fn_IsPrime(10)


