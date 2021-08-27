USE Hospital
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
INSERT INTO Doctor VALUES
    (1,'GP','Hilary Trump'),
    (2,'GP','Bill Key'),
    (3,'GP','Donald Clinto'),
    (4,'Internal','Amit Oliver'),
    (5,'GP','Lesley Young'),
    (6,'GP','John English'),
    (7,'GP','Ralph Smith'),
    (8,'Private','Linda Moore'),
    (9,'GP','Michael Scott'),
    (10,'Internal','John Richards');

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(25) NOT NULL
);
INSERT INTO Department VALUES
    (1,'General Surgery'),
    (2,'Cardiothoracic '),
    (3,'Plastics '),
    (4,'Orthopaedics '),
    (5,'Paediatric Surgery');

CREATE TABLE Surgeon (
    SurgeonID INT PRIMARY KEY NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES Department(DepartmentID) NOT NULL,
    SurgeonName VARCHAR(20) NOT NULL
);
INSERT INTO Surgeon VALUES
    (1,1,'Simon Frampto'),
    (2,2,'Peri Duffy'),
    (3,2,'Steve Reniso'),
    (4,3,'Richard Cai'),
    (5,3,'Philip Mitchell'),
    (6,4,'Evelyn Rae'),
    (7,3,'Greta McLea'),
    (8,5,'Nabaz Sayeed'),
    (9,1,'John Marti'),
    (10,5,'Michael Lewis'),
    (11,1,'Karen Reid'),
    (12,4,'Lindsay Nelso'),
    (13,2,'Andy La Salle'),
    (14,5,'Andrew Hood'),
    (15,4,'Robert Patrick');


