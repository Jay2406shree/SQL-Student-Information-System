NAME - JAYSHREE
EMAIL ID - jayshree2406@gmail.com

Q1. Create a table “student” with the structure/dictionary given above and insert 10 records 
given in the table created.
Create a table “faculty” with the structure/dictionary given above and insert 8 records given 
in the table created.
Create a table “course” with the structure/dictionary given above and insert 8 records given 
in the table created.
Create a table “registration” with the structure/dictionary given above and insert 18 records 
given in the table created.;

CREATE TABLE Student(
S_ID varchar2(3) NOT NULL PRIMARY KEY ,
SNAME varchar2(10) not null,
SEX varchar2(3),
MAJOR varchar2(3),
GPA decimal(3,2));
describe student;
drop table student;

CREATE TABLE Faculty(
FID varchar2(3) not null primary key,
FNAME varchar2(10)not null,
EXT varchar2(3),
DEPT varchar2(3),
RANK1 varchar2(4),
SALARY int);
describe faculty;
drop table faculty;
CREATE TABLE Course(
CRSNBR varchar2(6) not null,
CNAME varchar2(25) not null,
CREDIT int,
MAXENRL int,
FID varchar2(3) not null,
foreign key(FID)references faculty(FID));
describe course;
drop table course;

CREATE TABLE Registration(
CRSNBR varchar2(6),
S_ID varchar2(3),
GRADE varchar2(1),
PRIMARY KEY(CRSNBR,S_ID));
DESCRIBE REGISTRATION;
drop table registration;
select *from student;
--STUDENT TABLE
INSERT INTO Student values(987 ,'POIRIER', 'F', 'MGT', 3.2);
INSERT INTO Student values(763, 'PARKER', 'F', 'FIN', 2.7);
INSERT INTO Student values(218, 'RICHARDS', 'M', 'ACC', 2.4);
INSERT INTO Student values(359, 'PELNICK', 'F', 'FIN', 3.6);
INSERT INTO Student values(862, 'FAGIN', 'M', 'MGT', 2.2);
INSERT INTO Student values(748, 'MEGLIN', 'M', 'MGT', 2.8);
INSERT INTO Student values(506, 'LEE', 'M', 'FIN', 2.7);
INSERT INTO Student values(581, 'GAMBREL', 'F', 'MKT', 3.8);
INSERT INTO Student values(372, 'QUICK', 'F', 'MGT', 3.5);
INSERT INTO Student values(126, 'ANDERSON', 'M', 'ACC', 3.7);


--FACULTY TABLE
INSERT INTO Faculty values(036, 'BARGES', 325, 'MGT', 'ASSO', 35000);
INSERT INTO Faculty values(117, 'JARDIN', 212, 'FIN', 'FULL', 33000);
INSERT INTO Faculty values(098, 'KENEDY', 176, 'ACC', 'ASSO', 30000);
INSERT INTO Faculty values(075, 'SAMPLE', 171, 'MKT', 'ASST', 25000);
INSERT INTO Faculty values(138, 'WARD', 125, 'MGT', 'INST', 20000);
INSERT INTO Faculty values(219, 'PETERS', 220, 'FIN', 'FULL', 45000);
INSERT INTO Faculty values(151, 'DARDEN', 250, 'ACC', 'ASSO', 37000);
INSERT INTO Faculty values(113, 'PIERCE', 205, 'MGT', 'INST', 22000);
select * from faculty;

--COURSE TABLE
INSERT INTO Course values('MGT630', 'INTRODUCTION TO MGMT', 4, 30, 138);
INSERT INTO Course values('FIN601', 'MANAGERIAL FINANCE', 4, 25, 117);
INSERT INTO Course values('MKT610', 'MARKETING FOR MANAGERS', 3, 35, 075);
INSERT INTO Course values('MKT661', 'TAXATION', 3, 30, 098);
INSERT INTO Course values('FIN602', 'INVESTMENT SKILLS', 3, 25, 219);
INSERT INTO Course values('ACC601', 'BASIC ACCOUNTING', 4, 25, 098);
INSERT INTO Course values('MGT681', 'INTERL.MANAGEMENT', 3, 20, 036);
INSERT INTO Course values('MKT670', 'PRODUCT MARKETING', 3, 20, 075);
select * from Course;

--REGISTRATION TABLE
INSERT INTO Registration values('MGT630', 987, 'A');
INSERT INTO Registration values('FIN602', 987, 'B');
INSERT INTO Registration values('MKT610', 987, 'A');
INSERT INTO Registration values('FIN601', 763, 'B');
INSERT INTO Registration values('FIN602', 763, 'B');
INSERT INTO Registration values('ACC610', 763, 'B');
INSERT INTO Registration values('ACC610', 218, 'A');
INSERT INTO Registration values('ACC661', 218, 'A');
INSERT INTO Registration values('MGT630', 218, 'C');
INSERT INTO Registration values('MGT630', 359, 'F');
INSERT INTO Registration values('MGT681', 359, 'B');
INSERT INTO Registration values('MKT610', 359, 'A');
INSERT INTO Registration values('MKT610', 862, 'A');
INSERT INTO Registration values('MKT670', 862, 'A');
INSERT INTO Registration values('ACC610', 862, 'B');
INSERT INTO Registration values('MGT630', 748, 'C');
INSERT INTO Registration values('MGT681', 748, 'B');
INSERT INTO Registration values('FIN601', 748, 'A');
select * from registration;

