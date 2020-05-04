

SELECT COURSEID, COURSENAME
FROM COURSE 
WHERE COURSEID LIKE 'ISM%';

--b
SELECT FACULTYNAME, COURSE.COURSEID, COURSENAME
FROM FACULTY, COURSE, QUALIFIED
WHERE QUALIFIED.FACULTYID = 3467
AND FACULTY.FACULTYID= QUALIFIED.FACULTYID
AND COURSE.COURSEID=QUALIFIED.COURSEID;

--c
SELECT s.STUDENTNAME, s.StudentID , s2.CourseID , r.sectionno, r.semester
FROM Student s , Faculty f , COURSE c , [SECTION] s2 , REGISTRATION r
WHERE S2.SectionNo = r.SectionNo 
AND s.StudentID =r.StudentID 
AND r.SectionNo = 2714 
AND s2.Semester = 'I-2008'
AND r.Semester = 'I-2008'
ORDER BY StudentName;

--2)
SELECT F.FACULTYNAME  , c.COURSENAME
FROM QUALIFIED q ,Faculty f , COURSE c 
WHERE q.FacultyID = f.FacultyID
AND q.CourseID = c.CourseID 
AND q.CourseID = 'ISM 3113';


--3)
SELECT F.FACULTYNAME  , c.COURSENAME
FROM QUALIFIED q ,Faculty f , COURSE c 
WHERE q.FacultyID = f.FacultyID
AND q.CourseID = c.CourseID 
AND q.CourseID = 'ISM 3113'
AND q.CourseID <> 'ISM 4930';

--4 a)
SELECT COUNT(DISTINCT STUDENTID) AS TOTALSTUDENTS
FROM REGISTRATION 
WHERE SectionNo = 2714
AND Semester  ='I-2008'


--4) b
SELECT COUNT(DISTINCT  STUDENTID) AS TOTALSTUDENTS
FROM REGISTRATION r , [SECTION] s 
WHERE S.CourseID  = 'ISM 3113'
AND r.SectionNo = s.SectionNo 
AND r.Semester  = s.Semester ;



SELECT COUNT (DISTINCT (StudentID)) AS TOTALSTUDENTS
        FROM [SECTION], REGISTRATION 
        WHERE [SECTION].SectionNO = REGISTRATION.SectionNo 
        AND [SECTION].CourseID = 'ISM 3113'
        AND [SECTION].Semester = 'I-2008';

--5)
SELECT r.StudentID 
FROM STUDENT, REGISTRATION r 
WHERE r.Semester <> 'I-2008'




Select STUDENT.StudentID, STUDENT.StudentName from

STUDENT Where NOT EXISTS
(
SELECT * FROM REGISTRATION 
WHERE REGISTRATION.StudentID = STUDENT.StudentID 
AND REGISTRATION.Semester = 'I-2008')





select * from subdivision s 

select * from employee e 

select * from project p 

select * from works_on wo 

--1
select e.dept_no , count(DISTINCT  e.emp_no) as Employee_Count
FROM employee e , subdivision s 
WHERE s.dept_no  = e.dept_no 
group by e.dept_no

---2

SELECT s.dept_no from subdivision s
WHERE (SELECT count(DISTINCT e.emp_no )as employee_count from employee e WHERE  s.dept_no  = e.dept_no  group by e.dept_no ) >= 2

--3
select  max(emp_no) as Highest_EmployeeNumber
FROM employee 
--4
select count(DISTINCT dept_no) from employee 

select DISTINCT  dept_no  from employee e 

--5
SELECT COUNT(*) , t.project_no 
FROM
(
SELECT project_no , COUNT(*) AS CNT
FROM works_on 
GROUP BY project_no
) AS T
WHERE CNT > 1


SELECT project_no, COUNT(*) as employee_count
FROM works_on
GROUP BY project_no
HAVING COUNT(*)>1


select e.dept_no, count(*) as employee_count
from employee e
group by e.dept_no 
HAVING  COUNT(*) >= 2  


