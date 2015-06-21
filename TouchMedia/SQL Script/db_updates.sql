alter table joborder
add ClientID int

alter table joborderstatus 
Add JobOrderStatusNameAr nvarchar(300),
	StatusClass nvarchar(100)