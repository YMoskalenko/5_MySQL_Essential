# Нормалізувати таблицю, що знаходиться в матеріалах до уроку.
create database Military_Base;
use Military_Base;

create table Personnel(
	roll_Number int not null unique auto_increment primary key,
	name varchar (20) not null,
	surname varchar (20) not null,
	personnel_rank varchar (20),
	platoon_no int null,
	office_no int null);

create table Weapon_Type (
	id_Type int not null unique auto_increment primary key,
	weapon_name varchar (30));

create table Weapon_Transfer (
	transfer_id int not null unique auto_increment primary key,
	receiver_id int,
	weapon_id int,
	dealer_id int,
	foreign key (receiver_id) references Personnel (roll_Number),
	foreign key (weapon_id) references Weapon_Type (id_Type),
	foreign key (dealer_id) references Personnel (roll_Number));

# Створюємо перелік співробітників
#--------------------------------------------------------------------------
insert into Personnel 
(name, surname, personnel_rank, platoon_no, office_no)
values
('Vadym', 'Petrov', 'officer', '222', '205'),
('Volodymyr', 'Lodarenko', 'officer', '232', '221'),
('Kostiantyn', 'Loentenko', 'officer', '212', '201'),
('Rostyslav', 'Duhovenko', 'officer', '200', null),
('Ostap', 'Burenko', 'major', null, null),
('Mykola', 'Rybak', 'major', null, null),
('Viacheslav', 'Derebanov', 'lieutenant colonel', null, null);

# Створюємо перелік зброї
#--------------------------------------------------------------------------
insert into Weapon_Type 
(weapon_name)
value
('AK-47'),
('Glok20');

# Протокол передачі зброї
# --------------------------------------------------------------------------
insert into Weapon_Transfer 
(receiver_id, weapon_id, dealer_id)
value
(1, 1, 5),
(1, 2, 6),
(2, 1, 7),
(2, 2, 6),
(3, 1, 5),
(3, 2, 6),
(4, 1, 5);

# Перегляд усіх таблиць даних
# --------------------------------------------------------------------------
select * from Personnel;
select * from Weapon_Type;
select * from Weapon_Transfer;

# Вивід поєднаної інфо про видану зброю співробітникам

# так і не зрозумів як правильно об'єднати таблиці, враховуючи, що одній людині може бути видано 2 види зброї, щоб інфа була у вигляди схожою на ввідну таблицю.

# --------------------------------------------------------------------------
#select p.names, p.surname, p.personnel_rank, p.platoon_no, p.office_no, t.weapon_name
#from ((Personnel p
#inner join Weapon_Transfer transf ON p.roll_Number = transf.receiver_id)
#inner join Weapon_Type t ON transf.weapon_id = t.weapon_name);

# Видалення таблиць і БД
# --------------------------------------------------------------------------
#drop table Weapon_Transfer;
#drop table Weapon_Type;
#drop table Personnel;
#drop DATABASE military_base;

