-- Create Database
Create Database EmployeeRecords;

Use EmployeeRecords;
-- Create the Employee table
CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    SSN CHAR(11) UNIQUE NOT NULL,
    DOB DATE NOT NULL,
    Address NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(50),
    Zip CHAR(10),
    Phone NVARCHAR(15),
    JoinDate DATE NOT NULL,
    ExitDate DATE
);

-- Create the EmployeeSalary table
CREATE TABLE EmployeeSalary (
    SalaryID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL,
    FromDate DATE NOT NULL,
    ToDate DATE,
    Title NVARCHAR(100),
    Salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Reset IDENTITY Seed
DBCC CHECKIDENT ('Employee', RESEED, 1);
DBCC CHECKIDENT ('EmployeeSalary', RESEED, 1);

-- Insert 100 Sample Records into Employee Table
DECLARE @Counter INT = 1;

-- Prepare List of Names
DECLARE @Names TABLE (ID INT IDENTITY(1,1), Name NVARCHAR(100));
INSERT INTO @Names (Name) VALUES
    ('John Doe'), ('Jane Smith'), ('Michael Brown'), ('Emily Davis'), ('David Wilson'),
    ('Sarah Johnson'), ('James Moore'), ('Olivia Taylor'), ('Daniel White'), ('Sophia Harris'),
    ('Matthew Clark'), ('Amelia Lewis'), ('Christopher Hall'), ('Isabella Young'), ('Andrew King'),
    ('Abigail Lee'), ('Joseph Scott'), ('Mia Walker'), ('Samuel Wright'), ('Charlotte Green'),
    ('Alexander Adams'), ('Ella Carter'), ('Ryan Baker'), ('Grace Phillips'), ('Benjamin Turner'),
    ('Lily Mitchell'), ('William Perez'), ('Zoe Roberts'), ('Henry Campbell'), ('Aria Evans'),
    ('Jacob Murphy'), ('Scarlett Ward'), ('Lucas Bell'), ('Chloe Sanders'), ('Ethan Parker'),
    ('Nora Price'), ('Mason Jenkins'), ('Ava Coleman'), ('Logan Bailey'), ('Harper Brooks'),
    ('Jackson Fisher'), ('Layla Rivera'), ('Sebastian Kelly'), ('Victoria Reed'), ('Aiden Howard'),
    ('Hannah Cooper'), ('Caleb Cox'), ('Penelope Morgan'), ('Elijah Richardson'), ('Stella Diaz'),
    ('Liam Martinez'), ('Eleanor Simmons'), ('Nathan Rogers'), ('Zoey Peterson'), ('Dylan Gray'),
    ('Camila Foster'), ('Levi Bailey'), ('Violet Perry'), ('Owen Cook'), ('Aurora Powell'),
    ('Connor Butler'), ('Lucy Long'), ('Julian Bryant'), ('Naomi Hayes'), ('Aaron Hughes'),
    ('Eva Foster'), ('Gabriel Hayes'), ('Clara Coleman'), ('Carter Richardson'), ('Lillian Ward'),
    ('Wyatt Simmons'), ('Addison Morgan'), ('Isaac Ross'), ('Brooklyn Howard'), ('Anthony Price'),
    ('Savannah Barnes'), ('Jayden Torres'), ('Bella Bennett'), ('Grayson Watson'), ('Samantha Cook'),
    ('Christian Perez'), ('Victoria Rogers'), ('Hunter Kelly'), ('Layla Brooks'), ('Jonathan Diaz'),
    ('Avery Bailey'), ('Charles Jenkins'), ('Hazel Martinez'), ('Nicholas Sanders'), ('Ellie Gray'),
    ('Thomas Evans'), ('Madison Turner'), ('Evan Powell'), ('Kinsley Rivera'), ('Robert Bennett'),
    ('Isla Peterson'), ('Dominic Rogers'), ('Aubrey Bell'), ('Kevin Cox'), ('Peyton Price');

-- Insert Employees with Random DOB and Join Date
WHILE @Counter <= 100
BEGIN
    -- Generate a Random DOB Ensuring Age Between 20 and 50
    DECLARE @MinDOB DATE = DATEADD(YEAR, -50, GETDATE()); -- 50 years ago
    DECLARE @MaxDOB DATE = DATEADD(YEAR, -20, GETDATE()); -- 20 years ago
    DECLARE @RandomDOB DATE = DATEADD(DAY, 
        CAST((DATEDIFF(DAY, @MinDOB, @MaxDOB) * RAND()) AS INT), 
        @MinDOB);

    -- Generate a Random Join Date Ensuring Between 1 and 10 Years Ago
    DECLARE @MinJoinDate DATE = DATEADD(YEAR, -10, GETDATE()); -- 10 years ago
    DECLARE @MaxJoinDate DATE = DATEADD(YEAR, -1, GETDATE());  -- 1 year ago
    DECLARE @RandomJoinDate DATE = DATEADD(DAY, 
        CAST((DATEDIFF(DAY, @MinJoinDate, @MaxJoinDate) * RAND()) AS INT), 
        @MinJoinDate);

    -- Insert into Employee Table
    INSERT INTO Employee (Name, SSN, DOB, Address, City, State, Zip, Phone, JoinDate, ExitDate)
    SELECT Name,
           RIGHT('10000' + CAST(1000 + @Counter AS NVARCHAR), 11),
           @RandomDOB,
           CONCAT('Street ', @Counter),
           'City' + CAST(@Counter AS NVARCHAR),
           'State' + CAST((@Counter % 50) + 1 AS NVARCHAR),
           RIGHT('45000' + CAST(1000 + @Counter AS NVARCHAR), 5),
           CONCAT('734', FORMAT(@Counter, '0000000')),
           @RandomJoinDate,
           CASE WHEN RAND() > 0.8 THEN DATEADD(DAY, RAND() * 365, GETDATE()) ELSE NULL END
    FROM @Names
    WHERE ID = @Counter;

    SET @Counter = @Counter + 1;
END

-- Insert Salary Records Based on Age Group
SET @Counter = 1;

WHILE @Counter <= (SELECT MAX(EmployeeID) FROM Employee)
BEGIN
    -- Retrieve DOB and JoinDate for the Current Employee
    DECLARE @DOB DATE = (SELECT DOB FROM Employee WHERE EmployeeID = @Counter);
    DECLARE @JoinDate DATE = (SELECT JoinDate FROM Employee WHERE EmployeeID = @Counter);
    DECLARE @Age INT = DATEDIFF(YEAR, @DOB, GETDATE());

    -- Assign Job Title Based on Age
    DECLARE @JobTitle NVARCHAR(50);
    DECLARE @BaseSalary DECIMAL(10,2);

    -- Assign Title and Salary Based on Age Range
    IF @Age BETWEEN 20 AND 30 
    BEGIN
        SET @JobTitle = 'Developer';
        SET @BaseSalary = 50000 + (RAND() * 20000); -- Salary: 50,000 to 70,000
    END
    ELSE IF @Age BETWEEN 31 AND 40 
    BEGIN
        SET @JobTitle = 'Senior Developer';
        SET @BaseSalary = 70000 + (RAND() * 20000); -- Salary: 70,000 to 90,000
    END
    ELSE IF @Age BETWEEN 41 AND 50 
    BEGIN
        SET @JobTitle = 'Manager';
        SET @BaseSalary = 90000 + (RAND() * 30000); -- Salary: 90,000 to 120,000
    END

    -- Insert into EmployeeSalary Table
    INSERT INTO EmployeeSalary (EmployeeID, FromDate, ToDate, Title, Salary)
    VALUES (@Counter, @JoinDate, NULL, @JobTitle, @BaseSalary);

    SET @Counter = @Counter + 1;
END;
