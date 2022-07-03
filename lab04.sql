CREATE DATABASE SE151074
USE SE151074

--EX1--
CREATE TABLE DEPARTMENT (
  Dname        varchar(25) not null,
  Dnumber      int not null,
  Mgr_ssn      char(9) not null, 
  Mgr_start_date date,
  primary key (Dnumber),
  UNIQUE (Dname) 
);


CREATE TABLE EMPLOYEE (
  Fname    varchar(15) not null, 
  Minit    varchar(1),
  Lname    varchar(15) not null,
  Ssn     char(9), 
  Bdate    date,
  Address  varchar(50),
  Sex      char,
  Salary   decimal(10,2),
  Super_ssn char(9),
  Dno      int,
  primary key (ssn),
  foreign key (Dno) references DEPARTMENT(Dnumber)
);


CREATE TABLE DEPENDENT (
  Essn           char(9),
  Dependent_name varchar(15),
  Sex            char,
  Bdate          date,
  Relationship   varchar(8),
  primary key (Essn,Dependent_name),
  foreign key (Essn) references EMPLOYEE(Ssn)
);


CREATE TABLE DEPT_LOCATIONS (
  Dnumber   int,
  Dlocation varchar(15), 
  primary key (Dnumber,Dlocation),
  foreign key (Dnumber) references DEPARTMENT(Dnumber)
);


CREATE TABLE PROJECT (
  Pname      varchar(25) not null,
  Pnumber    int,
  Plocation  varchar(15),
  Dnum       int not null,
  primary key (Pnumber),
  unique (Pname),
  foreign key (Dnum) references DEPARTMENT(Dnumber)
);


CREATE TABLE WORKS_ON (
  Essn   char(9),
  Pno    int,
  Hours  decimal(4,1),
  primary key (Essn,Pno),
  foreign key (Essn) references EMPLOYEE(Ssn),
  foreign key (Pno) references PROJECT(Pnumber)
);

--INSERT DỮ LIỆU
-- 1.DU LIEU DEPARTMENT 
INSERT INTO DEPARTMENT VALUES ('Research','5','333445555','1978-05-22');
INSERT INTO DEPARTMENT VALUES ('Administration','4','987654321','1985-01-01');
INSERT INTO DEPARTMENT VALUES ('Headquarters','1','888665555','1971-06-19');
INSERT INTO DEPARTMENT VALUES ('Software','6','111111100','1999-05-15');
INSERT INTO DEPARTMENT VALUES ('Hardware','7','444444400','1998-05-15');
INSERT INTO DEPARTMENT VALUES ('Sales','8','555555500','1997-01-01');
INSERT INTO DEPARTMENT VALUES ('Marketing','2','555555500','2001-02-02');
INSERT INTO DEPARTMENT VALUES ('HR','9','333445555','2001-02-02');

UPDATE DEPARTMENT

SET Mgr_ssn = '333445556'

WHERE Mgr_ssn= '333445555'

-- 2. DU LIEU EMPLOYEE
INSERT INTO EMPLOYEE VALUES ('Xuan','E','Thiep','888665555','1927-11-10','Dong Nai','M','55000.00',NULL,'1'); 
INSERT INTO EMPLOYEE VALUES ('Tan','B','Nguyen','666666600','1968-04-17','Ho Chi Minh','M','96000.00',NULL,'8' );
INSERT INTO EMPLOYEE VALUES ('Thai','C','Dinh','333333300','1970-10-23','Binh Duong','F','79000.00',NULL,'6'); 
INSERT INTO EMPLOYEE VALUES ('Tra','C','My','555555500','1975-06-30','Vung Tau','M','81000.00',NULL,'6'); 
INSERT INTO EMPLOYEE VALUES ('Alex','D','Freed','444444400','1950-10-09','WASHINGTON','M','89000.00',NULL,'7'); 
INSERT INTO EMPLOYEE VALUES ('Alec','C','Best','444444402','1966-06-18','WASHINGTON','M','60000.00','444444400','7'); 
INSERT INTO EMPLOYEE VALUES ('Nhu','K','Quynh','666884444','1952-09-15','Ha Noi','M','38000.00','333445555','5'); 
INSERT INTO EMPLOYEE VALUES ('Kim','T','Anh','333445555','1945-12-08','Da Nang','M','40000.00','888665555','5'); 
INSERT INTO EMPLOYEE VALUES ('Alicia','J','Zelaya','999887777','1958-07-19','Tokyo','F','25000.00','987654321','4'); 
INSERT INTO EMPLOYEE VALUES ('Jennifer','S','Wallace','987654321','1931-06-20','Paris','F','43000.00','888665555','4'); 
INSERT INTO EMPLOYEE VALUES ('John','D','Cena','111111100','1966-10-10','LasVegas','M','85000.00',NULL,'6'); 
INSERT INTO EMPLOYEE VALUES ('Jon','C','Jones','111111101','1967-11-14','LasVegas','M','45000.00','111111100','6'); 
INSERT INTO EMPLOYEE VALUES ('Huy','K','Doan','555555501','1969-04-16','Ho Chi Minh','M','62000.00','555555500','6'); 
INSERT INTO EMPLOYEE VALUES ('Nha','K','Thy','453453453','2001-04-16','Ho Chi Minh','M','62000.00','555555500','6'); 
INSERT INTO EMPLOYEE VALUES ('Kita','K','To','333445556','2001-04-16','Ho Chi Minh','M','62000.00','555555500','9'); 