CREATE TABLE Patient (
    PatientID VARCHAR(10) PRIMARY KEY NOT NULL,
    PatientFName VARCHAR(20) NOT NULL,
	PatientLName VARCHAR(20) NOT NULL,
    DOB DATE NOT NULL,
    Gender VARCHAR(7) NOT NULL,
    DoctorID INT FOREIGN KEY REFERENCES Doctor(DoctorID) NOT NULL,
);
INSERT INTO Patient VALUES
    ('QDX4955','Spense','Pringuer','1972-02-14','Male',1),
    ('ECP7715','Shirline','Van der Kruys','1992-12-27','Female',2),
    ('ZIK8925','Chev','Eckels','1951-04-19','Male',3),
    ('LTS6784','Rik','Futty','1962-04-29','Male',3),
    ('HGM6173','Emalia','Kille','1989-10-21','Female',1),
    ('CEV6132','Rudiger','Endea','1965-02-13','Male',4),
    ('PGJ7161','Beverie','Robez','1968-02-03','Female',5),
    ('NKX8076','Donall','Ricciardo','1948-10-21','Male',2),
    ('MXC8908','Timotheus','Lave','1975-07-30','Male',6),
    ('NTQ8299','Aluino','Spelling','2008-07-16','Male',2),
    ('QNE4372','Elvera','Peasby','2005-10-21','Female',7),
    ('GIR5104','Vitia','Goodlake','1957-06-13','Female',2),
    ('PXKD2272','Sally','Bargery','1980-08-25','Female',5),
    ('DVX6602','Brig','Ovendale','2013-04-28','Male',5),
    ('JIB5920','Syma','Badcock','1976-04-07','Male',8),
    ('YCX9278','Eugenie','Hugueville','2014-05-26','Female',5),
    ('LMV5416','Scottie','Emms','1961-02-15','Male',2),
    ('TBC7855','Vina','Dimond','1967-06-04','Female',9),
    ('SXL9274','Samso','Durban','1967-04-11','Male',10),
    ('AUX6004','Rosalie','Couroy','1977-10-05','Female',4),
    ('SEO7156','Harmony','Goodings','2003-12-11','Other',5),
    ('XUA5670','Niki','Cousins','1984-08-22','Male',7),
    ('GMC9989','Hank','Sola','2006-09-13','Male',9),
    ('SHN9256','Kendra','Slayto','1952-02-20','Female',1),
    ('XSI7349','Gloriana','Brevetor','2010-12-04','Female',9),
    ('NHK9888','Sheri','Corhard','2012-12-23','Female',6),
    ('NCR0550','Zacharia','Collishaw','2010-05-07','Male',1),
    ('CNF6489','Hana','Ryde','1952-02-12','Male',9),
    ('MSC5721','Marni','Kalisz','1963-02-09','Female',8),
    ('VWH6907','Leona','Murtell','1965-07-12','Female',9),
    ('GOZ3094','Andre','Walle','1987-06-01','Male',1),
    ('CMZ6415','Roddy','Bonney','2008-06-15','Male',7),
    ('TNH6480','Eyde','Flucker','2009-09-15','Female',6),
    ('QIJ3412','Catlee','Mackley','1972-09-27','Female',9),
    ('CBD3031','Fremont','Redda','1957-11-22','Male',2),
    ('BBB5629','Ewell','Longmire','1949-08-30','Male',5),
    ('PSYK7786','Gabe','Broschke','1991-11-25','Male',10),
    ('ODR2838','Andra','Francescuccio','1951-04-04','Female',4),
    ('KDD9523','Menard','Prettjoh','1965-04-17','Male',6),
    ('ASD4088','Schuyler','Willimot','1956-12-05','Male',5),
    ('GIQ8970','Whitney','Lakeland','1986-11-10','Male',3),
    ('GEK5713','Lucias','Karlsso','2007-10-29','Male',1),
    ('TGS0798','Simona','Gerrets','1989-04-29','Female',4),
    ('CYC0720','Nahum','Drewet','1962-10-05','Male',7),
    ('SMH8891','Myrilla','Jeando','1968-02-08','Female',7),
    ('FBG1062','Nancee','Circuitt','1961-05-09','Female',8),
    ('XKX1957','Malory','Houndesome','2004-11-28','Female',1),
    ('AFH7245','Gar','Strawbridge','1982-04-14','Male',5),
    ('TXP4069','Sheffield','Hares','2005-05-23','Male',7),
    ('MRL3058','Otho','Duinkerk','1976-06-01','Male',9),
    ('FVL8648','Ruby','Manklow','1976-10-04','Male',4),
    ('PGKY3212','Davida','MacCurlye','1965-09-30','Female',1),
    ('ETV6899','Abba','Rusk','1961-08-17','Male',7),
    ('XKD2272','Boigie','Eastridge','1982-08-01','Male',3),
    ('VFY9388','Cristobal','Guyers','1986-04-23','Male',6),
    ('JBK3991','Marcelia','Jeffcoate','1985-12-17','Female',5),
    ('ZYF6173','Almeria','Crasford','1982-01-11','Female',5),
    ('VSV3481','Beret','Coenraets','1957-02-10','Female',6),
    ('MHR6896','Roderigo','Beekman','1977-06-29','Male',6),
    ('YDV0095','Elicia','McCay','1948-05-30','Female',3),
    ('BDF4913','Ingeberg','Perring','1952-06-11','Female',7),
    ('IWU6403','Smith','McGettiga','2004-05-19','Male',10),
    ('BVF7686','Fli','Gleasane','2008-09-26','Male',4),
    ('RIQ9260','Darlene','Bangham','1990-11-14','Female',9),
    ('MMH2864','Job','Cawood','1962-04-03','Male',6),
    ('RWT4192','Baudoi','Burr','1981-02-16','Male',3),
    ('CYZ8554','Casper','Ashworth','1966-12-10','Male',8),
    ('YBS8538','Gordy','Bellay','1970-07-24','Male',7),
    ('VZQ5362','Claudelle','Digna','1980-07-12','Female',7),
    ('CST7448','Ines','Mitroshinov','1976-05-22','Female',9),
    ('NWM8466','Joshuah','Perrigo','2010-12-26','Male',9),
    ('LQI3268','Drusy','Skews','1973-10-15','Female',10),
    ('LFV3925','Efrem','Kippax','1973-05-05','Male',7),
    ('WHU5837','Barney','Massenhove','1987-07-26','Male',6),
    ('ABR7945','Chas','McGrah','1986-09-03','Male',9),
    ('PLL2090','Morganne','Baynom','1950-07-26','Female',3),
    ('SYK7786','Silas','Lipgens','1961-11-19','Male',8),
    ('TWT8902','Bonny','Tremmil','1974-01-08','Female',10),
    ('WHL2345','Ardelia','Parmiter','1970-05-15','Female',9),
    ('WSU4675','Cirillo','Tuckwell','1969-12-24','Male',5),
    ('OBR6693','Emyle','Sokale','1979-08-24','Female',8),
    ('DPB3234','Daryl','Eastham','1978-01-26','Male',7),
    ('YSN6005','Clovis','Espadate','1987-01-07','Female',2),
    ('FDM8849','Rebekkah','Venes','2011-07-30','Female',5),
    ('FQI2958','Wilone','Tofanelli','2006-05-24','Female',9),
    ('AFC3291','Hetti','Joskowitz','1989-05-14','Female',7),
    ('OJC2233','Blinnie','Olivari','1969-10-05','Female',2),
    ('NPF7673','Rufe','Cardenoza','2004-10-17','Other',10),
    ('ISJ1177','Rad','MacKaig','1948-07-24','Male',7),
    ('GDR6737','Starlene','Letertre','2005-07-18','Female',1),
    ('STU8856','Aurelea','Cradoc','1963-07-17','Female',6),
    ('GKY3212','Delila','Ladbrooke','2006-08-19','Female',3),
    ('CLZ1078','Arabelle','Bourbo','1969-06-28','Female',9),
    ('PZD7227','Shellysheldo','Digges','1975-10-08','Male',10),
    ('CCB6831','Gilbert','Pattillo','1981-08-05','Male',3),
    ('IXF4149','Adena','Elliott','1952-08-17','Female',6),
    ('NIV5772','Horatia','Panto','1992-04-17','Female',1);





