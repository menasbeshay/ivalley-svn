
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using System.Collections.Specialized;
using EDU.DAL;
namespace EDU.BLL
{
	public class ApplicationData : _ApplicationData
	{
		public ApplicationData()
		{
		
		}

        public virtual bool GetAllApplications()
        {
            ListDictionary parameters = new ListDictionary();
            return LoadFromSql("GetAllApplications", parameters);
        }

        public virtual bool GetApplicationByStudentID(int studentId)
        {
            this.Where.StudentID.Value = studentId;
            this.Where.StudentID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            return this.Query.Load();
        }

	}
}