-- 3.DU LIEU DEPENDENT
INSERT INTO DEPENDENT VALUES ('333445555','Quynh','F','1976-04-05','Daughter'); 
INSERT INTO DEPENDENT VALUES ('333445555','Nam','M','1973-10-25','Son'); 
INSERT INTO DEPENDENT VALUES ('333445555','Hai','F','1948-05-03','Spouse'); 
INSERT INTO DEPENDENT VALUES ('987654321','Abner','M','1932-02-29','Spouse'); 
INSERT INTO DEPENDENT VALUES ('444444400','Henry','M','1997-04-04','Son'); 
INSERT INTO DEPENDENT VALUES ('444444400','Tom','M','1999-06-07','Son'); 
INSERT INTO DEPENDENT VALUES ('444444402','Sam','M','1964-02-14','Spouse');  
INSERT INTO DEPENDENT VALUES ('333445556','Sam','F','1964-02-14','Spouse');  



-- 4. DU LIEU DEPT_LOCATIONS 

INSERT INTO DEPT_LOCATIONS VALUES ('1','Ho Chi Minh'); 
INSERT INTO DEPT_LOCATIONS VALUES ('4','Da Nang'); 
INSERT INTO DEPT_LOCATIONS VALUES ('5','Ha Noi'); 
INSERT INTO DEPT_LOCATIONS VALUES ('5','Tokyo'); 
INSERT INTO DEPT_LOCATIONS VALUES ('5','Washington'); 
INSERT INTO DEPT_LOCATIONS VALUES ('6','LasVegas'); 
INSERT INTO DEPT_LOCATIONS VALUES ('7','Paris'); 
INSERT INTO DEPT_LOCATIONS VALUES ('8','Dallas'); 
INSERT INTO DEPT_LOCATIONS VALUES ('8','Miami'); 
INSERT INTO DEPT_LOCATIONS VALUES ('8','Philadephia'); 
INSERT INTO DEPT_LOCATIONS VALUES ('8','Seattle'); 

-- 5.DU LIEU PROJECT
INSERT INTO PROJECT VALUES ('Product X','1','Bellaire','5'); 
INSERT INTO PROJECT VALUES ('Product Y','2','Sugarland','5'); 
INSERT INTO PROJECT VALUES ('Product Z','3','Houston','5'); 
INSERT INTO PROJECT VALUES ('ROBOT','10','Stafford','4'); 
INSERT INTO PROJECT VALUES ('Reorganization','20','Houston','1'); 
INSERT INTO PROJECT VALUES ('OperatingSystems','61','Jacksonville','6'); 
INSERT INTO PROJECT VALUES ('DatabaseSystems','62','Birmingham','6'); 
INSERT INTO PROJECT VALUES ('InkjetPrinters','91','Phoenix','7'); 
INSERT INTO PROJECT VALUES ('LaserPrinters','92','LasVegas','7');	
INSERT INTO PROJECT VALUES ('Product W','15','Sharjah','7');
INSERT INTO PROJECT VALUES ('Product L','16','Sharjah','9');	
	



 --6. DU LIEU WORK ON
