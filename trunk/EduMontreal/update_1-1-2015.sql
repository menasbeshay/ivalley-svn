Alter Table ApplicationStatusHistory
Add PaymentDate DateTime,
	PaymentAmount decimal(8,2),
	TrxID nvarchar(20),
	CardNo nvarchar(16),
	CardType nvarchar(30)
	
	

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAppReceipt' and
		        xtype = 'P')
Drop Procedure GetAppReceipt 
Go
Create Procedure GetAppReceipt @StatusHistoryID int 
As 

Select * from ApplicationStatusHistory
where StatusHistoryID = @StatusHistoryID
GO