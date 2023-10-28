SELECT * FROM hr.departments;
-- 1
select *
from employees , departments;
-- 2
select concat(first_name," ",last_name) as employes,hire_date
from employees;

select * from employees;
-- 3
select concat(first_name," ",last_name," , ",job_id) as Employees
from employees;

select * from departments;
-- 4
select employees.hire_date,departments.department_name,departments.department_id,concat(employees.first_name," ",employees.last_name) as EmP
from employees join departments on employees.department_id=departments.department_id;
-- 5
select concat(employee_id," , ",first_name,"  ",last_name,",",email,",",phone_number,",",hire_date,",",job_id,",",salary,",",commission_pct,",",manager_id,",",department_id) as OUTPUT
from employees;
-- 6
select concat(first_name," ",last_name) as EMP,salary
from employees
where salary > 2000;
-- 7
select concat(first_name," ",last_name) as  Name , hire_date as "start_date"
from employees;
-- 8
select concat(first_name," ",last_name) as  Name , hire_date as "start_date"
from employees
order by hire_date;
-- 9
select concat(first_name," ",last_name) as EMP,salary
from employees
order by salary desc;
-- 10
select concat(first_name," ",last_name) as EMP,salary,department_id,commission_pct
from employees
where commission_pct > 0
order by salary desc;

-- 11
 select employees.last_name,jobs.job_title,employees.manager_id
 from employees join jobs on employees.job_id=jobs.job_id
 where  employees.manager_id is null;

-- 12 

select last_name,salary,job_id
from hr.employees
where job_id in("SA_REP","ST_CLERK") 
and salary not in (2500,3500,5000);

-- (2)
-- 1

select commission_pct, max(salary),min(salary),avg(salary)
from employees
where commission_pct > 0
group by commission_pct
order by commission_pct;

-- 2
select department_id,sum(salary),sum(commission_pct)
from employees
group by department_id;

-- 3

select department_id,count(employee_id)
from employees
group by department_id;

-- 4

select department_id,sum(salary)
from employees
group by department_id;

-- 5 

select concat(first_name," ",last_name) as EMP,commission_pct
from employees
where commission_pct is null
order by EMP;

-- 6

select concat(first_name," ",last_name) as emp,department_id,commission_pct,
case
when commission_pct is null then " No Commission" 
end as appropriately
from employees;

-- 7 
select concat(first_name," ",last_name) as emp , salary,commission_pct,
case
when commission_pct >0 then commission_pct*2 
when commission_pct is null then "no commission"
end as appropriately
from employees;

-- 8 
 select first_name,department_id
 from employees
 group by department_id,first_name
 having count(first_name) > 1;
 

-- 9 
																																																												

select sum(e.salary),m.first_name as manger_name
from employees as e join employees as m 
on e.manager_id = m.employee_id
group by m.first_name;

select m.employee_id,m.first_name
from employees as e join employees as m 
on e.manager_id = m.employee_id
group by m.employee_id;


-- 10 



select m.first_name as manger_name,m.department_id,count(e.first_name) as emp_count
from employees as e join employees as m 
on e.manager_id = m.employee_id
group by m.first_name,m.department_id ;

-- 11 




select e.last_name as emp,m.last_name as m_name ,e.salary,e.department_id
from employees as e join employees as m 
on e.manager_id = m.employee_id
where e.last_name like "_a%" and m.last_name like  "_a%";


-- 12  

select sum(salary),avg(salary),department_id
from employees
group by department_id;




-- 13

select max(employees.salary),departments.department_name,departments.department_id
from employees join departments on employees.department_id=departments.department_id
group by departments.department_id
order by departments.department_id;

-- 14 

select salary,commission_pct,
case
when commission_pct is not null then salary*0.10
when commission_pct is null then "1"
end as salary_10
from employees;

-- 3)

-- 1   

 select last_name, concat(upper(substring(last_name,2,1)),(substring(last_name,3,3))) as 2_to_5
 from employees;
 
 -- 2
 
 select concat(first_name,"-",last_name),month(hire_date)
 from employees;

-- 3

select last_name , salary,
case
when salary/2 > 10000 then round(salary + salary*0.1 + 1500 , 2 )
when salary/2 < 10000 then round( salary + salary* 0.115 + 1500 , 2 )
end as  bonus_for_EMP
from employees;

-- 4 

select  concat( substring(e.employee_id,1,2) , "00" , substring(e.employee_id,3), "E ") as new_emp_id,e.department_id,e.salary,replace(m.last_name,"Z" ,'$') as Mname
from employees as e join employees as m on e.manager_id=m.employee_id;

-- 5

select concat(upper(substring(last_name,1,1)),lower(substring(last_name,2))) as E_name , length(last_name) as "length"
from employees
where (last_name like "J%") or (last_name like "A%") or (last_name like "M%")
order by last_name;

-- 6

select last_name , lpad((rpad(salary,16,"0")),17,"$")  as SALARY
from employees;

-- 7

 select first_name,
 case
 when first_name = reverse(first_name) then "palindrom" 
 end as palindrom
 from employees;

 -- 8 
 select concat(upper(substring(first_name,1,1)),lower(substring(first_name,2))," ",upper(substring(last_name,1,1)),lower(substring(last_name,2))) as emp_name
 from employees;
 
 
 -- 9
 
 select substring_index(substring_index(street_address,' ',2),' ',-1)
 from locations;
 
-- 10

 select lower(concat(last_name,substring(first_name,1,1),"@systechusa.com"))as email_address,first_name
 from employees;
 
-- 11

select employees.first_name,jobs.job_title
from employees join jobs on employees.job_id=jobs.job_id
where (select first_name like "%trenna%");

-- 12
select employees.first_name,departments.department_name,locations.city
from employees join departments on employees.department_id=departments.department_id join locations on locations.location_id=departments.location_id
where city like "South San Francisco";

-- 13

select first_name,salary
from employees
where salary=(select min(salary) from employees);

-- 14

select first_name,salary
from employees
where salary<>(select min(salary) from employees);

-- 4)

-- 1

select employees.last_name,departments.department_id,departments.department_name
from employees join departments on employees.department_id=departments.department_id;

-- 2

 select employees.job_id,departments.department_id,locations.city
 from employees join departments on employees.department_id=departments.department_id join locations on locations.location_id=departments.location_id
where departments.department_id = 40 ;

-- 3

 select employees.last_name,departments.department_name,locations.location_id,locations.city,employees.commission_pct
 from employees join departments on employees.department_id=departments.department_id join locations on locations.location_id=departments.location_id
where employees.commission_pct is not null;

-- 4

select employees.last_name,departments.department_name
from employees join departments on employees.department_id=departments.department_id
where employees.last_name like "%a%";

-- 5
select employees.last_name,employees.job_id,departments.department_id,departments.department_name,countries.country_name
from employees join departments on employees.department_id=departments.department_id join locations on locations.location_id=departments.location_id  join countries on countries.country_id=locations.country_id
where countries.country_name like "United States of America";


-- 6

select e.last_name as EMP_name,e.employee_id as EMP_ID,m.last_name as manager_name ,m.employee_id as manager_id
from employees as e join employees as m on e.manager_id=m.employee_id;

-- 7
select e.last_name as EMP_name,e.employee_id as EMP_ID,m.last_name as manager_name ,m.employee_id as manager_id
from employees as e left join employees as m on e.manager_id=m.employee_id;

-- 8
 select last_name,department_id
 from employees
 group by department_id,last_name
 having count(last_name) > 1;
 
 -- 9
 
  select employees.first_name,employees.salary,employees.job_id,employees.department_id,departments.department_name,
  case
  when employees.salary >=50000 then "A"
  when employees.salary >=30000 then "B"
  when employees.salary <30000 then "C"
  end as "grade"
 from employees join departments on employees.department_id=departments.department_id
