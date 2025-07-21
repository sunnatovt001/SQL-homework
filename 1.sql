	---github homework---

	---EASY---
	--Define the following terms: data, database, relational database, and table.
	--DATA: Data is raw facts and figures without any context. For example: numbers, names, or dates like “15”, “Tolibjon”, or “20 May 2010”.
	--DATABASE: A database is a place on the computer where we keep a lot of data together. For example: a database can store all students’ names and marks in a school.
	--RELATIONAL DATABASE: A relational database is a type of database that keeps data in tables and connects these tables using special keys.For example:One table has student names, another table has their subjects, and they are linked together.
	--TABLE:A table is like a grid in a database. It has columns and rows to keep data in order.For example: A “Students” table with columns Name, Age, and Class.

	--List five key features of SQL Server.
	--Stores data safely.
	--Uses tables.
	--Allows many users.
	--Has security.
	--Supports backups.
	
	--What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
	--Windows Authentication
	--SQL Server Authentication
	

	---Medium---
	--Create a new database in SSMS named SchoolDB.
	CREATE DATABASE SchoolDB

	--Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
	create table Students (StudentID INT PRIMARY KEY,Name VARCHAR(50),Age INT)
	select*from Students

	--Describe the differences between SQL Server, SSMS, and SQL.
	--SQL Server is a software made by Microsoft. It stores and manages data in databases.
	--SSMS is a tool (program) to connect to SQL Server easily. It helps you write queries and manage your databases.
	--SQL is a language used to talk to databases.


	---Hard---
	Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
	1. DQL (Data Query Language)
	It is used to ask questions and get data from the database. Main command: SELECT.
	2. DML (Data Manipulation Language)
	It is used to change or manage data inside tables. Main commands: INSERT – to add data, UPDATE – to change data, DELETE – to remove data.
	3. DDL (Data Definition Language)
	It is used to define and change the structure of the database (tables, databases). Main commands: CREATE – to create a database or table ALTER – to change table structure DROP – to delete tables or databases.
	4. DCL (Data Control Language)
	It is used to control access and permissions in the database. Main commands: GRANT – to give permissions, REVOKE – to take back permissions.
	5. TCL (Transaction Control Language) 
	It is used to manage changes (transactions) in the database. Main commands: COMMIT – to save changes, ROLLBACK – to undo changes, SAVEPOINT – to set a point to rollback to later.

	Write a query to insert three records into the Students table.
	insert into Students (StudentID, Name, Age) values (1, 'Ali', 16),(2, 'Samira', 17),(3, 'Jasur', 18);
	select*from Students