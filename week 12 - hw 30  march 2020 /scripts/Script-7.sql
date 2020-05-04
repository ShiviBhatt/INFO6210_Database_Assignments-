ALTER TABLE employee
ADD city varchar(25);

select * from employee e 
select * from project p 
select * from works_on wo 

update employee  set city =   'BANGALORE'
where dept_no = 'D1'

CREATE PROCEDURE GetEmployees @country varchar(25)
AS  
BEGIN  
  SELECT emp_fname, emp_lname, city, country FROM employee WHERE country = @country;
END 

EXEC GetEmployees @country = 'USA'



CREATE FUNCTION GetCountry (@city varchar(25))
RETURNS varchar(25)
AS 
BEGIN
	 DECLARE
	 @country varchar(25)
	 select @country = country from 
	 employee
	 where @city = city
	 
	 

	
    RETURN (@country)
END;

SELECT  getdate() from dual

select DISTINCT  dbo.GetCountry('TOKYO') as Country from Employee 




EXEC GetEmployees @country = 'USA'

CREATE PROCEDURE AssignWork_2  (@emp_no int , @project_no char(4), @job varchar(25)
)
AS  
BEGIN  
 INSERT INTO works_on (emp_no , project_no , job, enter_date ) values (@emp_no, @project_no, @job, getdate())
 SELECT emp_fname + emp_lname from employee e
 
 
END 

exec AssignWork @emp_no = 28559, @project_no = 'p2' , @job = 'ENG'




CREATE TABLE PRODUCT1(
Product_ID INTEGER NOT NULL,
Product_Desc varchar(25),
Product_Price float,
Product_Type varchar(10),
CONSTRAINT PK_Product  PRIMARY KEY (Product_ID),
CONSTRAINT CHK_Product CHECK (Product_Type= 'I' OR Product_Type= 'P')
)



















