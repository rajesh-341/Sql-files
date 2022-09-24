create database MYDB;

create table students
(
	id int,
	F_Name varchar(20),
	L_Name varchar(20),
	Age int,
);
--How to see the records
select * from students;

--How to insert record in a table
insert into students values(101,'Rajesh','Karthickeyan',25);
insert into students values(102,'Harrish','Naresh',22);

insert into students values(1,'A','a',01),
							(1,'B','b',02),
							(3,'C','c',03),
							(4,'D','d',04);

select id,Age from students;
select F_Name from students;

-----------------------------------------------------------------------------------------------------------------------

--New Table(delete record in a table)

create table list
(
	id int,
	List_Name varchar(20),
	Roll_No int,
	Marks int,
);

select * from list;

insert into list values(1,'Rajesh',101,60),
							(2,'Karthickeyan',102,70),
							(3,'Harrish',103,80),
							(4,'Naresh',104,90);

--How to delete record from the table
delete from list where id=3;
delete from list where id IN(1,2);

insert into list values(3,'Harrish',103,80);

select id,Marks from list;

select * from list;
--How to delete the entire table(truncate)
truncate table list;
delete from list;

--How to delete table totally from database(drop)
drop table list;

--To add extra column to the table(alter)
alter table list
add subject varchar(10);

--can delete particular column using alter(alter,drop)
alter table list
drop column subject;



-----------------------------------------------------------------------------------------------------------------------



--New table
create table Employee
(
	Emp_id int,
	Emp_Name varchar(20),
	Salary int,
	Age int,
);

insert into Employee values(101,'Employee1',20000,23),
(102,'Employee2',23000,22),
(103,'Employee3',23000,23),
(104,'Employee4',22000,24),
(105,'Employee5',20000,21),
(106,'Employee6',25000,23),
(107,'Employee7',27000,23),
(108,'Employee8',25000,24),
(109,'Employee9',27000,23),
(110,'Employee10',25000,24);

insert into Employee values(106,'Employee6',25000,23);

select * from Employee;

delete from Employee where Emp_id IN(106,105);

--Couldnt use where in truncate
truncate table Employee;

select Distinct(salary) from Employee; 

select Distinct(Age) from Employee; 
--If not showing the column we can use as(Alias)
select Distinct(Emp_id) as Emp_id from Employee;

--To change the column name(naming convertion)
select Distinct(Emp_id) as change_it from Employee;

select Emp_id,Salary from Employee;

--it adds column to the existing table
alter table Employee
add Designation varchar(20);

--it deletes the column
alter table Employee
drop column Designation;

--Counts no of rows(can pass number and string as parameter)
select count(*) as No_Of_EmployeeID from Employee;

-- add the all the salary
select sum(salary) as total_salary from Employee;

select count('R') as No_Of_EmployeeID from Employee;

--to count the number of repeatation of 20000
select count(salary) as No_Of_EmployeeID from Employee where Age=23;

--to show the maximum value in a table(max)
select max(salary) as max_salary from Employee;

--condition using age greater than 25
select sum(salary) as at_age_above_ from Employee where Age>=22;
select * from Employee;

select Distinct(Emp_id) as Emp_id from Employee;

alter table Employee
add Dept varchar(20);


--find out total salary in each age
select Age,sum(salary) as salary_at_each_age from Employee group by age;


--find out total salary in each age=22 using where keyword
select Age,sum(salary) as salary_at_each_age from Employee where age=22 group by age;


--find out total salary in each age=21 using having clause
select Age,sum(salary) as salary_at_each_age from Employee group by age having age=21;

--to show upto 3 rows
select top 3 * from Employee;
--giving value more than table rows it will  not show error
select top 15 * from Employee;

--arrange the table descending order according to the age
select * from Employee order by age desc;
--arrange the table ascending order according to the age
select * from Employee order by age asc;

--arrange the table descending order according to the salary
select * from Employee order by salary desc;
--arrange the table ascending order according to the salary
select * from Employee order by salary asc;

-----------------------------------------------------------------------------------------------------------------------

--new table

create table nT
(
	Contract_Id int,
	Amount int,
);

insert into nT values(1,500),(2,600),(4,550),(3,400),(1,600),(5,700),(2,200);

select * from nT;

select Contract_Id,sum(Amount) as Sum_of_amount,count(Contract_Id) as Count_Of_Id from nT group by Contract_Id;

