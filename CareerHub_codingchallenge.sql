-- Coding Challenges: CareerHub, The Job Board              

--1 Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”.

CREATE DATABASE CareerHub;
USE CareerHub;

--2. Create tables for Companies, Jobs, Applicants and Applications.

-- Create Companies table
CREATE TABLE Companies (
CompanyID INT PRIMARY KEY,
CompanyName VARCHAR(255),
Location VARCHAR(255)
);

-- Create Jobs table
CREATE TABLE Jobs (
JobID INT PRIMARY KEY,
CompanyID INT,
JobTitle VARCHAR(255),
JobDescription TEXT,
JobLocation VARCHAR(255),
Salary DECIMAL,
JobType VARCHAR(255),
PostedDate DATETIME,
);

-- Create Applicants table
CREATE TABLE Applicants (
ApplicantID INT PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255),
Email VARCHAR(255),
Phone VARCHAR(20),
Resume TEXT
);

-- Create Applications table
CREATE TABLE Applications (
ApplicationID INT PRIMARY KEY,
JobID INT,
ApplicantID INT,
ApplicationDate DATETIME,
CoverLetter TEXT,
);

--3. Define appropriate primary keys, foreign keys, and constraints. 

-- Add foreign key to Jobs table
ALTER TABLE Jobs
ADD CONSTRAINT FK_CompanyID FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID);

-- Add foreign key to Applications table 
ALTER TABLE Applications
ADD CONSTRAINT FK_JobID FOREIGN KEY (JobID) REFERENCES Jobs(JobID);

-- Add foreign key to Applications table
ALTER TABLE Applications
ADD CONSTRAINT FK_ApplicantID FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID);

--4.Inserting data into tables

INSERT INTO Companies (CompanyID, CompanyName, Location) VALUES
(1, 'Tech Solutions Inc.', 'San Francisco'),
(2, 'Data Innovators Ltd.', 'New York'),
(3, 'Creative Designs Co.', 'Los Angeles'),
(4, 'DataMasters India', 'Chennai'),
(5, 'SmartSys Technologies', 'Pune'),
(6, 'SoftwareSolutions Ltd', 'Delhi'),
(7, 'Sutherland Systems India', 'Bangalore'),
(8, 'KaarTech Innovations', 'Ahmedabad'),
(9, 'EduTech Solutions', 'Mumbai'),
(10, 'HealthTech Systems', 'Chandigarh');

INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)  VALUES
(1, 1, 'Software Engineer', 'Develop and maintain software applications.', 'San Francisco', 80000.00, 'Full-time', '2023-01-01 08:00:00'),
(2, 2, 'Marketing Specialist', 'Create and execute marketing campaigns.', 'New York', 75000.00, 'Part-time', '2023-02-02 09:30:00'),
(3, 3, 'Research Scientist', 'Conduct scientific research and experiments.', 'Los Angeles', 60000.00, 'Full-time', '2023-01-03 10:45:00'),
(4, 4, 'Front-end Developer', 'Design and implement user interfaces.', 'Chennai', 85000.00, 'Contract', '2023-01-04 11:15:00'),
(5, 5, 'Data Analyst', 'Analyze and interpret complex data sets.', 'Pune', 95000.00, 'Full-time', '2023-04-05 12:00:00'),
(6, 6, 'Product Manager', 'Oversee product development and strategy.', 'Delhi', 110000.00, 'Full-time', '2023-05-06 13:20:00'),
(7, 7, 'Software Tester', 'Test software applications for quality assurance.', 'Bangalore', 80000.00, 'Contract', '2023-03-07 14:45:00'),
(8, 8, 'IT Support Specialist', 'Provide technical support to end-users.', 'Ahmedabad', 70000.00, 'Full-time', '2023-01-08 15:30:00'),
(9, 9, 'HR Manager', 'Manage human resources activities and policies.', 'Mumbai', 50000.00, 'Full-time', '2023-08-09 16:10:00'),
(10, 10, 'Business Analyst', 'Analyze business processes and recommend improvements.', 'Chandigarh', 90000.00, 'Part-time', '2023-06-10 17:00:00');

INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resume) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '888-555-1234', 'JohnDoe_Resume'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '751-555-5678', 'JaneSmith_Resume'),
(3, 'Michael', 'Johnson', 'michael.johnson@email.com', '920-234-5678', 'MichaelJohnson_Resume'),
(4, 'Anna', 'Müller', 'anna.mueller@email.com', '630-876-5432', 'AnnaMueller_Resume'),
(5, 'Takashi', 'Sato', 'takashi.sato@email.com', '813-234-5678', 'TakashiSato_Resume'),
(6, 'Emily', 'Jones', 'emily.jones@email.com', '612-876-4321', 'EmilyJones_Resume'),
(7, 'David', 'Lee', 'david.lee@email.com', '416-555-7890', 'DavidLee_Resume'),
(8, 'Sophie', 'Cheng', 'sophie.cheng@email.com', '659-123-4567', 'SophieCheng_Resume'),
(9, 'Riyas', 'Malik', 'riyas.malik@email.com', '331-345-6789', 'PierreDubois_Resume'),
(10, 'Faisal', 'Ahmed', 'faisal.ahmed@email.com', '971-502-0567', 'FaisalAhmed_Resume');

INSERT INTO Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter) VALUES
(1, 1, 1, '2023-02-01 08:30:00', 'I am excited about the opportunity to contribute to the software development team.'),
(2, 2, 2, '2023-02-02 09:45:00', 'I have a passion for marketing and a proven track record of success.'),
(3, 3, 3, '2023-02-03 10:00:00', 'My background in research and science makes me a strong fit for this role.'),
(4, 4, 4, '2023-02-04 11:30:00', 'I have extensive experience in front-end development and UI design.'),
(5, 5, 5, '2023-02-05 12:15:00', 'I am skilled in data analysis and have a keen eye for detail.'),
(6, 6, 6, '2023-02-06 13:40:00', 'As a seasoned product manager, I can drive product success and innovation.'),
(7, 7, 7, '2023-02-07 14:55:00', 'I am thorough and detail-oriented in software testing.'),
(8, 8, 8, '2023-02-08 15:45:00', 'I have a strong technical background and excellent problem-solving skills.'),
(9, 9, 9, '2023-02-09 16:20:00', 'I am an experienced HR professional with a focus on employee engagement.'),
(10, 10, 10, '2023-02-10 17:15:00', 'I bring analytical skills and a strategic mindset to business analysis.');

/* 5.Write an SQL query to count the number of applications received for each job listing in the
"Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all
jobs, even if they have no applications */

SELECT J.JobTitle, COUNT(AP.ApplicationID) AS ApplicationCount
FROM Jobs J
LEFT JOIN Applications AP ON J.JobID = AP.JobID
GROUP BY J.JobTitle;

/*6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary
range. Allow parameters for the minimum and maximum salary values. Display the job title,
company name, location, and salary for each matching job.*/

DECLARE @MinSalary DECIMAL = 50000.00; 
DECLARE @MaxSalary DECIMAL = 100000.00; 

SELECT J.JobTitle, C.CompanyName, J.JobLocation, J.Salary
FROM Jobs J
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE J.Salary BETWEEN @MinSalary AND @MaxSalary;


/*7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a
parameter for the ApplicantID, and return a result set with the job titles, company names, and
application dates for all the jobs the applicant has applied to.*/

DECLARE @ApplicantID INT = 2; 

SELECT J.JobTitle, C.CompanyName, AP.ApplicationDate
FROM Applications AP
JOIN Jobs J ON AP.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE AP.ApplicantID = @ApplicantID;

/*8. Create an SQL query that calculates and displays the average salary offered by all companies for
job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.*/

SELECT AVG(Salary) AS AverageSalary
FROM Jobs
WHERE Salary IS NOT NULL;

/*9. Write an SQL query to identify the company that has posted the most job listings. Display the
company name along with the count of job listings they have posted. Handle ties if multiple
companies have the same maximum count.*/
update Jobs set CompanyID=9
where JobID=2
select * from Jobs

SELECT TOP 1 C.CompanyName, COUNT(J.JobID) AS JobCount
FROM Companies C
LEFT JOIN Jobs J 
ON C.CompanyID = J.CompanyID
GROUP BY C.CompanyName
ORDER BY JobCount DESC;

/*10. Find the applicants who have applied for positions in companies located in 'CityX' and have at
least 3 years of experience.*/

--Adding Experience coulumn
ALTER TABLE Applicants
ADD Experience INT;

UPDATE Applicants SET Experience = 2 WHERE ApplicantID = 1;
UPDATE Applicants SET Experience = 3 WHERE ApplicantID = 2;
UPDATE Applicants SET Experience = 5 WHERE ApplicantID = 3;
UPDATE Applicants SET Experience = 3 WHERE ApplicantID = 4;
UPDATE Applicants SET Experience = 2 WHERE ApplicantID = 5;
UPDATE Applicants SET Experience = 2 WHERE ApplicantID = 6;
UPDATE Applicants SET Experience = 4 WHERE ApplicantID = 7;
UPDATE Applicants SET Experience = 3 WHERE ApplicantID = 8;
UPDATE Applicants SET Experience = 2 WHERE ApplicantID = 9;
UPDATE Applicants SET Experience = 5 WHERE ApplicantID = 10;

