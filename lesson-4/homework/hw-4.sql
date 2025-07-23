	--Github Homework

--EASY
	--Write a query to select the top 5 employees from the Employees table.
		create table Employees (EmployeeID int,EmployeeName varchar(50), Department varchar(30), Email varchar(30),Salary decimal (10,2))
		insert into Employees values (1,'Saidamin','HR','saidamin@gmail.com',70000.58)
		insert into Employees values (2,'Tolibjon','HR','sunnatov@gmail.com',80000.98)
		insert into Employees values (3,'Alien','Finansy',null,60000.10)
		insert into Employees values (4,'Solih','Maneger',null,2000)
		insert into Employees values (5,'Simon','Maneger',null,5800.56)
		select*from Employees		

		select Top 3*from Employees
		order by Salary desc
		drop table Employees
	--Use SELECT DISTINCT to select unique Category values from the Products table.
		create table Products_Uzbekistan (ID int,Category varchar(30),ProductName varchar(30),Price decimal(10,2),ExpertDate date)
		insert into Products_Uzbekistan values (1,'Drinks','Coke',500,'1/1/2024')
		insert into Products_Uzbekistan values (2,'Snacks','Sweet',85,'1/1/2024')
		insert into Products_Uzbekistan values (1,'Foods','Gamburger',55,'1/1/2024')
		insert into Products_Uzbekistan values (1,'Drinks','Coke',500,'1/1/2024')
		insert into Products_Uzbekistan values (1,'Fruits','Apple',125,'1/1/2024')
		insert into Products_Uzbekistan values (1,'Foods','Gamburger',88,'1/1/2024')
		
		select*from Products_Uzbekistan
		select distinct Category from Products_Uzbekistan
	--Write a query that filters the Products table to show products with Price > 100.
		select*from Products_Uzbekistan
		where Price >100 

	--Write a query to select all Customers whose FirstName start with 'A' using the LIKE operator.
		select*from Employees
		where EmployeeName like 'a%'

	--Order the results of a Products table by Price in ascending order.
		select *from Products_Uzbekistan
		order by Price desc

	--Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'.
		select*from Employees
		where salary >=60000 and department = 'HR'

	--Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table
		SELECT EmployeeID, EmployeeName,Department, ISNULL(Email, 'noemail@example.com') AS Email,Salary
		FROM Employees;

	--Write a query that shows all products with Price BETWEEN 50 AND 100.
		select*from Products_Uzbekistan
		where Price  between 50 and 100

	--Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
		select*from Products_Uzbekistan
		select distinct Category,ProductName from Products_Uzbekistan

	--After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.
		select*from Products_Uzbekistan
		select distinct Category,ProductName from Products_Uzbekistan
		order by category,ProductName desc


