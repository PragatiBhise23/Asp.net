
ALTER procedure[dbo].[pr_employeemaster]
(@employeeid int,
@employeename varchar(50)='',
@designationid varchar(5)='0',
@grosssalary varchar(40)='0.00',
@deductions varchar(40)='0.00',
@netsalary varchar(40)='0.00',
@IsActive varchar(1)='Y',
@Action varchar(30)
)
AS 
BEGIN
if @action='select'
begin
if @employeeid=0
select * from employeemaster
else
select * from employeemaster where employeeid=@employeeid
END

if @action='insert'
begin
insert into employeemaster
(employeeid,employeename,designationid,grosssalary,deductions,netsalary,IsActive)
select @employeeid,@employeename,@designationid,@grosssalary,@deductions,@netsalary,@IsActive
end
if @action='update'
begin
update employeemaster
set employeename=@employeename,
designationid=@designationid,
grosssalary=@grosssalary,
deductions=@deductions,
netsalary=@netsalary,
IsActive=@IsActive where employeeid=@employeeid
end

if @action='delete'
begin
delete from employeemaster where employeeid=@employeeid0
end
if @action='getmax'
begin
select max(employeeid)+1 from employeemaster
end
END