SELECT * FROM Applicants

SELECT  A.FirstName,A.LastName,A.Experience FROM Applicants A
JOIN Applications App ON A.ApplicantID = App.ApplicantID
JOIN Jobs J ON App.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE C.Location = 'Chennai' AND A.Experience >= 3;

-- 11.Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.

SELECT DISTINCT JobTitle, Salary
FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;

-- 12. Find the jobs that have not received any applications

update Applications set JobID=2
where ApplicantID=10
select * from Applications

SELECT J.*
FROM Jobs J
LEFT JOIN Applications A ON J.JobID = A.JobID
WHERE A.ApplicationID IS NULL;


/* 13. Retrieve a list of job applicants along with the companies they have applied to and the positions
they have applied for. */

SELECT A.*, C.CompanyName, J.JobTitle
FROM Applicants A
JOIN Applications App ON A.ApplicantID = App.ApplicantID
JOIN Jobs J ON App.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID;

/* 14 . Retrieve a list of companies along with the count of jobs they have posted, even if they have not
received any applications */

SELECT C.CompanyID,C.CompanyName, COUNT(J.JobID) AS JobCount
FROM Companies C
LEFT JOIN Jobs J ON C.CompanyID = J.CompanyID
GROUP BY C.CompanyID, C.CompanyName;

/* 15 List all applicants along with the companies and positions they have applied for, including those
who have not applied */

SELECT A.* ,C.CompanyName ,J.JobTitle
FROM Applicants A
LEFT JOIN Applications AP ON A.ApplicantID=AP.ApplicantID
LEFT JOIN Jobs J ON AP.JobID =J.JobID
LEFT JOIN Companies C ON J.CompanyID = C.CompanyID;

--16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.

SELECT DISTINCT C.CompanyName
FROM Companies C
JOIN Jobs J ON C.CompanyID = J.CompanyID
WHERE J.Salary > (SELECT AVG(Salary) FROM Jobs);

/*17. Display a list of applicants with their names and a concatenated string of their city and state.*/

--Adding city and state column in table
ALTER TABLE Applicants
ADD City VARCHAR(255),State VARCHAR(255);

UPDATE Applicants SET City = 'Siyaz', State = 'AndraPradhesh' WHERE ApplicantID = 10;
UPDATE Applicants SET City = 'Palakaddu', State = 'Kerala' WHERE ApplicantID = 2;
UPDATE Applicants SET City = 'Chennai', State = 'Tamilnadu' WHERE ApplicantID = 3;
UPDATE Applicants SET City = 'Coimbatore', State = 'Tamilnadu' WHERE ApplicantID = 4;
UPDATE Applicants SET City = 'Kattivada', State = 'Mumbai' WHERE ApplicantID = 5;
UPDATE Applicants SET City = 'Palladam', State = 'AndraPradhesh' WHERE ApplicantID = 6;
UPDATE Applicants SET City = 'Alapula', State = 'Kerala' WHERE ApplicantID = 7;
UPDATE Applicants SET City = 'Vellang', State = 'Karnataka' WHERE ApplicantID = 8;
UPDATE Applicants SET City = 'Ayanad', State = 'Mumbai' WHERE ApplicantID = 9;
UPDATE Applicants SET City = 'Vantez', State = 'San Franciso' WHERE ApplicantID = 1;

SELECT * FROM Applicants

SELECT ApplicantID, FirstName, LastName, CONCAT(City, ', ', State) AS Location
FROM Applicants;

--18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.

SELECT *
FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';

/* 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not
applied and jobs without applicants. */

SELECT A.FirstName, A.LastName, J.JobTitle
FROM Applicants A
LEFT JOIN Applications AP ON A.ApplicantID = AP.ApplicantID
LEFT JOIN Jobs J ON AP.JobID = J.JobID;

/*20. List all combinations of applicants and companies where the company is in a specific city and the
applicant has more than 2 years of experience. For example: city=Chennai */

SELECT A.ApplicantID, A.FirstName, A.LastName, A.Email, C.CompanyID, C.CompanyName, C.Location 
FROM Applicants A
CROSS JOIN Companies C
WHERE C.Location = 'Chennai' AND A.Experience > 2;




