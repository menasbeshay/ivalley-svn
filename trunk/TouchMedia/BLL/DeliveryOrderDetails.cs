
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using DAL;
namespace BLL
{
	public class DeliveryOrderDetails : _DeliveryOrderDetails
	{
		public DeliveryOrderDetails()
		{
		
		}
        public virtual bool getDetails(int DOID)
        {
            return LoadFromRawSql("SELECT * FROM DeliveryOrderDetails WHERE {0} = DeliveryOrderID ", DOID);
        }
        public bool getAllDeliveryOrderDetails(int DOID)
        {
            return LoadFromRawSql(@"select DD.*, S.DeliveryOrderStatusNameAr StatusNameAr, S.DeliveryOrderStatusName StatusName, S.StatusClass  from DeliveryOrderDetails DD 
                                    inner join DeliveryOrderStatus S on DD.DeliveryOrderStatusID = S.DeliveryOrderStatusID
                                     WHERE DD.DeliveryOrderID = {0}
                                    order by createdDate desc ", DOID);
        }
	}
}
