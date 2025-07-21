	---Github Homework---

	---EASY---
	---Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
	create table Employees (EmpID INT,Name VARCHAR(50),Salary DECIMAL(10,2))

	---Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
	--1st way
	insert into Employees values (1, 'Ali', 1500.50)
	insert into Employees values (2,'David',150.89)
	insert into Employees values (3, 'Simon', 1128.68)
	select*from Employees

	update Employees
	set Salary = 7000
	where EmpID = 1

	delete from Employees 
	where EmpID = 2

	alter table Employees
	alter column Name VARCHAR(100);

	alter table Employees
	add Department varchar(50);

	alter table Employees
	alter column Salary float;

	delete from Employees

	--2nt way 
	insert into Employees values (1, 'Ali', 1500.50),(2,'David',150.89),(3, 'Simon', 1128.68)

	--3rd way
	insert into Employees (EmpID,Name,Salary) values (1, 'Ali', 1500.50),(2,'David',150.89),(3, 'Simon', 1128.68)

	---4th way
	insert into Employees
	select 1,'Ali',1200
	union all
	select 2,'David',1200

	drop table Employees


	---Update the Salary of an employee to 7000 where EmpID = 1.
	update Employees
	set Salary = 7000
	where EmpID=1		---1st way ni ichiga yozganman---

	---Delete a record from the Employees table where EmpID = 2.
	delete from Employees 
	where EmpID = 2		---1st way ni ichiga yozganman---

	---Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
	---DELETE---Deletes specific rows from a table based on a WHERE condition.
	---TRUNCATE---Deletes all rows from a table quickly.
	---DROP---Deletes the entire table structure and data from the database.

	---Modify the Name column in the Employees table to VARCHAR(100).
	alter table Employees
	alter column Name VARCHAR(100);

	---Add a new column Department (VARCHAR(50)) to the Employees table.
	alter table Employees
	add Department varchar(50);

	---Change the data type of the Salary column to FLOAT.
	alter table Employees
	alter column Salary float;

	---Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
	create table Departments (DepartmentID int primary key,DepartmentName varchar(50))

	---Remove all records from the Employees table without deleting its structure.
	delete from Employees		---1st way da ishlaydi

	---Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
	create table TempDepartments (DepartmentID int,DepartmentName varchar(50),salary decimal(10,2) default 5000)
	insert into TempDepartments values(1, 'HR',8000),(2, 'Finance',7500),(3, 'IT',1700),(4, 'Marketing',4000),(5, 'Logistics',10000)

	alter table TempDepartments 
	add constraint df_salary default 5000 for salary

	---Update the Department of all employees where Salary > 5000 to 'Management'.
	update Employees
	set Department = 'Management'
	where Salary > 5000;

	---Write a query that removes all employees but keeps the table structure intact.
	delete from Employees

	---Drop the Department column from the Employees table
	alter table Employees
	drop column Department

	---Rename the Employees table to StaffMembers using SQL commands.
	alter table Employees
	rename to StaffMembers

	---Write a query to completely remove the Departments table from the database.
	drop table Departments

	
	
