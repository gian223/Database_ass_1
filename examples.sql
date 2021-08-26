use [AdventureWorks2017]
GO

-- sWITCH ON INPOUT/OUTPUIT STATS
SET statistics io ON
GO

--SWITCH ON THE TIME STATS
SET statistics TIME ON
GO

SELECT * FROM [Person].[Person]

SELECT [FirstName] FROM [Person].[Person]

SELECT [FirstName] FROM [Person].[Person] WHERE [FirstName] = 'Kim'

select e.LoginID, a.EmailAddress
from  HumanResources.Employee e
 join  Person.Person p
  on e.BusinessEntityID = p.BusinessEntityId
 join Person.EmailAddress a
  on e.BusinessEntityID = a.BusinessEntityID
 where e.BusinessEntityID = 1



select e.LoginID, e.VacationHours
from  HumanResources.Employee e
where e.BusinessEntityID = 1


SELECT p.Name, pr.ProductReviewID, pr.Comments
FROM Production.Product p
INNER JOIN Production.ProductReview pr
ON p.ProductID = pr.ProductID;
GO


SELECT DISTINCT PersonType
FROM Person.Person;
GO

SELECT DISTINCT PersonType, EmailPromotion
FROM Person.Person;


SELECT LoginID, JobTitle, MaritalStatus 
FROM HumanResources.Employee;

SELECT LoginID, JobTitle, MaritalStatus
FROM HumanResources.Employee
WHERE MaritalStatus  ='M';



SELECT DISTINCT PersonType, CASE PersonType		WHEN 'SC' THEN 'Store Contact'		WHEN 'IN' THEN 'Individual Customer'		WHEN 'SP' THEN 'Sales Person'		WHEN 'EM' THEN 'Employee'		WHEN 'VC' THEN 'Vendor Contact'		WHEN 'GC' THEN 'General Contact'		ELSE 'Unknown Person Type'END AS [Type of Contact]FROM Person.Person;




-- sWITCH ON INPOUT/OUTPUIT STATS
SET statistics io OFF
GO

--SWITCH OFF THE TIME STATS
SET statistics TIME OFF
GO