select Contract_Id,Amount from nT where Amount<600 AND Amount>=200;
--Another way to write two conditions
select Contract_Id,Amount from nT where Amount<600 group by Contract_Id,Amount having min(Amount)>=200;

--IN operator(used to give multiple values in condition)
select Contract_Id from nT where Contract_Id IN(1,2);

-----------------------------------------------------------------------------------------------------------------------

create table SqlUpdate
(
	Student_id int,
	First_Name varchar(20),
	Last_Name varchar(20),
	Salary int,
);

insert into SqlUpdate values(1,'Arun','Kumar',1000),
								(2,'Hari','Haran',2000),
								(3,'Naresh','Kumar',3000);

drop table SqlUpdate;

--Update salary of all employee
update SqlUpdate
set Salary = Salary+2000;


-----------------------------------------------------------------------------------------------------------------------
--Task(7-07-2022)
create table LikeOperator
(
	Id int,
	F_Name varchar(20),
);
insert into LikeOperator values(101,'Nayak'),
								(102,'Ramanuj'),
								(103,'Nikitha'),
								(104,'Ramanand'),
								(105,'Harish'),
								(106,'RamSagar'),
								(107,'Ramoji'),
								(108,'Ramesh'),
								(109,'Yogesh'),
								(110,'Ram'),
								(111,'Vinita');

--To show the character starts with  'R' and minimum length is 6
select * from LikeOperator where F_Name LIKE 'R_____';
----------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------

create table T1
(
	Id int,
);
create table T2
(
	Id int,
);
insert into T1 values(1),(1),(2),(3);
insert into T2 values(1),(3),(4),(5);

--To show the matches on both the tables(inner join)
select * from T2
inner join T1 
on T2.Id = T1.Id;

select * from T2;

--To written rows from left table, shows null for no matches
select * from T1
Left join T2 
on T1.Id = T2.Id;

--To written rows from Right table, shows null for no matches
select * from T1
right join T2 
on T1.Id = T2.Id;

--To written when match in any one of table, and written null for no matches
select * from T1
full outer join T2 
on T1.Id = T2.Id;
------------------------------------------------------------------------------------------------------------------------
create table s1
(
	Id int,
);
create table s2
(
	Id int,
);
insert into s1 values(1),(Null),(2),(3);
insert into s2 values(1),(3),(4),(5);

select * from s1;
select * from s2;

drop table s2;

update s2 
set Id = null 
where Id = 5;

select * from s1
inner join s2
on s1.Id = s2.Id;

--Left join
select * from s1
Left join s2 
on s1.Id = s2.Id;

--right join
select * from s1
right join s2 
on s1.Id = s2.Id;
------------------------------------------------------------------------------------------------------------------------
create table d1
(
	Id varchar(10),
);
create table d2
(
	Id varchar(10),
);
insert into d1 values('a'),('b'),('c'),('d'),('a'),('b');
insert into d2 values('a'),('b'),('c'),('a'),('c');

select * from d1;
select * from d2;

truncate table d1;


select * from d1
inner join d2
on d1.Id = d2.Id;

--Left join
select * from d1
Left join d2 
on d1.Id = d2.Id;

--right join
select * from d1
right join d2 
on d1.Id = d2.Id;

--full join
select * from d1
full outer join d2 
on d1.Id = d2.Id;
------------------------------------------------------------------------------------------------------------------------


--Task(11-07-2022)
create table Emp_Address
(
	Id int,
	Name varchar(MAX),
	Address varchar(MAX),
);
create table Emp_Designation
(
	Id int,
	Salary int,
	Designation varchar(MAX),
);
insert into Emp_Address values(1,'Joe',null),(2,'Tom',null),(3,'Lilly','Bangalore'),(4,'Maggy','Chennai');
insert into Emp_Designation values(1,10000,'A'),(2,20000,'B'),(3,25000,'C'),(4,18000,'D');

select id,name from Emp_Address;
select * from Emp_Designation;

truncate table Emp_Designation;

--alias table name, using it and 
--joining two table with left join
select e.Id,e.Name,d.Designation from Emp_Address e
left join Emp_Designation d
on e.Id = d.Id;

--take to my database(use)
use mydb;

------------------------------------------------------------------------------------------------------------------------
--New table
create table Customers
(
	Id int,
	--max(255)
	Name varchar(max),
	Age int,
	Address varchar(max),
	Salary int,
);