CREATE TABLE Referral (
    ReferralID INT PRIMARY KEY NOT NULL,
    ReferralDate DATE NOT NULL,
    PatientID VARCHAR(10) FOREIGN KEY REFERENCES Patient(PatientID) NOT NULL,
    HealthTargetEligible INT NOT NULL,
    DoctorID INT FOREIGN KEY REFERENCES Doctor(DoctorID) NOT NULL,
    SurgeonID INT FOREIGN KEY REFERENCES Surgeon(SurgeonID) NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES Department(DepartmentID) NOT NULL,
    FSADate DATE,
    AddedWaitlist DATE
);

INSERT INTO Referral VALUES
	(1,'2015-07-01','QDX4955','1',1,1,1,'2015-08-24','2015-07-03'),
    (2,'2015-07-02','ECP7715','1',2,2,2,'2015-09-30','2015-07-03'),
    (3,'2015-07-04','ZIK8925','1',3,3,2,'2015-07-24','2015-07-06'),
    (4,'2015-07-11','LTS6784','1',3,4,3,'2015-09-26','2015-07-13'),
    (5,'2015-07-13','HGM6173','1',1,5,3,'2015-10-03','2015-07-16'),
    (6,'2015-07-20','CEV6132','0',4,6,4,'2016-02-12','2015-07-23'),
	(7,'2015-08-03','PGJ7161','1',5,6,4,'2015-08-04','2015-08-04'),
    (8,'2015-08-15','NKX8076','1',2,3,2,'2015-08-23','2015-08-15'),
    (9,'2015-08-17','MXC8908','1',6,3,2,'2015-10-19','2015-08-18'),
    (10,'2015-08-18','NTQ8299','1',2,7,3,'2015-09-08','2015-08-20'),
    (11,'2015-09-01','QNE4372','1',7,8,5,'2015-10-21','2015-09-01'),
    (12,'2015-09-03','GIR5104','1',2,5,3,'2015-09-29','2015-09-04'),
	(13,'2015-09-04','PXKD2272','1',5,9,1,'2015-10-12','2015-09-04'),
    (14,'2015-09-03','DVX6602','1',5,10,5,'2015-10-14','2015-09-05'),
    (15,'2015-09-03','JIB5920','1',8,11,1,'2015-12-05','2015-09-05'),
    (16,'2015-09-06','YCX9278','1',5,10,5,'2015-11-05','2015-09-08'),
    (17,'2015-09-07','LMV5416','1',2,5,3,'2015-11-14','2015-09-09'),
    (19,'2015-10-02','TBC7855','1',9,12,4,'2015-10-09','2015-10-04'),
    (20,'2015-10-05','SXL9274','1',10,13,2,'2015-12-31','2015-10-06'),
    (21,'2015-10-14','AUX6004','1',4,7,3,'2015-12-20','2015-10-17'),
    (22,'2015-10-16','SEO7156','1',5,14,5,'2015-10-26','2015-10-18'),
    (23,'2015-10-23','XUA5670','1',7,5,3,'2015-12-05','2015-10-25'),
    (24,'2015-10-24','GMC9989','1',9,8,5,'2016-10-16','2015-10-25'),
    (25,'2015-11-08','SHN9256','1',1,11,1,'2016-01-03','2015-11-08'),
    (26,'2015-11-09','XSI7349','1',9,10,5,'2016-02-08','2015-11-11'),
    (27,'2015-11-10','NHK9888','1',6,8,5,'2016-01-06','2015-11-12'),
    (28,'2015-11-15','NCR0550','1',1,12,4,'2015-12-12','2015-11-15'),
    (29,'2015-11-17','CNF6489','1',9,1,1,'2016-01-20','2015-11-18'),
    (30,'2015-11-17','MSC5721','1',8,11,1,'2015-12-31','2015-11-20'),
    (31,'2015-11-25','VWH6907','1',9,1,1,'2016-02-21','2015-11-28'),
    (32,'2015-12-02','GOZ3094','1',1,9,1,'2016-01-18','2015-12-03'),
    (33,'2015-12-05','CMZ6415','1',7,10,5,NULL,'2015-12-06'),
    (34,'2015-12-05','TNH6480','1',6,10,5,'2016-02-25','2015-12-07'),
    (35,'2015-12-08','QIJ3412','1',9,5,3,'2016-02-18','2015-12-08'),
    (37,'2016-01-02','CBD3031','1',2,5,3,'2016-02-09','2016-01-02'),
    (38,'2016-01-03','BBB5629','1',5,15,4,'2016-02-02','2016-01-03'),
    (39,'2015-12-31','PSYK7786','1',10,2,2,'2016-02-11','2016-01-03'),
    (40,'2016-01-04','ODR2838','1',4,2,2,'2016-02-27','2016-01-06'),
    (41,'2016-01-06','KDD9523','1',6,9,1,'2016-02-29','2016-01-08'),
    (42,'2016-01-12','ASD4088','1',5,13,2,NULL,'2016-01-14'),
    (43,'2016-01-22','GIQ8970','1',3,11,1,'2016-03-23','2016-01-23'),
    (44,'2016-01-24','GEK5713','1',1,8,5,'2016-03-05','2016-01-27'),
    (45,'2016-02-02','TGS0798','1',4,7,3,'2016-03-09','2016-02-03'),
    (46,'2016-02-01','CYC0720','1',7,13,2,'2016-03-22','2016-02-04'),
    (47,'2016-02-05','SMH8891','1',7,2,2,'2016-03-16','2016-02-07'),
    (48,'2016-02-07','FBG1062','1',8,2,2,'2016-02-10','2016-02-08'),
    (49,'2016-02-14','XKX1957','1',1,8,5,'2016-09-06','2016-02-15'),
    (50,'2016-02-20','AFH7245','1',5,3,2,'2016-04-25','2016-02-21'),
    (51,'2016-02-24','TXP4069','1',7,10,5,'2016-03-16','2016-02-24'),
    (52,'2016-02-21','MRL3058','1',9,3,2,'2016-05-16','2016-02-24'),
    (53,'2016-02-24','FVL8648','1',4,9,1,'2016-05-07','2016-02-25'),
    (54,'2016-02-26','PGKY3212','0',1,7,3,'2016-09-03','2016-02-27'),
    (55,'2016-03-05','ETV6899','1',7,9,1,'2016-03-28','2016-03-08'),
    (56,'2016-03-09','XKD2272','1',3,5,3,'2016-05-29','2016-03-09'),
    (57,'2016-03-08','VFY9388','1',6,6,4,'2016-05-08','2016-03-11'),
    (58,'2016-03-20','JBK3991','1',5,12,4,'2016-03-21','2016-03-21'),
    (59,'2016-03-20','ZYF6173','1',5,3,2,'2016-05-16','2016-03-21'),
    (60,'2016-03-25','VSV3481','1',6,2,2,'2016-04-12','2016-03-28'),
    (61,'2016-03-28','MHR6896','1',6,2,2,'2016-04-16','2016-03-28'),
    (62,'2016-03-26','YDV0095','1',3,6,4,'2016-05-12','2016-03-29'),
    (63,'2016-03-28','BDF4913','1',7,9,1,'2016-05-18','2016-03-30'),
    (64,'2016-03-29','IWU6403','1',10,14,5,'2016-05-15','2016-04-01'),
    (65,'2016-04-04','BVF7686','1',4,14,5,'2016-06-02','2016-04-05'),
    (66,'2016-04-09','RIQ9260','1',9,15,4,'2016-06-10','2016-04-09'),
    (67,'2016-04-12','MMH2864','1',6,13,2,'2016-07-08','2016-04-15'),
    (68,'2016-04-16','RWT4192','1',3,4,3,'2016-04-26','2016-04-18'),
    (69,'2016-04-18','CYZ8554','1',8,1,1,'2016-06-30','2016-04-19'),
    (70,'2016-04-18','YBS8538','1',7,4,3,'2016-05-09','2016-04-20'),
    (71,'2016-04-19','VZQ5362','1',7,13,2,'2016-06-14','2016-04-20'),
    (72,'2016-04-18','CST7448','1',9,2,2,'2016-07-01','2016-04-20'),
    (73,'2016-04-20','NWM8466','1',9,14,5,'2016-07-17','2016-04-22'),
    (74,'2016-04-22','LQI3268','1',10,11,1,NULL,'2016-04-25'),
    (75,'2016-04-26','LFV3925','1',7,3,2,'2016-06-14','2016-04-27'),
    (76,'2016-04-28','WHU5837','1',6,2,2,'2016-07-08','2016-04-29'),
    (77,'2016-05-04','ABR7945','1',9,2,2,'2016-06-04','2016-05-04'),
    (78,'2016-05-02','PLL2090','1',3,12,4,'2016-06-24','2016-05-05'),
    (80,'2016-05-23','SYK7786','1',8,15,4,'2016-08-24','2016-05-24'),
    (81,'2016-05-26','TWT8902','1',10,9,1,'2016-07-12','2016-05-27'),
    (82,'2016-06-04','WHL2345','1',9,6,4,'2016-06-09','2016-06-07'),
    (83,'2016-06-15','WSU4675','1',5,2,2,NULL,'2016-06-17'),
    (84,'2016-06-16','OBR6693','1',8,7,3,'2016-08-26','2016-06-17'),
    (85,'2016-06-18','DPB3234','1',7,9,1,'2016-07-23','2016-06-20'),
    (86,'2016-06-19','YSN6005','1',2,15,4,'2016-09-02','2016-06-22'),
    (87,'2016-06-23','FDM8849','1',5,10,5,'2016-09-02','2016-06-23'),
    (88,'2016-06-22','FQI2958','1',9,8,5,'2016-07-17','2016-06-24'),
    (89,'2016-06-25','AFC3291','1',7,13,2,'2016-07-16','2016-06-27'),
    (90,'2016-07-07','OJC2233','1',2,13,2,'2016-09-22','2016-07-07'),
    (91,'2016-07-14','NPF7673','1',10,14,5,NULL,'2016-07-17'),
    (92,'2016-07-15','ISJ1177','1',7,11,1,'2016-09-02','2016-07-17'),
    (93,'2016-07-19','GDR6737','1',1,14,5,'2016-10-17','2016-07-20'),
    (94,'2016-07-21','STU8856','1',6,13,2,'2016-07-23','2016-07-23'),
    (95,'2016-07-21','GKY3212','1',3,10,5,'2016-10-16','2016-07-24'),
    (96,'2016-07-23','CLZ1078','1',9,1,1,'2016-09-23','2016-07-26'),
    (97,'2016-07-27','PZD7227','1',10,2,2,NULL,'2016-07-27'),
    (98,'2016-08-10','CCB6831','1',3,12,4,'2016-08-24','2016-08-10'),
    (99,'2016-08-09','IXF4149','1',6,11,1,'2016-09-23','2016-08-12'),
    (100,'2016-08-11','NIV5772','1',1,12,4,'2016-10-02','2016-08-13');