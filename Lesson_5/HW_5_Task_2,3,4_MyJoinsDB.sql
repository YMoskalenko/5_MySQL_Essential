#Task 2
# --------------------------------------------------------------------------------------------------
create database MyJoinsDB;
use MyJoinsDB;
# --------------------------------------------------------------------------------------------------
#Task 3
# --------------------------------------------------------------------------------------------------
create table Personel (
	TabelNumber int not null unique primary key,
    FirstName varchar(20) not null,
    LastName varchar(50) not null,
    SurName varchar(20) not null,
	MobilePhone varchar(20) not null
);

insert into Personel (TabelNumber, FirstName, LastName, SurName, MobilePhone) 
values 
(1, 'Козак', 'Іван', 'Богданович', '380675997359'),
(2, 'Шевченко', 'Тарас', 'Григорович', '380950447889'),
(3, 'Пирогов', 'Микола', 'Іванович', '380662359874');
# --------------------------------------------------------------------------------------------------
create table JobTitle (
	TabelNumber int not null unique primary key,
    foreign key (TabelNumber) references Personel (TabelNumber),
	Salary 	int not null,
	JobTitle varchar(50) not null
);

insert into JobTitle (TabelNumber, Salary, JobTitle)
values
(1, 50000 , 'комерційний директор'),
(2, 25000 , 'менеджер'),
(3, 10000, 'робітник');
# --------------------------------------------------------------------------------------------------
create table PersonelInfo (
	TabelNumber int not null unique primary key,
    foreign key (TabelNumber) references Personel (TabelNumber),
	MaritalStatus SET('одружен(а)ий','неодружен(а)ий') NOT NULL,
	DateOfBirth varchar(10) not null,
    HomeAdress varchar(50) not null
);

insert into PersonelInfo (TabelNumber, MaritalStatus, DateOfBirth, HomeAdress)
values
(1, 'одружен(а)ий' , '05.08.1990', 'вул. Б. Ступки, буд. 8, кв. 64'),
(2, 'одружен(а)ий' , '01.08.2000', 'вул. Б. Хмельницького, буд. 3, кв. 9'),
(3, 'неодружен(а)ий', '12.12.2001', 'вул. О. Бендера, буд. 77, кв. 81');

#select * from Personel;
#select * from JobTitle;
#select * from PersonnelInfo;

# --------------------------------------------------------------------------------------------------
#Task 4

# Personel p (TabelNumber, FirstName, LastName, SurName, MobilePhone) 
# JobTitle j (TabelNumber, Salary, JobTitle)
# PersonelInfo pi (TabelNumber, MaritalStatus, DateOfBirth, HomeAdress)

# 1 ------------------------------------------------------------------------------------------------
# Получите контактные данные сотрудников (номера телефонов, место жительства)
select p.FirstName, p.LastName, p.SurName, p.MobilePhone, (select pi.HomeAdress from PersonelInfo as pi where p.TabelNumber = pi.TabelNumber) as HomeAdress from Personel as p;

# 2 ------------------------------------------------------------------------------------------------
# Получите информацию о дате рождения всех холостых сотрудников и их номера.
select p.FirstName, p.LastName, p.SurName, (
    select pi.DateOfBirth from PersonelInfo as pi where pi.TabelNumber = p.TabelNumber) as DateOfBirth
from Personel as p
where p.TabelNumber not in (
	select tabelNumber from PersonelInfo pi where pi.MaritalStatus != 'неодружен(а)ий');
  
# 3 ------------------------------------------------------------------------------------------------
# Получите информацию обо всех менеджерах компании: дату рождения и номер телефона. 

select j.JobTitle, (
	select pi.DateOfBirth from PersonelInfo as pi where pi.TabelNumber = j.TabelNumber) as DateOfBirth
from JobTitle as j
	where j.JobTitle = 'менеджер';

#drop table PersonelInfo;
#drop table JobTitle;
#drop table Personel;
#drop database myjoinsdb;