insert into Customers values(1,'Ramesh',32,'Ahmedabad',2000),
							(2,'Khila',25,'Delhi',1500),
							(3,'Kaushik',23,'Kota',2000),
							(4,'Chaitali',25,'Mumbai',6500),
							(5,'Hardik',27,'Bhopal',8500),
							(6,'Komal',22,'MP',4500),
							(7,'Muffy',24,'Indore',10000);

select * from Customers;

select a.id,b.name,a.salary from Customers a, Customers b where a.salary  < b.salary order by Id;

use mydb;
------------------------------------------------------------------------------------------------------------------------
--New Table
create table StudentId
(
	--max(255)
	sid varchar(max),
	cid varchar(max),
	sname varchar(max),
);

insert into StudentId values('s1','c1','Physics'),
							('s2','c2','Biology'),
							('s1','c3','Maths');

select * from StudentId;

truncate table StudentId;

select Distinct(a.sid) from StudentId a, StudentId b where a.sid  = b.sid and a.cid <> b.cid;
------------------------------------------------------------------------------------------------------------------------
--New Table
create table dest
(
	--max(255)
	src varchar(max),
	dst varchar(max),
);

insert into dest values('Delhi','Mumbai'),
							('Mumbai','Delhi'),
							('Delhi','Kolkata'),
							('Kolkata','Delhi'),
							('Mumbai','Nagpure');

select * from dest;

--truncate table dest;

select  c.src, c.dst from dest c, dest d where c.src = d.dst and c.dst <> d.src;
------------------------------------------------------------------------------------------------------------------------
--new table
create table M1
( name Varchar(20));

insert into M1 values('Ajay'),('Ram'),('Ashish'),('Manohar');

create table M2
( name Varchar(20));

select * from M1;
select * from M2;

insert into M2 values('Akshay'),('Ajay'),('Dinesh'),('Rakesh');

select * from M1
union
select * from M2;

--to find in both columns the name starts with A
select M1.name from M1 where M1.name like 'A%'
union 
select M2.name from M2 where M2.name like 'A%';

--(IQ) find out the name which is there in M1 table but not in M2 table.
--solution 1
select * from M1
except
select * from M2;

--solution 2
select M1.name from m1
left join m2
on m1.name = m2.name where m2.name is null;

select distinct M1.name,M2.name from m1
inner join m2
on m1.name <> m2.name
where M1.name like 'A%';

select distinct m1.name,m2.name from m1,m2 where m1.name LIKE 'A%';
------------------------------------------------------------------------------------------------------------------------
create table try
(
	--max(255)
	--null value cannot be inserted(not null-constant rule)
	src varchar(max) not null,
	dst varchar(max),
	--every value in a age should be different i.e same value cannot be inserted(unique)
	age int unique,
	--age2 cannot be greater than or equal to 20(check)
	age2 int check (age2 >= 20),
	id int primary key,
);

insert into try values(null,'Mumbai',23,17,21),--cannot insert null value(not null)
							('Mumbai','Delhi',24,18,null),--null is not allowed(primary key)
							('Delhi','Kolkata',25,19,21),--duplicate value is not allowed(primary key)
							('Kolkata','Delhi',25,20,20),--cannot insert duplicate values(unique),age cannot be equal to 20(check)
							('Mumbai','Nagpure',20,21,19);--age cannot be greater than 20

drop table try;

------------------------------------------------------------------------------------------------------------------------
create table try2
(
	id int,
	column_name varchar(max) check (column_name LIKE 'A%'),
	age int,
	salary int,
);

insert into try2 values(1,'Ainitha',20,20000),
						(2,'vinitha',20,20000),--can insert only the name starts with A
						(3,'Aravind',20,20000),
						(4,'seetha',20,20000);--can insert only the name starts with A

select * from try2;

drop table try2;
------------------------------------------------------------------------------------------------------------------------
create table try3
(
	id int,
	Name varchar(max) check (Name LIKE '[A-M]%'),check (Name not like '[N-Z]%'),
	age int,
	salary int,
);

insert into try3 values(1,'Amit',20,20000),
						(2,'Bimal',20,20000),--can insert only the name starts with A
						(3,'Chandan',20,20000),
						(4,'Madan',20,20000);--can insert only the name starts with A

