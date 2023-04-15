#Task 6
# --------------------------------------------------------------------------------------------------
use shopdb;

select * from customers;
select * from employees;

# Используя JOIN’s и ShopDB получить имена покупателей и имена сотрудников у которых TotalPrice товара больше 1000
select  e.LName, e.FName, e.MName, e.Salary, c.LName, c.FName, c.MName
from employees as e
inner join customers as c
on e.ManagerEmpID = c.CustomerNo
where Salary  >= 1000;