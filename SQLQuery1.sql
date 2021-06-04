-- (CREATE TABLE)

create table employee(
emp_id int not null,
emp_name varchar(25),
emp_salary int,
emp_age int,
emp_gender char(25),
emp_dept varchar(25),
primary key (emp_id)
);

--(INSERT DATA)

insert into employee values(
1, 'Sam', 95000, 45, 'Male', 'Operations'
);

insert into employee values(
2, 'Bob', 80000, 21, 'Male', 'Support'
);

insert into employee values(
3, 'Anne', 125000, 25, 'Female', 'Analytics'
);

insert into employee values(
4, 'Juliya', 73000, 30, 'Female', 'Analytics'
);

insert into employee values(
5, 'Matt', 150000, 33, 'Male', 'Sales'
);

insert into employee values(
6, 'Jeff', 112000, 27, 'Male', 'Operations'
);

--(SELECT SINGLE DATA)

select emp_name from employee;

select emp_name, emp_gender, emp_dept from employee;

--(SELECT WHOLE TABLE)

select * from employee;

--(TO CHECK DUPLICATE) 

select distinct emp_gender from employee;

--(WHERE CLAUSE) 

select * from employee where emp_gender='Female';

select * from employee where emp_salary>100000;

--(OPERATORS) 

select * from employee where emp_gender='Male' AND emp_age<30;

select * from employee where emp_gender= 'Male' AND emp_salary>100000;

select * from employee where emp_dept= 'Operations' AND emp_salary>100000;

select * from employee where emp_dept= 'Operations' OR emp_dept='Analytics';

select * from employee where emp_salary>100000 OR emp_age<40;

select * from employee where NOT emp_gender='Female';

select * from employee where NOT emp_age>=30;

--(LIKE & BETWEEN)

select * from employee where emp_name LIKE 'J%';

select * from employee where emp_age LIKE '3_';

select * from employee where  emp_age BETWEEN 25 AND 35;

select * from employee where emp_salary BETWEEN 90000 AND 120000;

--(CREATE NEW TABLE FOR MERGE...)

create table department(
dept_id int not null,
dept_name varchar(20),
dept_location varchar (20),
primary key (dept_id)
);

--(INSERT VALUES)

insert into department values(
1, 'Content', 'New York'
);

insert into department values(
2, 'Support', 'Chicago'
);

insert into department values(
3, 'Analytics', 'New York'
);

insert into department values(
4, 'Sales', 'Boston'
);

insert into department values(
5, 'Tech', 'Dallas'
);

insert into department values(
6, 'Finance', 'Chicago'
);

select * from department;

--(INNER JOIN)

select employee.emp_name, employee.emp_dept, department.dept_name, department.dept_location
FROM employee
INNER JOIN department ON employee.emp_dept=department.dept_name;

--(LEFT JOIN)

select employee.emp_name, employee.emp_dept, department.dept_name, department.dept_location
FROM employee
LEFT JOIN department ON employee.emp_dept=department.dept_name;

--(RIGHT JOIN)

select employee.emp_name, employee.emp_dept, department.dept_name, department.dept_location
FROM employee
RIGHT JOIN department 
ON employee.emp_dept=department.dept_name;

--(FULL JOIN)

select employee.emp_name, employee.emp_dept, department.dept_name, department.dept_location
FROM employee
FULL JOIN department 
ON employee.emp_dept=department.dept_name;

--(Delete Statements-> its delete specific data )

delete from employee where emp_age=33;
select * from employee;

--(Truncate Statements-> its delete complete table data)

truncate table employee;
select * from employee;

--(UPDATE STATEMENT)

update employee set emp_age= 42 where emp_name= 'Sam';
select * from employee;

--(UPDATE WITH JOIN)

update employee set emp_age= emp_Age + 10
from employee
join department ON employee.emp_dept=department.dept_name
where dept_location='New York'

select * from employee;

--(DELETE WITH JOIN)

delete employee
from employee
join department ON employee.emp_dept = department.dept_name
where dept_location = 'New York'

--(MERGE)

