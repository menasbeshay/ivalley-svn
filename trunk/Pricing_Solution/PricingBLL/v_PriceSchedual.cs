
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using View;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;// We should use the namespace of Data access layer generated form business entity

namespace Pricing.BLL
{
	public class v_PriceSchedual : _v_PriceSchedual
	{
        public v_PriceSchedual()
		{
		
		}

        public void SearchByTradeID(int _tradeID)
        {
            this.Where.TradePricingID.Value = _tradeID;
            this.Where.TradePricingID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

            this.Query.Load();
        }

        public virtual bool GetTopPricingSchedual(int CompanyID)
        {
            return LoadFromRawSql(@"Select top 5 * from v_PriceSchedual where CompanyID = {0}", CompanyID);

        }

        public bool GetAllPricingInboxForCompany(int CompanyID,string dateFrom,string dateTo,int commTypeID,int statusID,string TradeName)
        {
            return LoadFromRawSql(@"EXEC [dbo].[FilterCompanyInbox] @companyID = {0},@dateFrom ={1},@dateTo = {2},@committeeTypeID = {3},@statusID = {4},@tradeName = {5}",
                                                                    CompanyID,dateFrom,dateTo,commTypeID,statusID,TradeName);
        }
	}
}
