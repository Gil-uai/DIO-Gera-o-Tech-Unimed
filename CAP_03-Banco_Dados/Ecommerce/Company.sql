create schema if not exists company;
create table company.employee(
	Fname varchar(15) NOT null,
	Minit char,
	Lname varchar (15) NOT NULL,
	Ssn char(9) NOT NULL,
	Bdate DATE,
	Address varchar(30),
	sex char,
	Salary decimal(10,2),
	Super_ssn char(9),
	Dno int NOT NULL,
	primary key(Ssn),
);
use company;
create table departament(
	Dname varchar (15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date date,
    primary key (Dname),
    unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn),
);