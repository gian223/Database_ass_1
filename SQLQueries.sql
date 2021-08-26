USE Hospital
GO

SELECT DATEDIFF(day, [ReferralDate], [FSADate]) FROM [dbo].[Referral];


SET statistics io ON
GO

SELECT DATEDIFF(day, [dbo].[Referral].[ReferralDate], [dbo].[Referral].[FSADate]), [dbo].[Department].[DepartmentID]
FROM [dbo].[Referral], [dbo].[Department] 
ORDER BY [dbo].[Referral].[DepartmentID] ASC

-- Patient age at referral and days waiting from referral date
SELECT p.[PatientID], CONCAT(p.[PatientFName], ' ',p.[PatientLName] ) AS 'Patient Name', 
CAST(DATEDIFF(DAY,p.DOB,r.referralDate) /365.25 AS INT) AS 'Patient Age', 
DATEDIFF(day, r.[ReferralDate], r.[FSADate]) AS 'Days Waiting'
FROM [dbo].[Referral] r
INNER JOIN [dbo].[Patient]p ON r.[PatientID]=p.[PatientID]

-- 1.How many people have been referred for cardiothoracic?
SELECT COUNT(r.[DepartmentID]) AS 'Total Referred'
FROM [dbo].[Referral] r
WHERE r.[DepartmentID] = 2


-- 2. What is the average time taken (in days) to see a Surgeon by Department?
SELECT d.[DepartmentName] AS 'Department', r.[PatientID], DATEDIFF(day, r.[ReferralDate], r.[FSADate]) AS 'Days Waiting'
FROM [dbo].[Department] d
join [dbo].[Referral] r
on r.[DepartmentID] = d.[DepartmentID]
ORDER BY d.[DepartmentName] ASC

-- 3.Who has each Surgeon had on their list and how long have they been waiting or did they wait?

SELECT s.[SurgeonName] AS 'Surgeon Name', 
CONCAT(p.[PatientFName], ' ',p.[PatientLName] ) AS 'Patient Name',
ISNULL(DATEDIFF(day, r.[ReferralDate], r.[FSADate]), 0) AS 'Days Waiting'
FROM [dbo].[Referral] r
INNER JOIN [dbo].[Patient] p ON p.[PatientID] = r.[PatientID]
INNER JOIN [dbo].[Surgeon] s ON s.[SurgeonID] = r.[SurgeonID]
ORDER BY s.SurgeonName ASC
-- WHERE r.[FSADate] IS NOT NULL


-- 4. Assuming that all patients under 18 need to be seen by Paediatric Surgery, are there any patients who need to be reassigned? 

-- 5.What percentage of patient were seen within the target of 75 days by department?
SELECT r.[DepartmentID], (case when DATEDIFF(day, r.[ReferralDate], r.[FSADate]) < 76 then 1 else null end) AS 'Days Waiting'
FROM [dbo].[Referral] r
INNER JOIN [dbo].[Department] d ON d.[DepartmentID] = r.[DepartmentID]
WHERE r.[FSADate] IS NOT NULL
ORDER BY r.[DepartmentID]

