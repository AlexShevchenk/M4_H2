use AdventureWorks2019
----------#1 all from Sales.Customer--------
select * from Sales.Customer

go
---------#2 all from Sales.Store orderBy Name

select * from Sales.Store as s order by s.[Name] asc

go

--------#3 --������� �� ������� HumanResources.Employee ��� ����������
--� ������ �����������, ������� �������� ����� 1989-09-28 ------------
select top 10 * from HumanResources.Employee as e where e.[BirthDate] > '1989-09-28'

go
----------------------������� �4-----------------------------
--������� �� ������� HumanResources.Employee �����������
--� ������� ��������� ������ LoginID �������� 0.
--������� ������ NationalIDNumber, LoginID, JobTitle.
--������ ������ ���� ������������� �� JobTitle �� ��������

select NationalIDNumber,LoginID, JobTitle  from HumanResources.Employee as e where e.LoginID like '%0' order by e.JobTitle desc

go
----------------------������� �5-----------------------------
--������� �� ������� Person.Person ��� ���������� � �������, ������� ���� 
--��������� � 2008 ���� (ModifiedDate) � MiddleName ��������
--�������� � Title �� �������� �������� 
-------------------------------------------------------------
select * from Person.Person as p where p.MiddleName is not null and p.Title is null and p.ModifiedDate between '2008-01-01 00:00:00.000' and '2008-12-31 00:00:00.000'

go
----------------------������� �6-----------------------------
--������� �������� ������ (HumanResources.Department.Name) ��� ����������
--� ������� ���� ����������
--������������ ������� HumanResources.EmployeeDepartmentHistory � HumanResources.Department
-------------------------------------------------------------
 
select distinct d.Name from HumanResources.Department as d inner join HumanResources.EmployeeDepartmentHistory as h on d.DepartmentID = h.DepartmentID where h.EndDate is null

go
----------------------������� �7-----------------------------
--������������ ������ �� ������� Sales.SalesPerson �� TerritoryID
--� ������� ����� CommissionPct, ���� ��� ������ 0
-------------------------------------------------------------
select SUM(CommissionPct) as summ from Sales.SalesPerson as s
 group by s.TerritoryID
  having SUM(CommissionPct) > 0
 
go 
 ----------------------������� �8-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ����� ������� ���-�� 
--������� (HumanResources.Employee.VacationHours)
--����� ��������
-------------------------------------------------------------
select  * from HumanResources.Employee as e where e.VacationHours=(select MAX(e1.VacationHours) from HumanResources.Employee as e1)

go

----------------------������� �9-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ������� (HumanResources.Employee.JobTitle)
--'Sales Representative' ��� 'Network Administrator' ��� 'Network Manager'
-------------------------------------------------------------
select * from HumanResources.Employee as e where e.JobTitle = 'Sales Representative' or e.JobTitle = 'Network Administrator' or e.JobTitle ='Network Manager'

go
----------------------������� �10-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) � 
--�� ������� (Purchasing.PurchaseOrderHeader). ���� � ���������� ���
--������� �� ������ ���� ������� ����!!!
-------------------------------------------------------------
select * from HumanResources.Employee as e left join Purchasing.PurchaseOrderHeader as p on e.BusinessEntityID = p.EmployeeID