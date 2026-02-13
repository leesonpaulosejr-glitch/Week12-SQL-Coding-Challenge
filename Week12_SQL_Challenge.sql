DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;


-- Create EMPLOYEES table
CREATE TABLE employees ( 
  EMPNO INTEGER PRIMARY KEY, 
  ENAME VARCHAR(255) NOT NULL, 
  JOB VARCHAR(255) NOT NULL, 
  MGR INTEGER, 
  HIREDATE DATE NOT NULL, 
  SALARY INTEGER NOT NULL, 
  COMM INTEGER, 
  DEPTNO INTEGER NOT NULL 
);

-- Create DEPTS table
CREATE TABLE depts ( 
  DEPTNO INTEGER PRIMARY KEY, 
  DNAME VARCHAR(255) NOT NULL, 
  LOCATION VARCHAR(255) NOT NULL 
);

-- Insert into employees
INSERT INTO employees VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1980-08-02',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,20),
(7788,'SCOTT','ANALYST',7566,'1982-12-09',3100,NULL,30),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1983-01-23',1300,NULL,20);

-- Insert into depts
INSERT INTO depts VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');


-- Q1(A): Display all the information of the EMP table?
SELECT * FROM employees;

-- Q1 (B): Display unique Jobs from EMP table?
SELECT DISTINCT JOB FROM employees;

-- Q1(C): List the emps in the asc order of their Salaries
SELECT * FROM employees ORDER BY SALARY ASC;

-- Q1(D); List the details of the emps in asc order of the Dptnos and desc of Jobs?
select * from employees
order by DEPTNO asc, JOB desc;

-- Q1(E): Display all the unique job groups in the descending order?
SELECT DISTINCT JOB FROM employees
ORDER BY JOB DESC;

-- Q1(F): Display all the details of all ‘Mgrs’
SELECT * FROM employees
WHERE JOB = 'MANAGER';

-- Q1(G): List the emps who joined before 1981.
SELECT * FROM employees
WHERE HIREDATE < '1981-01-01';

-- Q1(H) List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal. 
SELECT EMPNO, ENAME, SALARY,
		(SALARY/30) AS DAILY_SAL,
        (SALARY*12) AS ANNSAL
FROM employees
ORDER BY ANNSAL ASC;

-- check1 
-- 2.9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs 
SELECT EMPNO, ENAME, JOB, HIREDATE,
		timestampdiff(YEAR, HIREDATE, CURDATE()) AS EXPERIENCE
FROM employees
WHERE JOB = 'MANAGER';

-- check2
-- 2.10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7698.
SELECT EMPNO, ENAME, SALARY,
		timestampdiff(YEAR, HIREDATE, CURDATE()) AS EXPERIENCE
FROM employees
WHERE MGR = 7698;

-- 2.11. Display all the details of the emps whose Comm. Is more than their Sal.
SELECT *
FROM employees
WHERE COMM > SALARY;

-- 2.12: List the emps in the asc order of Designations of those joined after the second half of 1981
SELECT *
FROM employees
WHERE HIREDATE > '1981-06-30'
ORDER BY JOB ASC;

-- 2.14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT *
FROM employees
WHERE JOB IN ('CLERK', 'ANALYST')
ORDER BY JOB DESC;

-- 2.15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN80 in asc order of seniority.
SELECT *
FROM employees
WHERE HIREDATE IN ('1981-05-01','1981-12-03','1980-12-17','1980-01-19')
ORDER BY HIREDATE ASC;

-- 2.16. List the emp who are working for the Deptno 10 or20
SELECT *
FROM employees
WHERE DEPTNO IN (10,20);

-- 2.17. List the emps who are joined in the year 81
SELECT *
FROM employees
WHERE YEAR(HIREDATE) = 1981;

-- 2.18. List the emps who are joined in the month of Aug 1980.WHERE HIREDATE 
SELECT *
FROM employees
WHERE year(HIREDATE) = 1980
AND MONTH(HIREDATE) = 8;

-- 2.19. List the emps Who Annual sal ranging from 22000 and 45000.
SELECT *
FROM employees
WHERE (SALARY*12) BETWEEN 22000 AND 45000;

-- 2.20. List the Enames those are having five characters in their Names.
SELECT ENAME
FROM employeeS
WHERE LENGTH(ENAME) = 5;

-- 2.21. List the Enames those are starting with ‘S’ and with five characters.
SELECT ENAME
FROM employees
WHERE ENAME LIKE 'S____';

