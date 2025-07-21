---EASY
	--Define and explain the purpose of BULK INSERT in SQL Server.
		-- Fast: Loads a lot of data at one time.
		-- Easy: Moves data from a file into a table easily.
		-- Saves time: Quicker than inserting rows one by one.
		-- Good for big files: For example, CSV or TXT files.

		--islashi uchun maxsus code
		--bulk insert customers
		--from 'C:\Users\Maab LLC\Desktop\customer2.txt'
		--with 
		--(
		--fieldterminator = ',',
		--rowterminator = '\n',
		--firstrow = 2
		--)

		--select * from Customers

	--List four file formats that can be imported into SQL Server.
		--CSV (Comma-Separated Values)

		--TXT (Plain Text Files)

		--XML (Extensible Markup Language)

		--Excel files (e.g. .xls, .xlsx)


	--Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
		CREATE TABLE Products
		(
		ProductID INT PRIMARY KEY,
		ProductName VARCHAR(50),
		Price DECIMAL(10,2)
		);

	--Insert three records into the Products table using INSERT INTO.
		INSERT INTO Products VALUES (1, 'Laptop', 1200.50)

		INSERT INTO Products VALUES (2, 'Mouse', 15.99)

		INSERT INTO Products VALUES (3, 'Keyboard', 45.25)
		select*from Products
		ALTER TABLE Products
		ADD CONSTRAINT unique_ProductName UNIQUE (ProductName);

	--Explain the difference between NULL and NOT NULL.
		---NULL: Value is missing or unknown.
		---NOT NULL: Value is required. Cannot be empty.
		--NULL = can be empty.
		--NOT NULL = cannot be empty.

	--Add a UNIQUE constraint to the ProductName column in the Products table.
		ALTER TABLE Products
		ADD CONSTRAINT unique_ProductName UNIQUE (ProductName);
	--Write a comment in a SQL query explaining its purpose.
		--  -- comment

	--Add CategoryID column to the Products table.
		alter table Products
		add CategoryID int

		select*from Products

	--Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
		create table Categories(CategoryID int primary key, CategoryName varchar(50) unique)

	--Explain the purpose of the IDENTITY column in SQL Server.
		--IDENTITY = a column that automatically assigns a number to each row.

--Medium
	--Use BULK INSERT to import data from a text file into the Products table.
		bulk insert Products
		from 'C:\Users\user\Desktop\customer.txt'
		with 
		(
		fieldterminator = ',',
		rowterminator = '\n',
		firstrow = 2
		)

		select * from Products

	--Create a FOREIGN KEY in the Products table that references the Categories table.
		ALTER TABLE Products
		ADD CONSTRAINT fk_CategoryID
		FOREIGN KEY (CategoryID)
		REFERENCES Categories(CategoryID);

	--Explain the differences between PRIMARY KEY and UNIQUE KEY.
		--PRIMARY KEY: No NULL, only one per table.

		--UNIQUE KEY: Can have NULL, many per table.

	--Add a CHECK constraint to the Products table ensuring Price > 0.
		create table Employee (Employee int,Age int check (Age>18),salary numeric (10,2) check (salary>1000))
		
	--Modify the Products table to add a column Stock (INT, NOT NULL).
		alter table Products
		add Stock int NOT NULL default 0
		select*from Products
	--Use the ISNULL function to replace NULL values in Price column with a 0.
		select ProductID, ProductName, isnull(Price, 0) as Price from Products;
	--Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
		--FOREIGN KEY = links tables + keeps data correct.

--HARD
	--Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
		create table Customers (CustomerID int, CustomerName varchar(50),CustomerAge int check (CustomerAge >= 18))
		insert into Customers values (1,'Sunnatov',20)
		insert into Customers values (2,'Sunnatov',15)
		insert into Customers values (3,'Sunnatov',18)
		select*from Customers
	
	--Create a table with an IDENTITY column starting at 100 and incrementing by 10.
		create table Orders (OrderID int identity (100,10) Primary key,OrderName varchar(50))

	--Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
		create table OrderDetails(OrderID int,ProductID int,Quantity int,primary key (OrderID, ProductID))

	--Explain the use of COALESCE and ISNULL functions for handling NULL values.
		--COALESCE: Can check many values.
		--ISNULL: Checks one value only.
	--Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
		CREATE TABLE Employees(EmpID INT PRIMARY KEY,Name VARCHAR(50),Email VARCHAR(100) UNIQUE)

	--Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
		CREATE TABLE ParentTable (ParentID INT PRIMARY KEY,-- other columns)

		CREATE TABLE ChildTable (ChildID INT PRIMARY KEY,ParentID INT,-- other columns
        CONSTRAINT FK_Child_Parent FOREIGN KEY (ParentID)
        REFERENCES ParentTable (ParentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)
