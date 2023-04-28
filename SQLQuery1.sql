use AdventureWorks2019
----------#1 all from Sales.Customer--------
select * from Sales.Customer

go
---------#2 all from Sales.Store orderBy Name

select * from Sales.Store as s order by s.[Name] asc

go

--------#3 --Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28 ------------
select top 10 * from HumanResources.Employee as e where e.[BirthDate] > '1989-09-28'

go
----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию

select NationalIDNumber,LoginID, JobTitle  from HumanResources.Employee as e where e.LoginID like '%0' order by e.JobTitle desc

go
----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------
select * from Person.Person as p where p.MiddleName is not null and p.Title is null and p.ModifiedDate between '2008-01-01 00:00:00.000' and '2008-12-31 00:00:00.000'

go
----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------
 
select distinct d.Name from HumanResources.Department as d inner join HumanResources.EmployeeDepartmentHistory as h on d.DepartmentID = h.DepartmentID where h.EndDate is null

go
----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------
select SUM(CommissionPct) as summ from Sales.SalesPerson as s
 group by s.TerritoryID
  having SUM(CommissionPct) > 0
 
go 
 ----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
--треба доробити
-------------------------------------------------------------
select  * from HumanResources.Employee as e where e.VacationHours=(select MAX(e1.VacationHours) from HumanResources.Employee as e1)

go

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------
select * from HumanResources.Employee as e where e.JobTitle = 'Sales Representative' or e.JobTitle = 'Network Administrator' or e.JobTitle ='Network Manager'

go
----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------
select * from HumanResources.Employee as e left join Purchasing.PurchaseOrderHeader as p on e.BusinessEntityID = p.EmployeeID