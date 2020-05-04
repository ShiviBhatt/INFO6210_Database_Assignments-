-- DATA BASE CREATION
--CREATE DATABASE AdultLiteracy

--DDL STATEMENTS
CREATE TABLE Tutor (
TutorID INTEGER,
CertDate date,
status NVARCHAR(25),
CONSTRAINT tutor_PK PRIMARY KEY(TutorID));

CREATE TABLE STUDENT(
studentID INTEGER,
[read] nvarchar(25),
CONSTRAINT student_PK PRIMARY KEY(studentID)
);

CREATE TABLE MatchHistory(
MatchID INTEGER,
TutorID INTEGER,
StudentID INTEGER,
StartDate date,
EndDate date,
CONSTRAINT MatchHistory_PK PRIMARY KEY(MatchID),
CONSTRAINT Tutor_FK FOREIGN KEY (TutorID) REFERENCES TUTOR (TutorID),
CONSTRAINT Student_FK FOREIGN KEY (StudentID) REFERENCES STUDENT (StudentID)

);

CREATE TABLE TutorReport(
MatchID int not null,
[Month] DATE not null,
[Hours] INT,
Lessons INT,
CONSTRAINT PK_TutorReport PRIMARY KEY(MatchID,[Month])
);



INSERT INTO Tutor(TutorID,CertDate,[Status])values (100,'1/5/2008','Active');
INSERT INTO Tutor(TutorID,CertDate,[Status])values (101,'1/5/2008','Temp Stop');
INSERT INTO Tutor(TutorID,CertDate,[Status])values (102,'1/5/2008','Dropped');
INSERT INTO Tutor(TutorID,CertDate,[Status])values (103,'5/22/2008','Active');
INSERT INTO Tutor(TutorID,CertDate,[Status])values (104,'5/22/2008','Active');
INSERT INTO Tutor(TutorID,CertDate,[Status])values (105,'5/22/2008','Temp Stop');
INSERT INTO Tutor(TutorID,CertDate,[Status])values (106,'5/22/2008','Active');


INSERT INTO Student(StudentID,[Read])Values (3000,2.3);
INSERT INTO Student(StudentID,[Read])Values (3001,5.6);
INSERT INTO Student(StudentID,[Read])Values (3002,1.3);
INSERT INTO Student(StudentID,[Read])Values (3003,3.3);
INSERT INTO Student(StudentID,[Read])Values (3004,2.7);
INSERT INTO Student(StudentID,[Read])Values (3005,4.8);
INSERT INTO Student(StudentID,[Read])Values (3006,7.8);
INSERT INTO Student(StudentID,[Read])Values (3007,1.5);


INSERT INTO MatchHistory VALUES (1,100,3000,'1/10/2008',NULL);
INSERT INTO MatchHistory VALUES (2,101,3001,'1/15/2008','5/15/2008');
INSERT INTO MatchHistory VALUES (3,102,3002,'2/10/2008','3/01/2008');
INSERT INTO MatchHistory VALUES (4,106,3003,'5/28/2008',NULL);
INSERT INTO MatchHistory VALUES (5,103,3004,'6/01/2008','6/15/2008');
INSERT INTO MatchHistory VALUES (6,104,3005,'6/01/2008','6/28/2008');
INSERT INTO MatchHistory VALUES (7,104,3006,'6/01/2008',NULL);

INSERT INTO TutorReport VALUES (1,'06/08/2008',8,4);
INSERT INTO TutorReport VALUES (4,'06/08/2008',8,6);
INSERT INTO TutorReport VALUES (5,'06/08/2008',4,4);
INSERT INTO TutorReport VALUES (4,'07/08/2008',10,5);
INSERT INTO TutorReport VALUES (1,'06/08/2008',4,2);

--3
ALTER TABLE STUDENT ADD  MathScore varchar(25) ;

--4
ALTER TABLE TUTOR ADD subject varchar(25) CHECK ([Subject] = 'Reading' and [Subject] = 'Math' and [Subject] = 'ESL')

--6
select tutorID from MatchHistory where MatchID in (select MatchID from TutorReport where [MONTH] = '2008-07-08')

--7

select * from STUDENT 