INSERT INTO WORKS_ON VALUES ('888665555','1','32.5'); 
INSERT INTO WORKS_ON VALUES ('888665555','2','32.5'); 
INSERT INTO WORKS_ON VALUES ('888665555','3','32.5'); 
INSERT INTO WORKS_ON VALUES ('888665555','4','32.5'); 

INSERT INTO WORKS_ON VALUES ('666666600','2','7.5'); 
INSERT INTO WORKS_ON VALUES ('333333300','3','40.0'); 
INSERT INTO WORKS_ON VALUES ('333445555','2','10.0'); 
INSERT INTO WORKS_ON VALUES ('999887777','20','30.0'); 
INSERT INTO WORKS_ON VALUES ('987654321','20','20.0'); 
INSERT INTO WORKS_ON VALUES ('111111100','61','40.0'); 
INSERT INTO WORKS_ON VALUES ('111111101','61','40.0'); 
INSERT INTO WORKS_ON VALUES ('444444400','91','40.0'); 
INSERT INTO WORKS_ON VALUES ('444444402','91','40.0'); 
INSERT INTO WORKS_ON VALUES ('555555500','92','40.0'); 
INSERT INTO WORKS_ON VALUES ('555555501','92','44.0'); 
INSERT INTO WORKS_ON VALUES ('666884444','62','10.0'); 

-- SAU KHI ĐƯA DỮ LIỆU CẦN FK 
Alter table EMPLOYEE
ADD foreign key (super_ssn) references EMPLOYEE(ssn);

Alter table DEPARTMENT
ADD foreign key (Mgr_ssn) references EMPLOYEE(Ssn);

--EX2.--
-- a. Insert <‘Robert’, ‘F’, ‘Scott’, ‘943775543’, ‘1972-06-21’, ‘2365 Newcastle Rd, Bellaire, TX’, M, 58000, ‘888665555’, 1> into EMPLOYEE.
INSERT INTO EMPLOYEE VALUES ('Robert', 'F', 'Scott', '943775543', '1972-06-21', '2365 Newcastle Rd, Bellaire, TX','M', 58000, '888665555', 1);
-- b. Insert <‘ProductA’, 4, ‘Bellaire’, 2> into PROJECT.
INSERT INTO PROJECT VALUES ('ProductA', 4, 'Bellaire', 2);
-- c. Insert <‘Production’, 4, ‘943775543’, ‘2007-10-01’> into DEPARTMENT.
INSERT INTO DEPARTMENT VALUES ('Production', 4, '943775543', '2007-10-01') -- dupicated
-- d.. Insert <‘677678989’, NULL, ‘40.0’> into WORKS_ON
INSERT INTO WORKS_ON VALUES ('677678989', NULL, '40.0') -- Đây là cú pháp đúng nếu WORKS_ON có thuộc tính Pno không phải là primary key--
-- e. Insert <‘453453453’, ‘John’, ‘M’, ‘1990-12-12’, ‘spouse’> into DEPENDENT.
INSERT INTO DEPENDENT VALUES ('453453453', 'John', 'M', '1990-12-12', 'SPOUSE')
-- f. Delete the WORKS_ON tuples with Essn = ‘333445555’.
DELETE FROM WORKS_ON WHERE ESSN= '333445555'
-- g. Delete the EMPLOYEE tuple with Ssn = ‘987654321’.
DELETE FROM EMPLOYEE WHERE Ssn= '987654321'
DELETE FROM DEPENDENT WHERE Essn= '987654321'
DELETE FROM WORKS_ON WHERE ESsn= '987654321'
DELETE FROM DEPARTMENT WHERE Mgr_ssn= '987654321'
DELETE FROM EMPLOYEE WHERE Super_ssn='987654321'
-- h. Delete the PROJECT tuple with Pname = ‘ProductX’.
DELETE FROM PROJECT WHERE PNAME= 'ProductX'
-- i. Modify the Mgr_ssn and Mgr_start_date of the DEPARTMENT tuple with Dnumber = 5 to ‘123456789’ and ‘2007-10-01’, respectively.
UPDATE DEPARTMENT

SET Mgr_ssn = '123456789', Mgr_start_date = '2007-10-01'

WHERE DNUMBER= 5
-- j. Modify the Super_ssn attribute of the EMPLOYEE tuple with Ssn = ‘999887777’ to ‘943775543’.
UPDATE EMPLOYEE

SET Super_ssn = '943775543'

WHERE SSN= '999887777'

