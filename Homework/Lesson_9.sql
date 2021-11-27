create table employees (
	id serial primary key,
	employee_name varchar (50) not null
);

insert into employees (id, employee_name)
	values (default, 'Dmitry Mitskevich');

select * from employees;

--=======================

create table salary (
	id serial primary key,
	monthly_salary varchar (1000) not null
);

alter table salary 
alter column monthly_salary type int
using monthly_salary::integer;

insert into salary (id, monthly_salary)
values (default, 2400);

select * from salary;

--=======================

create table employees_salary (
	id serial primary key,
	employee_id int not null,
	salary_id int not null,
	foreign key (employee_id)
		references employees (id),
	foreign key (salary_id)
		references salary (id)
);

select * from employees_salary;

insert into employees_salary (id, employee_id, salary_id)
values (default, 41, 6);

update employees_salary set employee_id = 3
where id = 2;

select employee_id, employees.id, employee_name, salary
from employees_salary
join employees on employee_id = employees.id
join salary on salary_id = salary.id

create table employees (
	id serial primary key,
	employee_name varchar (50) not null
);

insert into employees (id, employee_name)
	values (default, 'Dmitry Mitskevich');

select * from employees;

--=======================

create table salary (
	id serial primary key,
	monthly_salary varchar (1000) not null
);

alter table salary 
alter column monthly_salary type int
using monthly_salary::integer;

insert into salary (id, monthly_salary)
values (default, 2400);

select * from salary;

--=======================

create table employee_salary (
	id serial primary key,
	employee_id int not null,
	salary_id int not null
);

select * from employee_salary;

insert into employee_salary (id, employee_id, salary_id)
values (default, 79, 9);

--=======================

create table roles ( 
	id serial primary key,
	role_name int not null unique
);

select * from roles;

alter table roles
alter role_name type varchar (30);

insert into roles (id, role_name)
values (default, 'Senior Automation QA engineer');

--=======================

create table roles_employee (
	id serial primary key,
	employee_id int not null,
	role_id int not null,
		foreign key (employee_id)
			references employees (id),
		foreign key (role_id)
			references roles (id)
);

select * from roles_employee;

insert into roles_employee (id, employee_id, role_id)
values (default, 40, 15);