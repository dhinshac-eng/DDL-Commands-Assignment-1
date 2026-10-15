create database employee;
use employee;

create table Departments
  (department_id int primary key,
  department_name varchar(100) not null);
create table Location
  (location_id int primary key,
  location_name varchar(30) not null);
create table Employees
  (employee_id int primary key,
  employee_name varchar(50) not null,
  gender enum("M","F"),
  age int,
  hire_date date,
  designation varchar(100),
  department_id int,
  location_id int,
  salary decimal(10,2),
  foreign key(department_id)references Departments(department_id),
  foreign key(location_id)references Location(location_id));
  
  alter table Employees add column email varchar(50);
  alter table Employees modify column designation varchar(150);
  alter table Employees drop column age;
  alter table Employees rename column hire_date to date_of_joining;
  
  rename table Departments to Departments_info;
  rename table Location to Locations;
  
  truncate table Employees;
  
  drop table Employees;
  drop database employee;
  
  create database if not exists employee;
  use employee;
  
  create table Departments
  (department_id int primary key,
  department_name varchar(100) not null unique);
  create table Location
  (location_id int primary key auto_increment,
  location_name varchar(30) not null unique);
  create table Employees
  (employee_id int primary key,
  employee_name varchar(50) not null,
  gender enum("M","F"),
  age int check(age >= 18),
  hire_date date default(current_date),
  designation varchar(100),
  department_id int,
  location_id int,
  salary decimal(10,2),
  foreign key(department_id)references Departments(department_id),
  foreign key(location_id)references Location(location_id));