-- 2.22. List the emps those are having four chars and third character must be ‘r’.
SELECT ENAME
FROM employees
WHERE ENAME LIKE '__r__';

-- 2.23. List the Five character names starting with ‘S’ and ending with ‘H’.
SELECT ENAME
FROM employees
WHERE ENAME LIKE 'S___H';

-- 2.24. List the emps who joined in January
SELECT *
FROM employees
where month(HIREDATE) = 1;

-- 2.25. List the emps who joined in the month of which second character is ‘a’. 
SELECT *
FROM employees
WHERE MONTHNAME(HIREDATE) LIKE '_a%';

-- 2.26. List the emps whose Sal is four digit number ending with Zero.
SELECT *
FROM employees
WHERE SALARY BETWEEN 1000 AND 9999
AND SALARY % 10 = 0;


-- 2.27. List the emps whose names having a character set ‘ll’ together. -- %: for matching zero or more characters. 
SELECT *
FROM employees
WHERE ENAME LIKE '%LL%';

-- 2.28. List the emps those who joined in 80’s.
SELECT *
FROM employees
WHERE YEAR(HIREDATE) BETWEEN 1980 AND 1989;

-- 2.29. List the emps who does not belong to Deptno 20
SELECT *
FROM employees
WHERE DEPTNO <> 20;

-- 2.30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
SELECT *
FROM employees
WHERE JOB NOT IN ('PRESIDENT','MANAGER')
ORDER BY SALARY ASC;

-- 2.31. List all the emps who joined before or after 1981.
SELECT *
FROM employees
WHERE YEAR(HIREDATE) <> 1981;

-- 2.32. List the emps whose Empno not starting with digit78.
SELECT *
FROM employees
WHERE EMPNO NOT LIKE '78%';

-- 2.33. List the emps who are working under ‘MGR’.
SELECT *
FROM employees e
JOIN employees m ON e.MGR = m.EMPNO
WHERE m.JOB = 'MANAGER';

-- 2.34. List the emps who joined in any year but not belongs to the month of March.
SELECT *
FROM employees
WHERE MONTH(HIREDATE) <>3;

-- 2.35. List all the Clerks of Deptno 20.
SELECT *
FROM employees
WHERE JOB = 'CLERK'
AND DEPTNO = 20;

-- 2.36. List the emps of Deptno 30 or 10 joined in the year 1981
SELECT *
FROM employees
WHERE DEPTNO IN (10,30)
AND YEAR(HIREDATE) = 1981;

-- 2.37. Display the details of SMITH
SELECT *
FROM employees
WHERE ENAME = 'SMITH';

-- 2.38. Display the location of SMITH.
SELECT d.LOCATION
FROM employees e
JOIN deptS d ON e.DEPTNO = d.DEPTNO
WHERE e.ENAME = 'SMITH';

-- 2.39. List the total information of EMP table along with DNAME and Loc of
SELECT e.*, d.DNAME, d.LOCATION
from employees e
join depts d
on e.DEPTNO = d.DEPTNO;

-- 2.40. List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘RESEARCH’ working in New York, Dallas with an exp more than 7 years without receiving the Comm asc order of Loc.
SELECT e.EMPNO, e.ENAME, e.SALARY, d.DNAME, d.LOCATION
FROM employees e
join depts d on e.DEPTNO = d.DEPTNO
WHERE e.JOB = 'MANAGER'
AND d.DNAME = 'RESEARCH'
AND d.LOCATION IN ('NEW YORK', 'DALLAS')
AND e.COMM IS NULL
ORDER BY d.LOCATION ASC; 

-- 2.41. Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps working at CJICAGO or working for ACCOUNTING dept with Ann Sal>28000, but the Sal should not be=3000 or 2800 who doesn’t belongs to the Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of Deptno and desc order of job
SELECT e.EMPNO, e.ENAME, e.SALARY,
		d.DNAME, d.LOCATION,
        e.DEPTNO, e.JOB
FROM employees e
JOIN depts d ON e.DEPTNO = d.DEPTNO
WHERE
(
		d.LOCATION = 'CHICAGO'
        OR d.DNAME = 'ACCOUNTING'
)
AND (e.SALARY * 12) > 28000
AND e.SALARY NOT IN (3000,2800)
AND e.JOB <> 'MANAGER'
AND SUBSTRING(e.EMPNO, 3, 1) IN ('7', '8')
ORDER BY e.DEPTNO ASC, e.JOB DESC;
