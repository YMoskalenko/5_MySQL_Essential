create database viddil_kadriv;
use viddil_kadriv;
---------------------------------------------------------------------------------------------------------------------------
#Створення таблиці з працівниками
create table Employee (
    TabelNumber int not null unique primary key,
    FirstName varchar(20) not null,
    LastName varchar(50) not null,
    SurName varchar(20) not null
    );
# Заповнення інфо
insert into Employee (TabelNumber, FirstName, LastName, SurName) 
values 
(1000, 'Козак', 'Іван', 'Богданович'),
(1001, 'Шевченко', 'Тарас', 'Григорович'),
(1005, 'Пирогов', 'Микола', 'Іванович');
---------------------------------------------------------------------------------------------------------------------------
#Створення таблиці з інфо про співробітника
create table EmployeeInfo (
	TabelNumber int not null unique primary key,
    foreign key (TabelNumber) references Employee (TabelNumber),
	DateOfBirth varchar(10) not null,
    CityOfBirth varchar(20) not null,
    PassportSeries varchar(2) not null,
    PassportNumber mediumint(6) not null,
    HomeAdress varchar(50) not null,
    MobilePhone varchar(20) not null
);
# Заповнення інфо
insert into EmployeeInfo (TabelNumber, DateOfBirth, CityOfBirth, PassportSeries, PassportNumber, HomeAdress, MobilePhone) 
values 
(1000, '10.01.1980','м. Жмеринка', 'АВ', 125896, 'вул. Б. Ступки, буд. 8, кв. 64', '(099) 256-56-56'),
(1001, '05.07.1986','м. Житомир', 'АМ', 135891, 'вул. Б. Хмельницького, буд. 3, кв. 9', '(093) 156-53-98'),
(1005, '09.12.1977','м. Жабокрич', 'КП', 265778, 'вул. О. Бендера, буд. 77, кв. 81', '(095) 279-81-38');
---------------------------------------------------------------------------------------------------------------------------
#Створення таблиці з посадами
create table Job_Title (
	TabelNumber int not null unique primary key,
    foreign key (TabelNumber) references Employee (TabelNumber),
	DateStartWork varchar(10) not null,
	JobTitle varchar(50) not null
); 
# Заповнення інфо
insert into Job_Title (TabelNumber, DateStartWork, JobTitle)
values
(1000, '18.01.2000','Комерційний директор'),
(1001, '26.01.2000','Головний бухгалтер'),
(1005, '07.02.2000','Керівник комерціного відділу');
---------------------------------------------------------------------------------------------------------------------------
#Створення таблиці з підрозділів/відділів
create table Department (
	TabelNumber int not null unique primary key,
    foreign key (TabelNumber) references Employee (TabelNumber),
	Department varchar(50) not null
); 
# Заповнення інфо
insert into Department (TabelNumber, Department)
values
(1000, 'Комерційний відділ'),
(1001, 'Бухгалтерія'),
(1005, 'Комерційний відділ');
---------------------------------------------------------------------------------------------------------------------------
# Виведемо інфо про співробітників підприємства
select * from viddil_kadriv.Employee;
select * from viddil_kadriv.EmployeeInfo;
select * from viddil_kadriv.Job_Title;
select * from viddil_kadriv.Department;
---------------------------------------------------------------------------------------------------------------------------
# Виведемо інфо про нашого Головного бухгатера 
select * from viddil_kadriv.Employee where Employee.TabelNumber = 1001;
select * from viddil_kadriv.EmployeeInfo where EmployeeInfo.TabelNumber = 1001;
select * from viddil_kadriv.Job_Title where Job_Title.TabelNumber = 1001;
select * from viddil_kadriv.Department where Department.TabelNumber = 1001;
---------------------------------------------------------------------------------------------------------------------------
# Очищення БД при візиті Податкової ;)
#drop table Employee;
#drop table EmployeeInfo;
#drop table Job_Title;
#drop table Department;
#drop database viddil_kadriv;