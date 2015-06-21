alter table joborder
add ClientID int

alter table joborderstatus 
Add JobOrderStatusNameAr nvarchar(300),
	StatusClass nvarchar(100)

alter table DeliveryOrderStatus 
Add DeliveryOrderStatusNameAr nvarchar(300),
	StatusClass nvarchar(100)