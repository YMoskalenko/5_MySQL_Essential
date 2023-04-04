/* ДЗ №2. Створення бази данних з ім'ям “MyDB” */

CREATE DATABASE  MyDB;
USE MyDB;

/* ДЗ №3. Створення таблиці із: іменем і номером телефону сотрудників компанії */

CREATE TABLE Persons (
    PersonID INT AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    PRIMARY KEY (PersonID)
);

INSERT INTO Persons (FirstName) VALUES ('Андрій');
INSERT INTO Persons (FirstName) VALUES ('Антон');
INSERT INTO Persons (FirstName) VALUES ('Василь');

/* ДЗ №3. Створення таблиці: відомості про їх зарплати і посади */

CREATE TABLE Salary (
	PersonID INT AUTO_INCREMENT NOT NULL,
	Salary INT NOT NULL,
    Position VARCHAR(255) NOT NULL,
    PRIMARY KEY (PersonID)
    );
    
    INSERT INTO Salary (Salary, Position) VALUES (7600, 'стажер');
    INSERT INTO Salary (Salary, Position) VALUES (50000, 'комерційний директор');
    INSERT INTO Salary (Salary, Position) VALUES (30000, 'головний бухгалтер');

/* ДЗ №3. Створення таблиці: інформацію про сімейний стан, дату народження і місце проживання */

CREATE TABLE PersonalInfo (
	PersonID INT AUTO_INCREMENT NOT NULL,
	MaritalStatus SET('одружен(а)ий','неодружен(а)ий') NOT NULL,
    DateOfBirth DATE NOT NULL,
    PlaceOfResidence VARCHAR(255) NOT NULL,
	PRIMARY KEY (PersonID)
    );
    
    INSERT INTO PersonalInfo (MaritalStatus, DateOfBirth, PlaceOfResidence) VALUES ('неодружен(а)ий', '1988-08-03', 'м. Київ, вул. С. Бандери, буд. 23');
    INSERT INTO PersonalInfo (MaritalStatus, DateOfBirth, PlaceOfResidence) VALUES ('одружен(а)ий', '1985-02-05', 'м. Вінниця, вул. М. Грушевського, 6, кв. 333');
    INSERT INTO PersonalInfo (MaritalStatus, DateOfBirth, PlaceOfResidence) VALUES ('неодружен(а)ий', '1988-07-12', 'м. Дніпро, вул. М. Лояна, буд. 89, кв. 123');
    
/* ДЗ №4. Отримуємо із табл.2 id співробітників, зарплата яких становить більше 10000 грн.*/

SELECT * FROM mydb.salary WHERE Salary > 10000; 

/* ДЗ №5. Співробітник по id 1 не був одружений, зараз він одружився, тому змінюємо дані про семейний стан в табл. 3 (PersonalInfo)*/

SELECT * FROM mydb.personalinfo  WHERE PersonID = 1; -- запит для перевірки сімейного стану співробітника 1
UPDATE mydb.personalinfo SET MaritalStatus = 'одружен(а)ий' WHERE PersonID = 1; -- змінюємо сімейний стан
SELECT * FROM mydb.personalinfo  WHERE PersonID = 1; -- запит для перевірки зміни сімейного стану співробітника 1

/* ДЗ №7. Створюємо пусту базу даних автомобілей. Заповнюємо таблицю даними (id(Autoincrement), марка, модель, об'єм двигуна, ціна, макс. швидкість).*/

CREATE DATABASE  auto;
USE auto;

CREATE TABLE auto (
	ID INT AUTO_INCREMENT NOT NULL,
	Mark VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    EngineCapacity FLOAT(5, 2) NOT NULL,
    Price INT NOT NULL,
    Speed INT NOT NULL,
	PRIMARY KEY (ID)
    );
    
    INSERT INTO auto (Mark, Model, EngineCapacity, Price, Speed) VALUES ('BMW', 'X6', 6.0, 100000, 300);
    INSERT INTO auto (Mark, Model, EngineCapacity, Price, Speed) VALUES ('Audi','Q8', 3.8 , 60000,240);
    INSERT INTO auto (Mark, Model, EngineCapacity, Price, Speed) VALUES ('McLaren','Solus GT', 15.8, 1000000, 480);
    INSERT INTO auto (Mark, Model, EngineCapacity, Price, Speed) VALUES ('Porche','Panamera', 4.6, 80000, 320);
    INSERT INTO auto (Mark, Model, EngineCapacity, Price, Speed) VALUES ('Lexus','QX570', 7.2, 75000, 360);
    
    SELECT * FROM auto.auto;
