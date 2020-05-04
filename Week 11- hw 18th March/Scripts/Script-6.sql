CREATE PROCEDURE GetEmployeeInfo_1
@dept_no char(4)
AS  
BEGIN  
  select emp_no, emp_fname + ' ' + emp_lname as employee_name , s.dept_name from employee e , subdivision s  
  where e.dept_no  = s.dept_no 
 and e.dept_no = @dept_no
END 

exec GetEmployeeInfo_1 @dept_no = 'D1' 


---2
create procedure IncreaseBudgetAmount
(
@project_no char(4),
@new_budget float , 
@message varchar(25) OUTPUT
)
AS

	if @project_no= null
	BEGIN 
	print 'Invalid Project Number'
	END 
	
	else if @new_budget > sum(budget) as budget_amount 
	SET @new_budget= budget_amount
	print 'budget amount increased'
	else if @new_budget <= budget_amount
	print 'New budget must be greater than the current budget'
	
	END


CREATE PROCEDURE IncreaseBudgetAmout (@project_no char(4), @new_budget float , @message varchar(25) OUTPUT )
AS
BEGIN
   IF EXISTS (SELECT * FROM project WHERE project_no=@project_no)
       BEGIN
           IF @new_budget > (SELECT budget FROM project WHERE project_no=@project_no)
               BEGIN
                   UPDATE project
                   SET budget=@new_budget
                   WHERE project_no=@project_no
      
                   PRINT 'budget amount increased.'
               END
  
           ELSE
               BEGIN
                   PRINT 'New budget must be greater than the current budget.'
               END
       END
          
   ELSE
       BEGIN
           PRINT 'Invalid Project Number.'
       END
END          

EXEC IncreaseBudgetAmout @project_no = 'p1', @new_budget = 60000, @message = 'Project Details';



select * from project p 


CREATE FUNCTION GetBudgetAmount (@project_name nvarchar(20))

RETURNS int

AS

BEGIN

Declare @budg int;

SELECT @budg= budget

FROM project

WHERE project_name='CRM System';

IF(@budg IS NULL)

SET @budg= 0;

RETURN @budg;

END;

SELECT DISTINCT dbo.GetBudgetAmount('CRM system') FROM project 






where budget = GetBudgetAmount;

select * from project 
where budget = GetBudgetAmount('CRM system');




















