
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using E3zmni.DAL;
using System.Collections.Specialized;
namespace E3zmni.BLL
{
	public class Dimension : _Dimension
	{
		public Dimension()
		{
		
		}

        public virtual bool GetAllDims()
        {
            ListDictionary parameters = new ListDictionary();
            return LoadFromSql("GetAllDims", parameters);

        }
	}
}