insert into try3 values(1,'Nita',20,20000),
						(2,'Pramod',20,20000),--can insert only the name starts with A
						(3,'Rakesh',20,20000),
						(4,'Zebra',20,20000);--can insert only the name starts with A

insert into try3 values(1,'amit',20,20000);

select * from try3;

truncate table try3;

drop table try3;

------------------------------------------------------------------------------------------------------------------------
create table try4
(
	id int,
	Location varchar(max),
	age int,
);

insert into try4 values(1,'Pune',21),
						(2,'Goa',20),
						(3,'Pune',22),
						(4,'Delhi',23),
						(5,'Goa',19),
						(6,'Delhi',25);

select * from try4;

--To show the ids whos location is pune and delhi
select * from try4 where location IN('Delhi','Pune');

--to show the values between 21 and 25(between operator)
select * from try4 where age between 21 and 25;
------------------------------------------------------------------------------------------------------------------------
create table try5
(
	Id int,
	F_Name varchar(max),
	Age int,
	Department varchar(max),
	Salary int,
);

insert into try5 values(1,'Allen',55,'Sales',20000),
						(2,'Katte',56,'Sales',25000),
						(3,'George',48,'HR',30000),
						(4,'Richard',50,'Manager',45000),
						(4,'Richard',50,'Manager',45000),
						(5,'Lila',49,'HR',32000),
						(6,'Saruna',50,'HR',35000),
						(7,'Maddy',51,'Manager',46000),
						(8,'John',47,'Sales',27000),
						(8,'John',47,'Sales',27000),
						(9,'Benny',55,'Manager',48000),
						(10,'Nikki',49,'HR',35000);

--Find the 2nd highest salary
with CTE as
(select *, dense_rank() over(order by salary desc) 
as rankii from try5)
select * from CTE where rankii = 2;

--to find 2nd highest salary in department = manager using  (partition)
with CTE as
(select *, dense_rank() over(partition by department order by salary) 
as rankii from try5)
select * from CTE where rankii = 2 and department = 'manager';

--to find 2nd highest salary in department = 'manager' using (row_number)
with CTE as
(select *, row_number() over(partition by id order by salary) 
as rankii from try5)
delete from CTE where rankii > 1; --can also use rankii >=2

select * from try5;

truncate table try5;

drop table try5;
------------------------------------------------------------------------------------------------------------------------
create table try6
(
	Id int,
);

insert into try6 values(18),(19),(22),(22),(25),(26),(26),(26),(27);

select * from try6;

--rank() function
select *, rank() over(Order by Id) as Rankii from try6;

--dense_rank() function
select *, dense_rank() over(Order by Id) as dense_Rankii from try6;

truncate table try6;

drop table try6;
------------------------------------------------------------------------------------------------------------------------

create table try7
(
	Names varchar(max),
);

insert into try7 values('Amit'),('Dinesh'),('Deena'),('Deeksha'),('Pankaj'),('Poonam'),('Vishal'),('Geetha'),('Ganesh'),('Naresh');

select * from try7 where Names LIKE '_[aeiouAEIOU]%';

--rank() function
select *, rank() over(Order by Id) as Rankii from try7;

--dense_rank() function
select *, dense_rank() over(Order by Id) as dense_Rankii from try7;
------------------------------------------------------------------------------------------------------------------------

create table Vender
(
	Vender_Id varchar(max),
	Vender_Name varchar(max),
);

insert into Vender values('v1','Nokia'),('v2','Samsung'),('v3','Micromax'),('v4','Asus'),('v5','Poco'),('v6','Mi'),('v7','Apple'),('v8','Realme'),('v9','Oppo');

select * from Vender;

select * from Vender;
--rank() function
select *, rank() over(Order by Id) as Rankii from try7;

--dense_rank() function
select *, dense_rank() over(Order by Id) as dense_Rankii from try7;
------------------------------------------------------------------------------------------------------------------------
create table Order1
(
	order_ int,
	Pro_id varchar(max),
	Vander_id varchar(max),
	Quantity int,
	Price int
);

