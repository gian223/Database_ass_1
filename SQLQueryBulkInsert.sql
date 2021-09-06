CREATE DATABASE HostpitalWaitList;
GO

USE HostpitalWaitList;
GO

DROP TABLE Department
DROP TABLE Doctor
DROP TABLE Patient
DROP TABLE Surgeon
DROP TABLE Referral

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY NOT NULL,
    DoctorType VARCHAR(8) NOT NULL,
    DoctorName VARCHAR(20) NOT NULL
);

BULK INSERT Doctor
FROM 'C:\Users\Gian\OneDrive - Ara Institute of Canterbury\Database\Assignment_1\tables\Doctor.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(25) NOT NULL
);

BULK INSERT Department
FROM 'C:\Users\Gian\OneDrive - Ara Institute of Canterbury\Database\Assignment_1\tables\Department.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

CREATE TABLE Surgeon (
    SurgeonID INT PRIMARY KEY NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES Department(DepartmentID) NOT NULL,
    SurgeonName VARCHAR(20) NOT NULL
);

BULK INSERT Surgeon
FROM 'C:\Users\Gian\OneDrive - Ara Institute of Canterbury\Database\Assignment_1\tables\Surgeon.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO


CREATE TABLE Patient (
    PatientID VARCHAR(10) PRIMARY KEY NOT NULL,
    PatientFName VARCHAR(20) NOT NULL,
	PatientLName VARCHAR(20) NOT NULL,
    DOB DATE NOT NULL,
    Gender VARCHAR(7) NOT NULL,
    DoctorID INT FOREIGN KEY REFERENCES Doctor(DoctorID) NOT NULL,
);

BULK INSERT Patient
FROM 'C:\Users\Gian\OneDrive - Ara Institute of Canterbury\Database\Assignment_1\tables\Patient.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO





CREATE TABLE Referral (
    ReferralID INT PRIMARY KEY NOT NULL,
    ReferralDate DATE NOT NULL,
    PatientID VARCHAR(10) FOREIGN KEY REFERENCES Patient(PatientID) NOT NULL,
    HealthTargetEligible INT NOT NULL,
    DoctorID INT FOREIGN KEY REFERENCES Doctor(DoctorID) NOT NULL,
    SurgeonID INT FOREIGN KEY REFERENCES Surgeon(SurgeonID) NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES Department(DepartmentID) NOT NULL,
    FSADate DATE,
    AddedWaitlist DATE NOT NULL
);

BULK INSERT Referral
FROM 'C:\Users\Gian\OneDrive - Ara Institute of Canterbury\Database\Assignment_1\tables\Referral.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO