create database naresh;

use naresh;

create table student(
student_id int,
stident_name varchar(max),
studdent_add varchar(max),
student_number int,
);

select * from student;

alter table student
add email_id varchar(max);

alter table student
drop column email_id;

backup database naresh
to disk = 'C:\Users\ASUS\OneDrive\Desktop\SQL files'
with differential;
drop table age;

insert into student values(1,'pravat',20);

create table age
(
student_id int,
gender varchar(max) default 'male'
);

insert into age values(31,default );

select * from age;