Q2. Retrieve the list of students in alphabetical order;
sol)
select * 
from student
order by sname;

Q3. Display a list of female students with a GPA above 3.25.;
sol)
select *
from student 
where sex like 'F' 
and gpa > 3.25;

Q4. Retrieve the names, majors, and GPA of all students who have a GPA above 3.5 and who 
are majoring in either accounting or finance;
sol)
select sname, major,gpa
from student
where major in ('MKT' , 'FIN')
AND gpa > 3.5;

Q5. Next year every faculty member will receive a 5% salary increase. List the names of each 
faculty member, his/her current salary, and next years salary;
sol)
select fname,salary as "CURR_SALARY",
1.05*(salary) as "NEXT_YR_SALARY"
from faculty;

Q6. Retrieve the average GPA from student where major=’MGT’.;
sol)
select avg(gpa)
from student
where major like 'MGT';

Q7. Create a new table rgn_copy and copy the data from the REGISTRATION table to the 
rgn_copy table. Change the grade to F in rgn_copy table where course no is MGT681.;
SOL)
CREATE TABLE rgn_copy
as select *
from registration;

UPDATE rgn_copy
SET grade = 'F'
where crsnbr = 'MGT681';
select * from rgn_copy;

Q8. Create a new table std_copy and copy the data from the student table to the std_copy table. 
A student whose ID number is 748 leaves the University. First delete the course in which 
student 748 is enrolled from the rgn_copy table. Then remove the student from the table 
std_copy;
sol)
CREATE TABLE std_copy
as select *
from student;

delete from rgn_copy
where s_id = 748;

delete from std_copy
where s_id = 748;

Q9. Delete the tables rgn_copy and std_copy from the database;
sol)
drop table rgn_copy;
drop table std_copy;

Q10. Create a table IPMFA with the following structure:
FID Character (3) where null values are not allowed; FNAME Varchar2(10) where null 
values are not allowed, EXT Varchar2(3) where null values are not allowed, DEPT 
Varchar2(3), RANK1 Varchar2(4), SALARY as integer. In this table, FID is the primary 
key.;

sol)
CREATE TABLE IPMFA(
FID varchar2(3) not null primary key,
FNAME varchar2(10) not null,
EXT varchar2(3) not null,
DEPT varchar2(3),
RANK1 varchar2(4),
salary int);
describe ipmfa;

Q11. Create a table IPMCO with the following structure:
CRSNBR Varchar2(6) with null values not allowed, CNAME Varchar2 25) with null values 
not allowed, CREDIT as integer, MAXENRL as integer, FID Varchar2(3) with null values 
not allowed. Now, introduce FID as Foreign Key and then reference to IPMFAC table 
considering FID of IPMFAC table and FID of IPMCO as common field.;
sol)
CREATE TABLE IPMCO(
CRSNBR varchar2(6) not null,
CNAME varchar2(25) not null,
CREDIT int,
MAXENRL int,
FID varchar2(3) not null,
foreign key (FID) references IPMFA(FID));

DESCRIBE IPMCO;

Q12. Create a view “Roster” that enables the individual to visualize selected data from the 
STUDENT, REGISTRATION, COURSE and FACULTY tables as being one table, This 
view includes course number, course name, name of person teaching the course, student ID 
and student name. 
Display course number, course name, student ID, and student name from view “Roster” for 
the course number “FIN601”;
SOL)
CREATE VIEW Roster
as select c.crsnbr, c.cname,
f.fname, s.s_id,s.sname
from course c
left join registration r
on c.crsnbr = r.crsnbr
left join faculty f
on c.fid=f.fid
left join student s
on s.s_id = r.s_id;
select * from roster;


--display roster view having course name FIN601
select crsnbr as "COURSE NO",
CNAME as "Course name",
S_ID as "Student id",
SNAME as "Student name"
from roster
where crsnbr ='FIN601';

Q13. Create an index “MAJORIND” using the MAJOR column of Student to improve 
performance, MAJOR descending;
sol)
CREATE INDEX MAJORIND
ON student (major desc);


Q14. Write a stored procedure named “Getstudents” : To list all the sname of table Student;
sol)
CREATE OR REPLACE PROCEDURE Getstudents
AS 
BEGIN 
  for i in (select sname from student)  
  loop
    dbms_output.put_line(i.sname); 
  end loop; 
END; 
/
execute Getstudents;

Q15. Create trigger, “salary_changes” to display the following information:
Old salary: 
New salary: 
Salary difference:
The trigger will be fired when the salary difference is observed in the Faculty table.;
sol)
CREATE OR REPLACE TRIGGER salary_changes
BEFORE UPDATE OR DELETE OR INSERT ON faculty
FOR EACH ROW
When (NEW.FID>0)
DECLARE
 sal_diff NUMBER;
BEGIN 
 sal_diff:=:NEW.salary -:OLD.salary;
 dbms_output.put_line('Old salary:'|| :OLD.salary);
 dbms_output.put_line('New salary:' || :NEW.salary);
 dbms_output.put_line('Salary difference:' ||sal_diff);
END;
/

--UPDATE TABLE FOR TRIGGER ACTIVATION UPDATE FACULTY
UPDATE FACULTY
SET salary = salary+500
where fid=36;
/
drop trigger
SALARY_CHANGES;