create table employee_target(
emp_id int not null,
emp_name varchar(25),
emp_salary int,
emp_age int,
emp_gender char(25),
emp_dept varchar(25),
primary key (emp_id)
);

insert into employee_target values(
1, 'Sam', 95000, 45, 'Male', 'Operations'
);

insert into employee_target values(
2, 'Bob', 80000, 21, 'Male', 'Support'
);

insert into employee_target values(
3, 'Anne', 125000, 25, 'Female', 'Analytics'
);

insert into employee_target values(
4, 'Juliya', 73000, 30, 'Female', 'Analytics'
);

insert into employee_target values(
5, 'Matt', 150000, 33, 'Male', 'Sales'
);

insert into employee_target values(
6, 'Jeff', 112000, 27, 'Male', 'Operations'
);

select * from employee_target;
create table employee_source(
emp_id int not null,
emp_name varchar(25),
emp_salary int,
emp_age int,
emp_gender char(25),
emp_dept varchar(25),
primary key (emp_id)
);

insert into employee_source values(
1, 'Sam', 95000, 45, 'Male', 'Operations'
);

insert into employee_source values(
2, 'Bob', 80000, 21, 'Male', 'Support'
);

insert into employee_source values(
3, 'Anne', 125000, 25, 'Female', 'Analytics'
);

insert into employee_source values(
6, 'Jeff', 112000, 27, 'Male', 'Operations'
);

insert into employee_source values(
7, 'Adam', 100000, 28, 'Male', 'Content'
);

insert into employee_source values(
8, 'Priya', 85000, 37, 'Female', 'Tech'
);

select * from employee_source;

Merge employee_target AS T
Using employee_source AS S
        ON T.emp_id = S.emp_id
When Matched 
           Then update set T.emp_salary = S.emp_salary, T.emp_age = S.emp_age
When not matched By target 
           Then insert (emp_id, emp_name, emp_salary, emp_age, emp_gender, emp_dept)
           values(S.emp_id, S.emp_name, S.emp_salary, S.emp_age, S.emp_gender, S.emp_dept)
when not matched by source 
           then delete;

select * from employee_target;

--(Alter Table Statement)

alter table employee
add emp_dob date;
select * from employee;

--(and for DROP new column)

alter table employee
drop column emp_dob;
select * from employee;

--( Temporary Table)

create table #student(
s_id int,
s_name varchar(20)
);

select * from #student;

insert into #student values(
1, 'SAM'
);

insert into #student values(
2, 'AMIT'
);

select * from #student;

--(Basic Functions)

--1) Minimum
select MIN(emp_age) from employee;

--2) Maximum
select MAX(emp_age) from employee;

--3) (Count)
select COUNT (*) from employee where emp_gender='Male';

--4) (Sum)
select SUM(emp_salary) from employee;

--5) (Average)
select AVG(emp_age) from employee;

--(STRING FUNCTION)

--1) (LTRIM)

select '       spartaaaaa'
select ltrim('       spartaaaaa');

--2) (Lower)

select 'I AM THE KING OF SQL'
select lower('I AM THE KING OF SQL');

--3) (Upper)

select 'i am the king of html'
select upper('i am the king of html');

--4) (Reverse)

select 'i am the king of html'
select REVERSE('i am the king of html')

--5) (SubString)

select 'this is sparta'
select SUBSTRING('this is sparta', 9,6)

--(CASE STATEMENT)

select
case
when 10>20 then '10 is greater than 20'
when 10<20 then '10 is less than 20'
else '10 is equal to 20'
end

select * from employee;

select *,grade=
case 
when emp_salary<90000 then 'C'
when emp_salary<120000 then 'B'
else 'A'
end
from employee
go

-- (IIF Function)

select IIF(10>20, '10 is greater than 20', '10 is less than 20')

select * from employee;
select emp_id, emp_name, emp_age, iif(emp_age>30, 'Old employee', 'Younger employee') as employee_generation from employee


--( User-Defined Functions)

--1) (Scalar Valued Function)

create function add_five (@num as int)
returns int
as
begin
return(
@num + 5
)
end

select dbo.add_five(10)

--2) (Table Valued)

