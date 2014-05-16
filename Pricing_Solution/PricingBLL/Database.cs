using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Products.DAL;
using System.Configuration;

    public static class Connection
    {
        public static string ConnectionString
        {
            get
            {
			 return  System.Configuration.ConfigurationSettings.AppSettings["dbConnection"].ToString();

            }
        }
    }

    public class Database
    {

        public static DataTable SearchCases(string _submitDateFrom, string _submitDateTo, string _tradeName, int _CompanyID, int _committeTypeID,
                                         string _fileNO, int _fileTypeID, int _statusID
                                        , string _generic1, string _generic2, string _generic3, string _generic4, string _generic5)
        {
            SqlParameter[] parm = new SqlParameter[13];
            parm[0] = new SqlParameter("@submitDateFrom", _submitDateFrom);
            parm[1] = new SqlParameter("@submitDateTo", _submitDateTo);
            parm[2] = new SqlParameter("@tradeName", _tradeName);
            parm[3] = new SqlParameter("@CompanyID", _CompanyID);
            parm[4] = new SqlParameter("@committeTypeID", _committeTypeID);
            parm[5] = new SqlParameter("@fileNO", _fileNO);            
            parm[6] = new SqlParameter("@fileTypeID", _fileTypeID);
            parm[7] = new SqlParameter("@statusID", _statusID);
            parm[8] = new SqlParameter("@parmSubstance1", _generic1);
            parm[9] = new SqlParameter("@parmSubstance2", _generic2);
            parm[10] = new SqlParameter("@parmSubstance3", _generic3);
            parm[11] = new SqlParameter("@parmSubstance4", _generic4);
            parm[12] = new SqlParameter("@parmSubstance5", _generic5);

            return SqlHelper.ExecuteDataset(Connection.ConnectionString, CommandType.StoredProcedure, "SearchPricingSchedual", parm).Tables[0];

        }

    }

