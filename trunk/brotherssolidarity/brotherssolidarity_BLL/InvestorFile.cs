
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using DAL;
namespace BLL
{
	public class InvestorFile : _InvestorFile
	{
		public InvestorFile()
		{
		
		}

        public virtual bool GetFilesByCatID(int CatID)
        {
            this.Where.InvestorCatID.Value = CatID;
            this.Where.InvestorCatID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            return this.Query.Load();
        }
	}
}
