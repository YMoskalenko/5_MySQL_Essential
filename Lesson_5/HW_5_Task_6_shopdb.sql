#Task 6
# --------------------------------------------------------------------------------------------------
use shopdb;

select * from customers;
select * from employees;

# Используя вложенные запросы и ShopDB получить имена покупателей и имена сотрудников у которых TotalPrice товара больше 1000
select  e.LName, e.FName, e.MName, e.Salary, 
	(select c.LName from customers as c where e.ManagerEmpID = c.CustomerNo)as LName,
    (select c.FName from customers as c where e.ManagerEmpID = c.CustomerNo)as LName,
    (select c.MName from customers as c where e.ManagerEmpID = c.CustomerNo)as LName
from employees as e
where Salary  > 1000;