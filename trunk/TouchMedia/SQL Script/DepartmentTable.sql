create table Department 
(
DepartmentID int not null identity(1,1) Primary key ,
DepartmentName nvarchar(300)
)

GO

alter table DeliveryOrder 
add DepartmentID int foreign key references Department(DepartmentID)

GO