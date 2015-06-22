alter table DeliveryOrder 
alter column DriverNationID 
nvarchar(100) 

GO 

alter table deliveryOrder 
add DeliveryOrderDate datetime ,
DepartmentResponsableName nvarchar(300) ,
CarType nvarchar (300)

