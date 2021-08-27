USE HostpitalWaitList;
GO

SET statistics io ON
GO


-- Patient age at referral and days waiting from referral date
SELECT p.[PatientID], CONCAT(p.[PatientFName], ' ',p.[PatientLName] ) AS 'Patient Name', 
CAST(DATEDIFF(DAY,p.DOB,r.referralDate) /365.25 AS INT) AS 'Patient Age', 
DATEDIFF(day, r.[ReferralDate], r.[FSADate]) AS 'Days Waiting'
FROM [dbo].[Referral] r
INNER JOIN [dbo].[Patient]p ON r.[PatientID]=p.[PatientID]
WHERE r.[HealthTargetEligible] = 1


-- 1.How many people have been referred for cardiothoracic?
SELECT COUNT(r.[DepartmentID]) AS 'Total Referred to Cardiothoracic'
FROM [dbo].[Referral] r
WHERE r.[DepartmentID] = 2 AND r.[HealthTargetEligible] = 1


-- 2. What is the average time taken (in days) to see a Surgeon by Department?
SELECT d.[DepartmentName] AS 'Department', r.[PatientID], DATEDIFF(day, r.[ReferralDate], r.[FSADate]) AS 'Days Waiting'
FROM [dbo].[Department] d
join [dbo].[Referral] r
on r.[DepartmentID] = d.[DepartmentID]
ORDER BY d.[DepartmentName] ASC


-- 3.Who has each Surgeon had on their list and how long have they been waiting or did they wait?
SELECT s.[SurgeonName] AS 'Surgeon Name', 
CONCAT(p.[PatientFName], ' ',p.[PatientLName] ) AS 'Patient Name',
DATEDIFF(day, r.[ReferralDate], r.[FSADate]) AS 'Days Waiting'
FROM [dbo].[Referral] r
INNER JOIN [dbo].[Patient] p ON p.[PatientID] = r.[PatientID]
INNER JOIN [dbo].[Surgeon] s ON s.[SurgeonID] = r.[SurgeonID]
WHERE r.[FSADate] IS NOT NULL -- this removes the ones who didnt wait
ORDER BY s.SurgeonName ASC


-- 4. Assuming that all patients under 18 need to be seen by Paediatric Surgery, are there any patients who need to be reassigned? 
SELECT p.[PatientID] AS 'Patient NHI',
CONCAT(p.[PatientFName], ' ', p.[PatientLName]) AS 'Patient Name',
CAST(DATEDIFF(DAY,p.[DOB],r.[ReferralDate]) /365.25 AS INT) AS 'Patient Age',
d.[DepartmentName] AS 'Department Name'
FROM  [dbo].[Referral] r
INNER JOIN [dbo].[Patient] p ON p.[PatientID]=r.[PatientID]
INNER JOIN [dbo].[Department] d ON r.[DepartmentID]=d.[DepartmentID]
WHERE CAST(DATEDIFF(DAY,p.[DOB],r.[ReferralDate]) /365.25 AS INT) < 18 
AND r.[HealthTargetEligible] = 1 -- 1 = yes 0 = no
AND d.[DepartmentName] !='Paediatric Surgery'


-- 5.What percentage of patient were seen within the target of 75 days by department?
SELECT d.[DepartmentName] AS 'Department Name',
CAST(CAST(m.MetCount AS DECIMAL) / CAST(p.NoPatient AS DECIMAL) *100 AS DECIMAL) AS 'Percentage Met'
FROM
(
	SELECT r.[DepartmentID], COUNT(*) AS MetCount 
	FROM  [dbo].[Referral] r
	WHERE DATEDIFF(DAY,r.[ReferralDate],r.[FSADate]) < 76
	GROUP BY r.[DepartmentID]
) AS m
RIGHT JOIN 
(
	SELECT r.[DepartmentID], COUNT(*) AS NoPatient
	FROM  [dbo].[Referral] r
	GROUP BY r.[DepartmentID]
) AS p ON p.[DepartmentID]=m.[DepartmentID]
INNER JOIN [dbo].[Department] d ON d.[DepartmentID]=p.[DepartmentID]