--Medium
	--Write a query to select the top 10 products from the Products table, ordered by Price DESC.
		create table Products (ID int,Name varchar(30),Price decimal(10,2),stock int)
		insert into Products values (1,'Apple',75,50)
		insert into Products values (2,'watermelon',50,75)
		insert into Products values (2,'banana',45,25)
		insert into Products values (2,'kiwi',100,15)
		insert into Products values (2,'banan',45,85)
		insert into Products values (2,'watermelon',50,75)
		insert into Products values (2,'kiwi',100,50)
		insert into Products values (2,'avacado',85,49)
		insert into Products values (2,'pear',25,25)
		insert into Products values (2,'pear',25,10)
		select*from Products		
		
		select Top 10*from Products
		order by Price desc

	--Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
		create table employees1 (employeeid int,firstname varchar(30),lastname varchar(30),Birthday date,Department varchar(30),salary int, )

		insert into employees1 values (1, 'ali', 'karimov','1/1/1992','Marketing',1000)
		insert into employees1 values (2, null, 'hasanov','1/1/1990','Marketing',1500)
		insert into employees1 values (3, 'vali', null,'1/1/1985','Marketing',500)
		insert into employees1 values (4, null, 'olimov','1/1/1981','Maneger',1480)
		insert into employees1 values (5, 'aziz', 'rahimov','1/1/1995','HR',1000)
		insert into employees1 values (6, null, null,'1/1/2000','Finansy',1400)
		insert into employees1 values (7, 'bobur', 'xon','1/1/2001','Marketing',850)
		insert into employees1  values (8, null, 'salimov','1/1/1998','HR',879)
		insert into employees1  values (9, 'husan', null,'1/1/2000','Maneger',250)
		insert into employees1  values (10, null, 'qodirov','1/1/1980','Maneger',1580)
		
		select * from employees1 
		select employeeid, coalesce(firstname, lastname) as name from employees1

	--Write a query that selects distinct Category and Price from the Products table.
		select*from Products
		select distinct Name,Price from Products

	--Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
		select*from employees1
		where datediff(year, birthday, getdate()) between 30 and 40 or Department='Marketing'

	--Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
		select*from employees1
		order by Salary desc
		offset 5 row fetch next 5 rows only

	--Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
		select*from Products
		where Price <=1000 and Stock>50

	--Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
		select*from Products
		where Name like '%e%'

	--Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.
		select*from employees1
		where Department in ('HR','Finansy','Maneger')

	--Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table
		create table Customers (ID int,Name varchar(30),City varchar(30),PostalCode varchar(30),email varchar(50))
		insert into Customers values (1,'Tolibjon','Toshkent','1000','sunnatov@gmail.com')
		insert into Customers values (2,'Saidamin','Qashqadaryo','10500','saidamin@gmail.com')
		insert into Customers values (3,'Simon','NewYrok','A12L97R','simon@gmail.ru')
		insert into Customers values (4,'Uamr', 'Samarkand','15800','umar.apple.id')
		insert into Customers values (5,'Sardor','Malaysia','A466Q98','sardor@gamil.com')
		
		select*from Customers
		order by City asc, PostalCode desc

	
--HARD
	--Write a query that selects the top 5 products with the highest sales, using TOP(5) and ordered by SalesAmount DESC.
		create table ProductsAmount (ID int,Category varchar(30),Name varchar(30), Price decimal (10,2),SalesAmount int)
		insert into ProductsAmount values  (1,'Drinks','Coke',10,45)
		insert into ProductsAmount values (2,'Foods','Gamburger',25,75)
		insert into ProductsAmount values (3,'Drinks','Water',10,78)
		insert into ProductsAmount values (4,'Sweet','candy',15,71)
		insert into ProductsAmount values (5,'Foods','Hamburger',59,70)
		insert into ProductsAmount values (3,'Drinks','tea',15,100)
		select*from ProductsAmount  
		
		select Top 5*from ProductsAmount
		order by SalesAmount desc

	--Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)
		select firstname + ' ' + lastname as fullname from employees1

	--Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
		select distinct category, name, price from productsAmount where price > 50

	--Write a query that selects products whose Price is less than 10% of the average price in the Products table. (Do some research on how to find average price of all products)
		select *from ProductsAmount
		where price < (select avg(price) * 0.1 from ProductsAmount)

	--Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
		select*from employees1
		where Birthday <'1/1/1995' or Department in ('HR','Finansy')

	--Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
		select*from Customers
		where email like '%@gmail.com'

	--Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.
		select *from employees1
		where salary > all (select salary from employees1 where department = 'Sales')

	--Write a query that filters the Orders table for orders placed in the last 180 days using BETWEEN and LATEST_DATE in the table. (Search how to get the current date and latest date)
		create table orders (orderid int,customerid int,orderdate date,totalamount decimal(10,2))

		insert into orders values 
		(1, 101, '2024-12-01', 250.00),
		(2, 102, '2025-01-15', 180.50),
		(3, 103, '2025-02-10', 300.75),
		(4, 104, '2025-03-25', 150.00),
		(5, 105, '2025-04-05', 420.90),
		(6, 106, '2025-05-19', 50.00),
		(7, 107, '2025-06-01', 600.00),
		(8, 108, '2025-06-20', 125.25),
		(9, 109, '2025-07-05', 700.40),
		(10, 110, '2025-07-20', 350.10)
		select *from orders
		where orderdate between dateadd(day, -180, (select max(orderdate) from orders))
        and (select max(orderdate) from orders);
