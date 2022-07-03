CREATE DATABASE ManagemetEmployees
USE ManagemetEmployees


CREATE TABLE DEPARTMENT (
Dname varchar(10) NOT NULL,
Dnumber int PRIMARY KEY NOT NULL,
Mgr_ssn varchar(10) NOT NULL,
Mgr_start_date date,
UNIQUE (Dname)
);
INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES('Production','4', '943775543', '2007-10-01')
INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES('Sales','1', '943778843', '1999-04-03')
INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES('Marketing','8', '94995543', '2000-09-02')
INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES('Softwave','9', '943775555', '2015-10-03')
INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES('Infomation','7', '943775577', '2013-10-03')
INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES('Research','2', '943775566', '2012-10-03')
INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES('Infomation','6', '943774477', '2013-09-03')
INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES('Research','4', '943770066', '2010-11-01')





CREATE TABLE EMPLOYEE
(
 Fname varchar(15) NOT NULL,
 Minit varchar(1),
 Lname varchar(15)NOT NULL,
 Ssn varchar(10) PRIMARY KEY,
 Bdate date,
 Address varchar(24),
 Sex char,
 Salary decimal(10,2),
 Super_ssn varchar(10) foreign key (Super_ssn) REFERENCES EMPLOYEE (Ssn),
 Dno int foreign key (Dno) REFERENCES DEPARTMENT (Dnumber)
)
INSERT INTO EMPLOYEE (Fname, Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
			VALUES('Robert','F','Scott','943775543','1972-06-21','Ho Chi Minh','M','58000.00',NULL,'8')
INSERT INTO EMPLOYEE (Fname, Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
			VALUES('Tâm','T','Hoang','911668842','2001-06-21','Phu Quoc','M','10000.00',NULL,'9')
INSERT INTO EMPLOYEE (Fname, Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
			VALUES('An','T','Ho','943775577','2000-07-22','Ha Noi','M','70000.00',NULL,'7')
INSERT INTO EMPLOYEE (Fname, Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
			VALUES('Thanh','V','Vo','943775566','2000-07-22','Da Nang','M','70000.00',NULL,'2')
INSERT INTO EMPLOYEE (Fname, Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
			VALUES('Thinh','P','Dao','943774477','1999-04-22','Long An','M','40000.00',NULL,'7')
			INSERT INTO EMPLOYEE (Fname, Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
			VALUES('Duc','C','Chinh','943770066','1995-05-12','Hai Phong','M','50000.00',NULL,'2')
			
CREATE TABLE PROJECT
(
Pname varchar(25) NOT NULL,
Pnumber int PRIMARY KEY,
Plocation varchar(14),
UNIQUE(Pname),
Dnum  int foreign key (Dnum) REFERENCES DEPARTMENT (Dnumber)
)
INSERT INTO PROJECT(Pname,Pnumber,Plocation,Dnum) VALUES ('Product A','1','Bellaire','1')
INSERT INTO PROJECT(Pname,Pnumber,Plocation,Dnum) VALUES ('Product B','3','lonDon','1')
INSERT INTO PROJECT(Pname,Pnumber,Plocation,Dnum) VALUES ('Product C','6','VietNam','1')
INSERT INTO PROJECT(Pname,Pnumber,Plocation,Dnum) VALUES ('Product D','8','lonDon','1')
INSERT INTO PROJECT(Pname,Pnumber,Plocation,Dnum) VALUES ('Product E','9','Japan','1')
INSERT INTO PROJECT(Pname,Pnumber,Plocation,Dnum) VALUES ('Product F','10','Korea','1')


CREATE TABLE WORKS_ON (
  Essn   varchar(10),
  Pno    int,
  Hours  decimal(4,1),
  primary key (Essn,Pno),
  foreign key (Essn) references EMPLOYEE(Ssn),
  foreign key (Pno) references PROJECT(Pnumber)
)
INSERT INTO WORKS_ON(Essn,Pno,Hours) VALUES('943775543', '3', '40.0') 

INSERT INTO WORKS_ON(Essn,Pno,Hours) VALUES('911668842', '3', '10.0') 

INSERT INTO WORKS_ON(Essn,Pno,Hours) VALUES('943775577', '3', '20.0') 

INSERT INTO WORKS_ON(Essn,Pno,Hours) VALUES('943770066', '3', '40.0') 


create table [DEPENDENT](
	Essn varchar (10) foreign key (Essn) references EMPLOYEE(Ssn),
	Dependent_name varchar(30) primary key,
	Sex varchar(5),
	Bdate date,
	Relationship varchar (30)
) 
SELECT * FROM DEPENDENT
				INSERT INTO DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship) 
				VALUES('943775543', 'John', 'M', '1990-12-12', 'spouse')
				INSERT INTO DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship) 
				VALUES('911668842', 'Jon', 'M', '1998-2-15', 'Hour')
				INSERT INTO DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship) 
				VALUES('943775577', 'Kita', 'F', '2001-1-12', 'cat')
				INSERT INTO DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship) 
				VALUES('943770066', 'Jany', 'M', '1999-12-12', 'tom')

CREATE TABLE DEPT_LOCATIONS
(
 Dnumber int foreign key (Dnumber) REFERENCES DEPARTMENT(Dnumber),
 Dlocation varchar(30) PRIMARY KEY
)



--DỮ LIỆU CẦN FK
Alter table EMPLOYEE
ADD foreign key (super_ssn) references EMPLOYEE(ssn)

Alter table DEPARTMENT
ADD foreign key (Mgr_ssn) references EMPLOYEE(Ssn)

--EX2
--.Insert <‘Robert’, ‘F’, ‘Scott’, ‘943775543’, ‘1972-06-21’, ‘2365 Newcastle Rd, Bellaire, TX’, M, 58000, ‘888665555’, 1> into EMPLOYEE
INSERT INTO EMPLOYEE (Fname, Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
			VALUES('Robert','F','Scott','943775543','1972-06-21','2365 Newcastle Rd, Bellaire, TX','M',5800,'888665555',1)

 

--b. Insert <‘ProductA’, 4, ‘Bellaire’, 2> into PROJECT.
INSERT INTO PROJECT(Pname,Pnumber,Plocation,Dnum) VALUES ('Product A',4,'Bellaire',2)

--c. Insert <‘Production’, 4, ‘943775543’, ‘2007-10-01’> into DEPARTMENT.
INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)
				VALUES('Production',4, '943775543', '2007-10-01') 

--d. Insert <‘677678989’, NULL, ‘40.0’> into WORKS_ON.
INSERT INTO WORKS_ON(Essn,Pno,Hours) VALUES('677678989', NULL, '40.0')

--e. Insert <‘453453453’, ‘John’, ‘M’, ‘1990-12-12’, ‘spouse’> into DEPENDENT
INSERT INTO DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship) 
				VALUES('453453453', 'John', 'M', '1990-12-12', 'spouse')
-- f. Delete the WORKS_ON tuples with Essn = ‘333445555’.
DELETE FROM WORKS_ON WHERE ESSN= '943775543'
-- g. Delete the EMPLOYEE tuple with Ssn = ‘987654321’.

DELETE FROM EMPLOYEE WHERE Ssn= '911668842'
DELETE FROM DEPENDENT WHERE Essn= '911668842'
DELETE FROM WORKS_ON WHERE ESsn= '911668842'
DELETE FROM DEPARTMENT WHERE Mgr_ssn= '911668842'
DELETE FROM EMPLOYEE WHERE Super_ssn='911668842'
-- h. Delete the PROJECT tuple with Pname = ‘ProductX’.
DELETE FROM PROJECT WHERE PNAME= 'ProductB'
-- i. Modify the Mgr_ssn and Mgr_start_date of the DEPARTMENT tuple with Dnumber = 5 to ‘123456789’ and ‘2007-10-01’, respectively.
UPDATE DEPARTMENT

SET Mgr_ssn = '943778843', Mgr_start_date = '1999-04-03'

WHERE DNUMBER= 1
-- j. Modify the Super_ssn attribute of the EMPLOYEE tuple with Ssn = ‘999887777’ to ‘943775543’.
UPDATE EMPLOYEE

SET Super_ssn = null

WHERE SSN= '911668842'

-- k. Modify the Hours attribute of the WORKS_ON tuple with Essn = ‘999887777’ and Pno = 10 to ‘5.0’.
UPDATE WORKS_ON

SET HOURS = '40.0'

WHERE ESSN= '943775543' AND PNO= 3



--Exercise 3:

-- a. Retrieve the minimum and maximum Salary and number of employees in each department
SELECT Dname, DNumber, MAX(Salary), COUNT(Ssn), MIN(Salary) FROM EMPLOYEE e, DEPARTMENT d
WHERE e.Dno = d.Dnumber 
GROUP BY Dname, Dnumber


-- b. Retrieve the number of projects located in Sharjah that are owned by each department
SELECT p.Pnumber, d.Dnumber, d.Dname FROM DEPARTMENT d inner join PROJECT p ON d.Dnumber = p.Dnum  WHERE p.Plocation LIKE 'lonDon' 

-- c. Retrieve the Ssn and Address of employees who work for the HR department and have female dependent 
SELECT e.Ssn, e.Address FROM DEPARTMENT d inner join EMPLOYEE e ON d.Mgr_ssn = e.Ssn 
				  inner join DEPENDENT de ON de.Essn = e.Ssn WHERE d.Dname = 'Sales' AND de.Sex ='F'


-- d. Retrieve the first name and last name of all employees who work for all departments except the HR department.
SELECT e.Fname, e.Lname FROM DEPARTMENT d, EMPLOYEE e 
							WHERE d.Mgr_ssn = e.Ssn 
							EXCEPT SELECT e.Fname, e.Lname FROM DEPARTMENT d, EMPLOYEE e 
							WHERE d.Mgr_ssn = e.Ssn AND d.Dname LIKE 'Sales'

-- e. Retrieve the last name and Ssn of employees who work on more than three projects		
SELECT COUNT(p.Dnum) AS [Number of project], e.Lname, e.Ssn FROM PROJECT p, EMPLOYEE e, WORKS_ON w
							WHERE p.Pnumber = w.Pno AND w.Essn = e.Ssn GROUP BY e.Lname, e.Ssn HAVING COUNT(p.Dnum) >3
							
--  f. Make a list of the distinct names of all employees who in the HR department and work on projects that are located in Sharjah
SELECT  DISTINCT e.Lname, e.Fname
FROM EMPLOYEE e, DEPARTMENT d, PROJECT p
WHERE e.Ssn = d.Mgr_ssn AND d.Dnumber =p.Dnum AND d.Dname LIKE 'Sales' AND p.Plocation ='lonDon' 


--Exercise4--
--a. Retrieve the names of all employees who work in the department that has the employee with the highest salary among all employees.
SELECT Fname, Lname FROM EMPLOYEE WHERE Dno IN (SELECT Dno FROM EMPLOYEE
													 WHERE Salary = (SELECT MAX(Salary)
														FROM employee))
-- b. Retrieve the names of all employees whose supervisor’s supervisor has ‘943775543’ for Ssn
SELECT Lname FROM EMPLOYEE WHERE Super_ssn IN ( SELECT Ssn FROM EMPLOYEE WHERE Super_ssn = '943775543' )


-- c. Retrieve the names of employees who make at least $10,000 more than the employee who is paid the least in the company.
SELECT Fname, Lname FROM EMPLOYEE WHERE Salary > 10000 + (SELECT MIN(Salary) FROM EMPLOYEE)

-- d. Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project.

SELECT LNAME, FNAME FROM EMPLOYEE WHERE DNO=5 AND SSN IN ( SELECT ESSN FROM WORKS_ON WHERE HOURS>10 AND PNO IN ( SELECT PNUMBER FROM PROJECT WHERE PNAME='ProductX' ) )
 -- e. List the names of all employees who have a dependent with the same first name as themselves

SELECT LNAME, FNAME FROM EMPLOYEE WHERE EXISTS ( SELECT *  FROM DEPENDENT  WHERE FNAME=DEPENDENT_NAME AND SSN=ESSN );

 --f. Find the names of all employees who are directly supervised by ‘Franklin Wong’
SELECT LNAME, FNAME FROM EMPLOYEE WHERE Super_ssn IN ( SELECT SSN FROM EMPLOYEE WHERE FNAME='Franklin' AND LNAME='Wong' );