order by grade;

-- 10

select e.first_name as emp_name,e.hire_date as emp_hire_date,m.first_name as manager_name,m.hire_date as man_hire_date
from employees as e join employees as m on e.manager_id=m.employee_id;

-- 5)

-- 1 

select last_name,hire_date,department_id,job_id
from employees
where job_id = "SA_REP";

-- 2

select employee_id,last_name,salary
from employees
where salary > (select avg(salary) from employees)
order by salary;

-- 3

select employee_id,last_name,department_id
from employees
where last_name like "%u%";

-- 4

select employees.last_name,departments.department_id,employees.job_id,locations.city
from employees join departments on employees.department_id=departments.department_id join locations on locations.location_id=departments.location_id
where locations.city = "Toronto";

-- 5

select e.first_name,e.salary,m.first_name
from employees as e join employees as m on e.manager_id=m.employee_id
where m.first_name = "Steven";

-- 6

select employees.last_name,employees.job_id,departments.department_id,departments.department_name
from employees right join departments on employees.department_id=departments.department_id
where departments.department_name = "Operations";

-- 7
select employee_id,last_name,salary,department_id
from employees
where salary > (select avg(salary) from employees) and last_name like "%u%" 
order by salary ;

-- 8 

select employees.first_name,jobs.job_title,employees.department_id
from employees join jobs on employees.job_id=jobs.job_id
where  employees.department_id = 80;



-- 9


select employee_id,salary,department_id,
case 
when department_id = 10  then "5% Raise"
when department_id = 30  then "5% Raise"
when department_id = 20  then "10% Raise"
when department_id = 40  then "15% Raise"
when department_id = 50 then "15% Raise"
when department_id = 60 then "No Raise"
end as RAIS
from employees
order by department_id;

-- 10

select last_name,salary
from employees
limit 3 ;

-- 11

select first_name,salary,commission_pct,
case
when commission_pct is null then "0"
when commission_pct is not null then commission_pct
end as colum
from employees;

-- 12

select distinct( m.first_name),m.salary,m.department_id
from employees as e join employees as m on e.manager_id=m.employee_id
limit 3 ;

-- 6)

create table empdate
(
emp_id int,
hire_date date,
resignation_date date
);



insert into empdate values(1,'2000-01-01','2013-10-07');
insert into empdate values(2,'2003-12-04','2017-08-03');
insert into empdate values(3,'2012-09-22','2015-06-21');
insert into empdate values(4,'2015-04-13',null);
insert into empdate values(5,'2016-06-03',null);
insert into empdate values(6,'2017-08-08',null);
insert into empdate values(7,'2016-11-13',null);
 
select * from empdate;

-- 1
 
select emp_id,
case
when resignation_date is not null then concat(floor( datediff(resignation_date,hire_date)/365) ,"year ",floor(datediff(resignation_date,hire_date)%365/30) , "month ",datediff(resignation_date,hire_date)%365%30,"day")
when resignation_date is null then concat(floor(datediff(NOW(),hire_date)/365),"year ",floor(datediff(NOW(),hire_date)%365/30)," month ",datediff(now(),hire_date)%365%30,"day ")
end as date
from empdate;

-- 2

select date_format(hire_date,'%m,%d,%Y') as date_1,resignation_date,
case
 when resignation_date is null then  "dec,01th,1900"
 when resignation_date is not null then  date_format(resignation_date,'%M,%d,%Y')
end as date
from empdate;

-- 3 

select emp_id,
case
when resignation_date is not null then concat(floor( datediff(resignation_date,hire_date)/365) ,"year ",floor(datediff(resignation_date,hire_date)%365/30) , "month ")
when resignation_date is null then concat(floor(datediff(NOW(),hire_date)/365),"year ",floor(datediff(NOW(),hire_date)%365/30)," month ")
end as EMP_EXP
from empdate;




