create table worker
(
worker_id int,
first_name varchar(20),
last_name varchar(20),
salary int,
join_date date,
department varchar(10)
);

insert into worker values(1,'Monika','Arora','100000','2014-2-20','HR');
insert into worker values(2,'Niharika','Verma','80000','2014-6-11','Admin');
insert into worker values(3,'Vishal','Shinghal','300000','2014-2-20','HR');
insert into worker values(4,'Amitabh','Singh','500000','2014-2-20','Admin');
insert into worker values(5,'Vivek','Bhati','500000','2014-6-11','Admin');
insert into worker values(6,'Vipul','Diwan','200000','2014-2-20','Account');
insert into worker values(7,'Satish','Kumar','75000','2014-1-20','Account');
insert into worker values(8,'Geetika','Chauhan','90000','2014-4-11','Admin');

select * from worker;

-- 1 

SELECT * 
FROM Worker 
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

select *
from worker
order by first_name asc;

select *
from worker
order by department desc;

-- 2

select *
from worker
where first_name in ('Vipul','Satish');

-- 3

select *
from worker 
where first_name like "_____!h%" escape "!";

-- 4 

select * 
from worker
where salary between 50000 and 100000;

-- 5

select first_name,last_name,salary,count(*)
from worker
group by first_name,last_name,salary
having count(*)>1 ;

-- 6

 select *
 from worker
 limit 6;

-- 7

select department , count(*) as dept_count
from worker
group by department
having count(*) < 5;

-- 8

select department , count(*) as emp_count
from worker
group by department;

-- 9

select first_name,salary,department
from worker
order by salary desc;


-- 2)


create table student
(
std_id int,
std_name varchar(20),
sex varchar(20),
percentage int,
class int,
sec varchar(5),
stream varchar(15),
DOB date
);


insert into student values(1001,'Surekha Joshi','Female','82','12','A','Science','1998-3-8');
insert into student values(1002,'Maahi Agarwal','Female','56','11','C','Commerce','1008-11-23');
insert into student values(1003,'Sanam Verma','Male','59','11','c','Commerce','2006-6-29');
insert into student values(1004,'Ronit Kumar','Male','63','11','C','Commercw','1997-11-5');
insert into student values(1005,'Dipesh Pulkit','Male','78','11','B','Science','2003-9-14');
insert into student values(1006,'Jahanvi Puri','Female','60','11','B','Commerce','2008-11-7');
insert into student values(1007,'Sanam Kumar','Male','23','12','F','Commerce','1998-3-8');
insert into student values(1008,'Sahil Saras','Male','56','11','C','Commerce','2008-11-7');
insert into student values(1009,'Akshra Agarwal','Female','72','12','B','Commerce','1996-10-1');
insert into student values(1010,'Stuti Mishra','Female','39','11','F','Science','1008-11-23');
insert into student values(1011,'Harsh Agarwal','Male','42','11','C','Science','1998-3-8');
insert into student values(1012,'Nikunj Agarwal','Male','49','12','C','Commerce','1998-6-28');
insert into student values(1013,'Akriti Saxena','Female','89','12','A','Science','2008-11-23');
insert into student values(1014,'Tani Rastogi','Female','82','12','A','Science','2008-11-23');


-- 1 

select * from student;

-- 2

select std_name,DOB
from student;

-- 3

select * from student
where percentage >= 80;

-- 4

select std_name,stream,percentage
from student
where percentage > 80;

-- 5

select * from student 
where stream='Science' and percentage>75;
