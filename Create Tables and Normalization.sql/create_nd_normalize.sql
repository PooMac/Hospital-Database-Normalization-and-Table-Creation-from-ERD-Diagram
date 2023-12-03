CREATE DATABASE Hospital2;
USE Hospital2;

-- 1NF - Done (City)
-- 2NF - Done
-- 3NF - Done
CREATE TABLE Insurance_Company(
    Company_Name VARCHAR(100),
    Telephone VARCHAR(20),
    Street VARCHAR(100),
    Zip VARCHAR(10),
    [State] VARCHAR(100),
    CONSTRAINT PK_Insurance_company PRIMARY KEY (Company_Name)
);

-- 1NF - Done(Patient_Name, Address)
-- 2NF - Done
-- 3NF - Done
CREATE TABLE Patient(
    Patient_Number INT,
    Patient_Fname VARCHAR(100),
    Patient_Lname VARCHAR(100),
    Age INT,
    Street VARCHAR(100),
    Zip VARCHAR(10),
    City VARCHAR(100),
    [State] VARCHAR(100),
    CONSTRAINT PK_Patient PRIMARY KEY (Patient_Number)
);

-- 1NF - Done
-- 2NF - Done
-- 3NF - Done
CREATE TABLE Claim(
    Claim_Number INT,
    Company_Name VARCHAR(100),
    Patient_Number INT,
    Diagnosis VARCHAR(100),
    Amount INT
    CONSTRAINT PK_Claim PRIMARY KEY (Claim_Number),
    CONSTRAINT FK_Insurance FOREIGN KEY (Company_Name) REFERENCES Insurance_Company(Company_Name),
    CONSTRAINT FK_Patient FOREIGN KEY (Patient_Number) REFERENCES Patient(Patient_Number)
);

-- 1NF - Done
-- 2NF - Done
-- 3NF - Done
CREATE TABLE Department(
    Department_Number INT,
    Office_Number INT,
    Telephone VARCHAR(20),
    CONSTRAINT PK_Department PRIMARY KEY (Department_Number)
);

-- 1NF - Done(Nurse_Name)
-- 2NF - Done
-- 3NF - Done
CREATE TABLE Nurse(
    Nurse_Number INT,
    Nurse_Fname VARCHAR(100),
    Nurse_Lname VARCHAR(100),
    Certification VARCHAR(50),
    Year_Hired INT,
    Nurse_Num INT,
    Department_Number INT,
    CONSTRAINT PK_Nurse PRIMARY KEY (Nurse_Number),
    CONSTRAINT FK_Department FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number),
    CONSTRAINT FK_Nurse FOREIGN KEY (Nurse_Num) REFERENCES Nurse(Nurse_Number)
);


-- 1NF - Done(Doctor_Name)
-- 2NF - Done
-- 3NF - Done
CREATE TABLE Doctor(
    Doctor_Number INT,
    Doctor_Fname VARCHAR(100),
    Doctor_Lname VARCHAR(100),
    Telephone VARCHAR(20),
    Department_Number INT,
    Doctor_Num INT,
    CONSTRAINT PK_Doctor PRIMARY KEY (Doctor_Number),
    CONSTRAINT FK_DEPARTMENT_Doc FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number),
    CONSTRAINT FK_Doctor FOREIGN KEY (Doctor_Num) REFERENCES Doctor(Doctor_Number)
);

-- 1NF - Done
-- 2NF - Done
-- 3NF - Done
CREATE TABLE Degree(
    Doctor_Number INT,
    Degree_Type VARCHAR(20),
    Major VARCHAR(50),
    University VARCHAR(100),
    [Year] INT,
    CONSTRAINT PK_Degree PRIMARY KEY (Doctor_Number, Degree_Type),
    CONSTRAINT FK_Doctor_Deg FOREIGN KEY (Doctor_Number) REFERENCES Doctor(Doctor_Number)
);

-- 1NF - Done
-- 2NF - Done
-- 3NF - Done
CREATE TABLE Operation_Type(
    Operation_Name VARCHAR(20),
    Duration INT,
    Cost INT,
    CONSTRAINT PK_Operation_Type PRIMARY KEY (Operation_Name)
);


-- 1NF - Done
-- 2NF - Done
-- 3NF - Done
CREATE TABLE Operation(
    Patient_Number INT,
    Doctor_Number INT,
    Operation_Name VARCHAR(20),
    [Date] DATE, 
    Start_Time DATETIME,
    End_Time DATETIME,
    Operating_Room_No INT,
    CONSTRAINT PK_Operation PRIMARY KEY (Patient_Number, Doctor_Number, Operation_Name,[Date]),
    CONSTRAINT FK_Doctor_Op FOREIGN KEY (Doctor_Number) REFERENCES Doctor(Doctor_Number),
    CONSTRAINT FK_Patient_Op FOREIGN KEY (Patient_Number) REFERENCES Patient(Patient_Number),
    CONSTRAINT FK_Operation_Op FOREIGN KEY (Operation_Name) REFERENCES Operation_Type(Operation_Name)
);