select * from employee 

create function select_gender(@gender as varchar(20))
returns table
as
return(
select * from employee where emp_gender= @gender
)

select * from dbo.select_gender('Male')

-- (Order By Clause)

--1) (Ascending Order)

select * from employee order by emp_salary;

--2) (Descending Order)

select * from employee order by emp_salary desc;

--3) (Top)

select top 3 * from employee
       --OR
select top 3 * from employee order by emp_age desc;

--(GROUP BY CLAUSE)

select avg(emp_salary),emp_gender from employee GROUP BY emp_gender;
select AVG(emp_age),emp_dept from employee GROUP BY emp_dept ORDER BY AVG(emp_age) desc; 

--(HAVING CLAUSE)

select emp_dept, avg(emp_salary) as avg_salary
from employee
group by emp_dept
having avg(emp_salary)>100000

--(CREATE NEW TABLE (STUDENT))

create table student_details3(
s_id int not null,
s_name varchar (20),
s_marks int,
);

select * from student_details3;

insert into student_details3 values(
1, 'Sam', 45
);

insert into student_details3 values(
2, 'Bob', 87
);

insert into student_details3 values(
3, 'Anne', 73
);

insert into student_details3 values(
4, 'Juliya', 92
);

select * from student_details3;

--(CREATE ANOTHER NEW TABLE)

create table student_details4(
s_id int not null,
s_name varchar (20),
s_marks int,
);

insert into student_details4 values(
1, 'Anne', 73
);

insert into student_details4 values(
2, 'Juliya', 92
);

insert into student_details4 values(
3, 'Matt', 65
);

select * from student_details4;

--(UNION OPERATORS)

select * from student_details3
union
select * from student_details4

--(UNION ALL OPERATORS)

select * from student_details3
union all
select * from student_details4

--(EXCEPT OPERATOR)

select * from student_details3
except
select * from student_details4

--(INTERSECT OPERATOR)

select * from student_details3
intersect
select * from student_details4

--(STORED PROCEDURE WITHOUT PARAMETERS)

--1)
create procedure employee_age
as
select emp_age from employee
go

exec employee_age

--2)
create procedure employee_details
as
select * from employee
go

exec employee_details

--(STORED PROCEDURE WITH PARAMETERS SYNTAX)

create procedure employee_gender @gender varchar (20)
as
select * from employee
where emp_gender = @gender
go

exec employee_gender @gender='Male'

--(VIEWS SQL)

create view female_employee
As
select * from employee
where emp_gender = 'Female';

select * from female_employee;

---2) (DROP VIEW)

drop view female_employee;
select * from female_employee;

--(TRANSACTION IN SQL)

--1) (UPDATE Transaction)

begin transaction
update employee set emp_age=30
where emp_name='Sam'

select * from employee;

--2) (ROLL BACK TRANSACTION)

begin transaction
update employee set emp_age=30
where emp_name='Sam'
rollback transaction

select * from employee;

--3) (COMMIT-- PERMANENT CHANGE)

begin transaction
update employee set emp_age=30
where emp_name='Sam'
commit transaction

select * from employee;

--(TRY & CATCH BLOCK)

begin try
       update employee set emp_salary=50 where emp_gender='Male'
       update employee set emp_salary=195/0 where emp_gender='Female'
commit transaction
      print 'transaction committed'
end try 
begin catch
    rollback transaction
    print 'transaction rollback'
end catch

select * from employee;

--------
begin try
       update employee set emp_salary=50 where emp_gender='Male'
       update employee set emp_salary=195 where emp_gender='Female'
commit transaction
      print 'transaction committed'
end try 
begin catch
    rollback transaction
    print 'transaction rollback'
end catch

select * from employee;

--(EXCEPTION HANDLING)

--1)

declare @val1 int;
declare @val2 int;

begin try
set @val1 = 8
set @val2 = @val1/0
end try 

begin catch
print error_message()
end catch

--2) (USER DEFINED MESSAGES)

select * from employee

begin try
select emp_salary + emp_name from employee
end try

begin catch 
print 'Cannot add a numerical value with a string value'
end catch
go