insert into Order1 values	(100,'p1','v1',4,28690),
							(101,'p2','v2',8,25000),
							(102,'p3','v4',3,24000),
							(103,'p4','v6',4,21000),
							(104,'p5','v7',10,19000),
							(105,'p6','v9',5,32000),
							(106,'p7','v2',4,38000),
							(107,'p8','v1',6,41000),
							(108,'p9','v9',7,40000),
							(109,'p10','v5',9,43000),
							(110,'p11','v7',9,39000),
							(111,'p12','v3',9,40000),
							(112,'p13','v4',4,42000),
							(113,'p14','v6',8,39000),
							(114,'p15','v6',9,47000),
							(115,'p16','v9',7,48000),
							(116,'p17','v1',6,49000);

create view [exampleOfview] as viewing select * from Order1 where Vander_id='v1';

select * from [exampleOfview];

select * from Order1;

with NC as
(
select  b.Vender_id,b.Vender_Name,sum(a.quantity*a.price) as Total,
rank() over(order by sum(a.Quantity*a.Price) desc) as rankii from Order1 as a
left join Vender as b
on a.Vander_id = b.Vender_id group by Vender_Name,Vender_id)
select * from NC where rankii IN(2,3);

select sum(salary) as total_salary from Employee;

select * from Order1 where Vander_id = Quantity * Price;
------------------------------------------------------------------------------------------------------------------------
create table StoreProcedure
(
	Location varchar(20),
	Gender varchar(20),
);

insert into StoreProcedure values('Bangalore','Female'),
								('Pune','Male'),
								('Goa','Female'),
								('Pune','Male'),
								('Goa','Male'),
								('Bangalore','Female'),
								('Pune','Male');
------------------------------------------------------------------------------------------------------------------------
--Task(6-07-2022)
create table LocateCustomer
(
	Location varchar(20),
	Gender varchar(20),
);

insert into LocateCustomer values('Bangalore','Female'),
								('Pune','Male'),
								('Goa','Female'),
								('Pune','Male'),
								('Goa','Male'),
								('Bangalore','Female'),
								('Pune','Male');

select * from LocateCustomer;

select Distinct(Location),count(Location) as No_of_Customers from LocateCustomer group by Location;


-----------------------------------------------------------------------------------------------------------------------

--NEW TABLE Practise 2
create table tName
(
	No int,
	Name varchar(10),
	Designation varchar(20),
	Dept varchar(10),
)

insert into tName values(101,'Person 1','Developer','D1'),
						(102,'Person 2','Testing','D2'),
						(103,'Person 3','Scrum master','D3'),
						(104,'Person 4','Developer','D1'),
						(105,'Person 5','Testing','D2'),
						(106,'Person 6','Scrum master','D3');

select * from tName;

delete from tName where No=102;

truncate table tName;

drop table tName;

select Distinct(Designation) as something from tName;

select top 4 * from tName;

select max(No) as maximun_id from tName;

select min(No) as maximun_id from tName;

select Dept,count(Designation) as Persons_available from tName group by Dept;

select * from tName order by Dept asc;

select Name,count(Designation) as Persons_available from tName group by Name having Name='Person 1';

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

create database w3Data;

use w3Data;


select * from Shippers;

select * from Categories;

drop table Employees;

select * from Shippers;

-----------------------------------------------------------------------------------------------------------------------
Create table Student_Details
(
Roll_No int,
F_Name varchar(max),
Address varchar (max),
Subject varchar(max),
Marks int,
Grade varchar (max)
);


Insert into Student_Details values (101,'Akash','Delhi','Physics',77,'A1'),
                                   (102,'Bhabesh','Pune','biology',87,'A2'),
								   (103,'Yash','Bangalore','Math',70,'B1'),
								   (104,'Jatin','Delhi','Physics',90,'A1'),
								   (105,'Noopur','Pune','Biology',65,'B2'),
								   (101,'Akash','Delhi','Math',80,'A2'),
								   (102,'Bhabesh','Pune','Physics',57,'B2'),
								   (103,'Yash','Bangalore','Physics',85,'A2'),
								   (104,'Jatin','Delhi','Math',71,'B1'),
								   (105,'Noopur','Pune','Physics',85,'A2'),
								   (103,'Yash','Bangalore','Biology',82,'A1'),
								   (101,'Akash','Delhi','Biology',87,'A1');

select * from OrderDetails;

Select OrderID, Quantity,
Case 
When Quantity     > 30 THEN 'The Quantity is greater than 30'
When Quantity     = 30 THEN 'The Quantity is equal to 30'
ELSE       'The quantity is under 30'
END AS QuantityText
From OrderDetails;

