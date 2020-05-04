INSERT INTO STUDENT (STUDENTID, STUDENTNAME) VALUES (38214, 'Letersky');
INSERT INTO STUDENT (STUDENTID, STUDENTNAME) VALUES (54907, 'Altvater');
INSERT INTO STUDENT (STUDENTID, STUDENTNAME) VALUES (66324, 'Aiken');
INSERT INTO STUDENT (STUDENTID, STUDENTNAME) VALUES (70542, 'Marra');

select * from Student 

INSERT INTO Faculty (FacultyID ,FacultyName ) VALUES (2143, 'Birkin');
INSERT INTO Faculty (FacultyID ,FacultyName ) VALUES (3467, 'Berndt');
INSERT INTO Faculty (FacultyID ,FacultyName ) VALUES (4756, 'Collins');

select * from Faculty 

INSERT INTO COURSE (CourseID , CourseName ) VALUES ('ISM 3113' , 'SystAnalysis');
INSERT INTO COURSE (CourseID , CourseName ) VALUES ('ISM 3112' , 'Syst Design');
INSERT INTO COURSE (CourseID , CourseName ) VALUES ('ISM 4212' , 'Database');
INSERT INTO COURSE (CourseID , CourseName ) VALUES ('ISM 4930' , 'Networking');

select * from COURSE 

INSERT INTO QUALIFIED  (FacultyID ,CourseID ,DateQualified ) VALUES (2143,'ISM 3112', '01-09-1988');
INSERT INTO QUALIFIED  (FacultyID ,CourseID ,DateQualified ) VALUES (2143,'ISM 3113', '01-09-1988');
INSERT INTO QUALIFIED  (FacultyID ,CourseID ,DateQualified ) VALUES (3467,'ISM 4212', '01-09-1995');
INSERT INTO QUALIFIED  (FacultyID ,CourseID ,DateQualified ) VALUES (3467,'ISM 4930', '01-09-1996');
INSERT INTO QUALIFIED  (FacultyID ,CourseID ,DateQualified ) VALUES (4756,'ISM 3113', '01-09-1991');
INSERT INTO QUALIFIED  (FacultyID ,CourseID ,DateQualified ) VALUES (4756,'ISM 3112', '01-09-1991');

select * from QUALIFIED

INSERT INTO [SECTION] (SectionNo ,Semester ,CourseID ) VALUES (2712, 'I-2008' , 'ISM 3113');
INSERT INTO [SECTION] (SectionNo ,Semester ,CourseID ) VALUES (2713, 'I-2008' , 'ISM 3113');
INSERT INTO [SECTION] (SectionNo ,Semester ,CourseID ) VALUES (2714, 'I-2008' , 'ISM 4212');
INSERT INTO [SECTION] (SectionNo ,Semester ,CourseID ) VALUES (2715, 'I-2008' , 'ISM 4930');

select * from [Section]

INSERT INTO REGISTRATION  (StudentID ,SectionNo ,Semester ) VALUES (38214, 2714,'I-2008');
INSERT INTO REGISTRATION  (StudentID ,SectionNo ,Semester ) VALUES (54907, 2714,'I-2008');
INSERT INTO REGISTRATION  (StudentID ,SectionNo ,Semester ) VALUES (54907, 2715,'I-2008');
INSERT INTO REGISTRATION  (StudentID ,SectionNo ,Semester ) VALUES (66324, 2713,'I-2008');

select * from REGISTRATION 
















