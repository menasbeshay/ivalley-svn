
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using Pricing.DAL;

namespace Pricing.BLL
{
	public class Substances : _Substances
	{
		public Substances()
		{
		
		}

        public void GetByName(string _GenericName)
        {
            Where.NAME.Value = "%" + _GenericName + "%";
            Where.NAME.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Like;
            Query.Load();
        }
	}
}