ALTER TABLE STUDENT ADD name varchar(25);
ALTER TABLE STUDENT ADD address varchar(25);
ALTER TABLE STUDENT ADD Phone varchar(25);
ALTER TABLE STUDENT ADD email varchar(25);

UPDATE STUDENT SET name = 'Shivi' WHERE StudentID=3000
UPDATE STUDENT SET address = 'ABC' WHERE StudentID=3000
UPDATE STUDENT SET Phone = 'XYZ' WHERE StudentID=3000
UPDATE STUDENT SET email = 'ERX' WHERE StudentID=3000

UPDATE STUDENT SET name = 'Shivi' WHERE StudentID=3001
UPDATE STUDENT SET address = 'EFG' WHERE StudentID=3001
UPDATE STUDENT SET Phone = 'LKI' WHERE StudentID=3001
UPDATE STUDENT SET email = 'OPI' WHERE StudentID=3001

ALTER TABLE TUTOR ADD name varchar(25);
ALTER TABLE TUTOR ADD address varchar(25);
ALTER TABLE TUTOR ADD Phone varchar(25);
ALTER TABLE TUTOR ADD email varchar(25);

UPDATE TUTOR SET name = 'Manny' WHERE TutorId =100
UPDATE TUTOR SET address = 'XYZ' WHERE TutorId =100
UPDATE TUTOR SET Phone = 'ABC' WHERE TutorId =100
UPDATE TUTOR SET email = 'KLO' WHERE TutorId =100

UPDATE TUTOR SET name = 'KAL' WHERE TutorId =101
UPDATE TUTOR SET address = 'XYZ' WHERE TutorId =101
UPDATE TUTOR SET Phone = 'ABC' WHERE TutorId =101
UPDATE TUTOR SET email = 'KLO' WHERE TutorId =101


Select * from Student
select * from Tutor

--8
UPDATE STUDENT SET name = 'Bhatt' WHERE StudentID =3002
UPDATE STUDENT SET name = 'Bob' WHERE STUDENTID   =3003
UPDATE STUDENT SET name = 'Kitty' WHERE STUDENTID =3004
UPDATE STUDENT SET name = 'Tillu' WHERE STUDENTID = 3005
UPDATE STUDENT SET name = 'killu' WHERE STUDENTID = 3006
UPDATE STUDENT SET name = 'sillu' WHERE STUDENTID = 3007


select distinct s.name, t.[month], t.lessons, t.[hours] from student s, TutorReport t where studentID in 
(select DISTINCT studentID from MatchHistory m , tutorReport t  
where m.matchID = t.matchID and t.[month] ='06/08/2008') 


select s.name, mh.studentID ,[hours], lessons from student s, MatchHistory  mh inner join TutorReport tr on mh.matchID = tr.matchID
where tr.[month] = '06/08/2008'
 and s.studentID = mh.studentID


--9
UPDATE TUTOR SET name = 'Sapna' WHERE TutorId =102
UPDATE TUTOR SET name = 'Swati' WHERE TutorId =103
UPDATE TUTOR SET name = 'Yash' WHERE TutorId =104
UPDATE TUTOR SET name = 'Mayank' WHERE TutorId =105
UPDATE TUTOR SET name = 'Dharmik' WHERE TutorId =106
UPDATE TUTOR SET name = 'Aditya' WHERE TutorId =107


SELECT name FROM TUTOR WHERE [status] = 'Active' group by name;

--10
select DISTINCT  tutorID from MatchHistory 
where matchID not in(select matchID from TutorReport )



--11
CREATE PROCEDURE GetActiveTutor
AS  
BEGIN  
  SELECT name FROM TUTOR WHERE [status] = 'Active' group by name;
END 

execute GetActiveTutor;
IF @TutorID IN (100,103,104,106) and @status = 'Active'
	 SET @status = 'Y'
	 ELSE 

	 SET @status = 'N'

--12

CREATE FUNCTION ActiveTutorDetails(@TutorID INT)
RETURNS varchar(25)
AS 
BEGIN
	 DECLARE
	 @statusValue varchar(25)
	 IF @TutorID IN (100,103,104,106)

	 SET @statusValue = 'Y'
	 ELSE 

	 SET @statusValue = 'N' 

	
    RETURN (@statusValue)
END;

select  name, dbo.ActiveTutorFunctions6(102) as Availability from Tutor 
where status = 'Dropped'





