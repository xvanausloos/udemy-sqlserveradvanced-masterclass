-- Exercise 1
SELECT 
 Person.FirstName, 
 Person.LastName, 
 HumanResources.Employee.JobTitle, 
 HumanResources.EmployeePayHistory.Rate,
 [AverageRate] = AVG(HumanResources.EmployeePayHistory.Rate) OVER()
FROM Person.Person
INNER JOIN HumanResources.Employee 
ON Person.BusinessEntityID = Employee.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory
ON Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID

;

-- Exercise 2
SELECT 
 Person.FirstName, 
 Person.LastName, 
 HumanResources.Employee.JobTitle, 
 HumanResources.EmployeePayHistory.Rate,
 [AverageRate] = AVG(HumanResources.EmployeePayHistory.Rate) OVER(),
 MaxRate =  Max(HumanResources.EmployeePayHistory.Rate) OVER()
FROM Person.Person
INNER JOIN HumanResources.Employee 
ON Person.BusinessEntityID = Employee.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory
ON Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID
;

-- Exercise 3
SELECT 
 Person.FirstName, 
 Person.LastName, 
 HumanResources.Employee.JobTitle, 
 HumanResources.EmployeePayHistory.Rate,
 [AverageRate] = AVG(HumanResources.EmployeePayHistory.Rate) OVER(),
 MaxRate =  Max(HumanResources.EmployeePayHistory.Rate) OVER(),
 DiffFromAvgRate =  HumanResources.EmployeePayHistory.Rate - AVG(HumanResources.EmployeePayHistory.Rate) OVER()
FROM Person.Person
INNER JOIN HumanResources.Employee 
ON Person.BusinessEntityID = Employee.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory
ON Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID;

-- Exercise 4
SELECT 
 Person.FirstName, 
 Person.LastName, 
 HumanResources.Employee.JobTitle, 
 HumanResources.EmployeePayHistory.Rate,
 [AverageRate] = AVG(HumanResources.EmployeePayHistory.Rate) OVER(),
 MaxRate =  Max(HumanResources.EmployeePayHistory.Rate) OVER(),
 DiffFromAvgRate =  HumanResources.EmployeePayHistory.Rate - AVG(HumanResources.EmployeePayHistory.Rate) OVER(),
 PercentofMaxRate = HumanResources.EmployeePayHistory.Rate / MAX(HumanResources.EmployeePayHistory.Rate) OVER() * 100
FROM Person.Person
INNER JOIN HumanResources.Employee 
ON Person.BusinessEntityID = Employee.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory
ON Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID;