-- k. Modify the Hours attribute of the WORKS_ON tuple with Essn = ‘999887777’ and Pno = 10 to ‘5.0’.
UPDATE WORKS_ON

SET HOURS = '5.0'

WHERE ESSN= '999887777' AND PNO= 10


--EX.3--

-- a. Retrieve the minimum and maximum Salary and number of employees in each department
SELECT Dname, DNumber, MAX(Salary), COUNT(Ssn), MIN(Salary) FROM EMPLOYEE e, DEPARTMENT d
WHERE e.Dno = d.Dnumber 
GROUP BY Dname, Dnumber

-- b. Retrieve the number of projects located in Sharjah that are owned by each department
SELECT p.Pnumber, d.Dnumber, d.Dname
FROM DEPARTMENT d inner join PROJECT p ON d.Dnumber = p.Dnum 
WHERE p.Plocation LIKE 'Sharjah' 

-- c. Retrieve the Ssn and Address of employees who work for the HR department and have female dependent 
SELECT e.Ssn, e.Address
FROM DEPARTMENT d inner join EMPLOYEE e ON d.Mgr_ssn = e.Ssn 
				  inner join DEPENDENT de ON de.Essn = e.Ssn
WHERE d.Dname = 'HR' AND de.Sex ='F'

-- d. Retrieve the first name and last name of all employees who work for all departments except the HR department.
SELECT e.Fname, e.Lname
FROM DEPARTMENT d, EMPLOYEE e 
WHERE d.Mgr_ssn = e.Ssn 
EXCEPT 
SELECT e.Fname, e.Lname
FROM DEPARTMENT d, EMPLOYEE e 
WHERE d.Mgr_ssn = e.Ssn AND d.Dname LIKE 'HR'

-- e. Retrieve the last name and Ssn of employees who work on more than three projects		
SELECT COUNT(p.Dnum) AS [Number of project], e.Lname, e.Ssn
FROM PROJECT p, EMPLOYEE e, WORKS_ON w
WHERE p.Pnumber = w.Pno AND w.Essn = e.Ssn 
GROUP BY e.Lname, e.Ssn
HAVING COUNT(p.Dnum) > 3

--  f. Make a list of the distinct names of all employees who in the HR department and work on projects that are located in Sharjah
SELECT  DISTINCT e.Lname, e.Fname
FROM EMPLOYEE e, DEPARTMENT d, PROJECT p
WHERE e.Ssn = d.Mgr_ssn AND d.Dnumber =p.Dnum AND d.Dname LIKE 'HR' AND p.Plocation ='Sharjah'

--EX.4--
--a. Retrieve the names of all employees who work in the department that has the employee with the highest salary among all employees.
SELECT Fname, Lname
FROM EMPLOYEE
WHERE Dno = (SELECT Dno
			 FROM EMPLOYEE
			 WHERE Salary = (SELECT MAX(Salary)
							FROM employee))
-- b. Retrieve the names of all employees whose supervisor’s supervisor has ‘888665555’ for Ssn
SELECT Lname FROM EMPLOYEE WHERE Super_ssn IN ( SELECT Ssn FROM EMPLOYEE WHERE Super_ssn = '888665555' )
-- c. Retrieve the names of employees who make at least $10,000 more than the employee who is paid the least in the company.
SELECT Fname, Lname
FROM EMPLOYEE
WHERE Salary > 10000 + (SELECT MIN(Salary)
						FROM EMPLOYEE)
-- d. Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project.

SELECT LNAME, FNAME
FROM EMPLOYEE
WHERE DNO=5 AND SSN IN ( SELECT ESSN
FROM WORKS_ON
WHERE HOURS>10 AND PNO IN ( SELECT PNUMBER
 FROM PROJECT
 WHERE PNAME='ProductX' ) )
 -- e. List the names of all employees who have a dependent with the same first name as themselves

SELECT LNAME, FNAME
FROM EMPLOYEE
WHERE EXISTS ( SELECT *
 FROM DEPENDENT
 WHERE FNAME=DEPENDENT_NAME AND SSN=ESSN );

 --f. Find the names of all employees who are directly supervised by ‘Franklin Wong’



SELECT LNAME, FNAME
FROM EMPLOYEE
WHERE Super_ssn IN ( SELECT SSN
FROM EMPLOYEE
WHERE FNAME='Franklin' AND LNAME='Wong' );




