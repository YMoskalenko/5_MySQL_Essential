create database Wholesale_Warehouse;
use Wholesale_Warehouse;
---------------------------------------------------------------------------------------------------------
# Таблиця "Постачальники"
create table Supliers (
	 suplierID int not null unique,
	 companyName varchar(30) not null,
	 typeOfGoods varchar (50),
	 contactPerson varchar (30),
	 phoneNumber varchar (20) not null,
	 adress varchar (60),
	 primary key (suplierID) 
);

insert into Supliers
(suplierID, companyName, typeOfGoods,  contactPerson, phoneNumber, adress)
values
(10001, 'Розетка', 'Побутоба хімія', 'Джон Уик', '+38080505505', 'м. Київ, просп. С. Бандери, 6'),
(10002, 'Алло', 'Гаджети', 'Дмитро Деревицький', '+38080504504', 'м. Дніпро, вулиця Барикадна, 15 '),
(10003, 'Епіцентр', 'Буд. матеріали', 'Олександр Герега', '+38080595595', 'м. Київ, вул. Берковецька, 6В'); 

select * from Supliers;
 
select contactPerson, phoneNumber from Supliers where companyName = 'Алло';
---------------------------------------------------------------------------------------------------------
# Таблиця "Персонал"
create table Personnel (
	 persID int auto_increment not null unique,
	 persName varchar (30) not null,
	 position varchar (50),
	 phoneNumber varchar (20) not null,
	 department varchar (30) not null,
	 primary key (persID)
);

insert into Personnel
(persName, position, phoneNumber, department)
values
('Ванесса Мей', 'accountant', '+38050122112*52', 'Економічний'), 
('Шон Пен', 'secretary', '+38050122112*635', 'Економічний'),
('Гай Риччи', 'security', '+38050122112*869', 'Юридичний'),
('Дуейн Джонсон', 'head of the security department', '+38050122112*101', 'Фінансовий');
 
select * from Personnel where department = 'Економічний';
---------------------------------------------------------------------------------------------------------
#Таблиця "Покупці"
create table Customers (
	 customerID int auto_increment not null,
	 customerName varchar (40) not null,
	 phoneNumber varchar (20) not null,
	 company varchar (50),
	 deliveryAdress varchar (60), 
	 primary key (customerID) 
);

insert into Customers 
(customerName, phoneNumber, company, deliveryAdress)
values
('Пес Патрон', '+380657845511', 'ЗСУ', 'null'),
('Мертва Русня', '+380667788994', 'null', 'null');

select * from Customers where customerName like 'П%';
---------------------------------------------------------------------------------------------------------
-- # Видалення BD
-- drop table Supliers;
-- drop table Personnel;
-- drop table Customers;
-- drop database Wholesale_Warehouse;