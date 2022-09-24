create database MyTry;

create table tName
(
	Name varchar(10),
	Rank int,
	Gender varchar(10),
	Year int,
);
select * from tName;

insert into tName values('Rajesh',2,'Male',1998),('Kartick',1,'Male',1996),('Harrish',3,'Male',2002);
insert into tName values('Naresh',4,'Male',1998),('Vahida',5,'Male',1996),('Someone',6,'Male',2002);

delete from tName where Name='Rajesh';
delete from tName where NAme IN('Someone','Vahida');

alter table tName
add DOB int;

alter table tName
drop column DOB;

drop table tName;

truncate table tName;

