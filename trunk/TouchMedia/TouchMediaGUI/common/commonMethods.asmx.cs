using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using BLL;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
namespace TouchMediaGUI.common
{
    /// <summary>
    /// Summary description for commonMethods
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class commonMethods : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Status
        /// </summary>
        /// <returns>object with List of all statuses</returns>
        public void GetJOStatuses()
        {
            JobOrderStatus statues = new JobOrderStatus();
            statues.LoadAll();

            List<Models.StatusModel> AllStatuses = statues.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.StatusModel 
                {
                    StatusID = Convert.ToInt32(row[JobOrderStatus.ColumnNames.JobOrderStatusID].ToString()),
                    StatusName = row[JobOrderStatus.ColumnNames.JobOrderStatusName].ToString(),
                    StatusNameAr = row[JobOrderStatus.ColumnNames.JobOrderStatusNameAr].ToString(),
                    StatusClass = row[JobOrderStatus.ColumnNames.StatusClass].ToString()
                };
            }).ToList();

            SetContentResult(AllStatuses);
            //return _response;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Designers
        /// </summary>
        /// <returns>object with List of all Designers</returns>
        public void GetJODesigners()
        {
            GeneralLookup Designers = new GeneralLookup();
            Designers.LoadByCategoryID(Category.Designers);

            List<Models.Designer> AllDesigers = Designers.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.Designer
                {
                    DesignerID = Convert.ToInt32(row[GeneralLookup.ColumnNames.GeneralLookupID].ToString()),
                    CategoryID = Convert.ToInt32(row[GeneralLookup.ColumnNames.CategoryID].ToString()),
                    DesignerName = row[GeneralLookup.ColumnNames.Name].ToString(),
                    Address = row[GeneralLookup.ColumnNames.Address].ToString(),
                    Email = row[GeneralLookup.ColumnNames.Email].ToString(),
                    Telephone = row[GeneralLookup.ColumnNames.Telephone].ToString(),

                };
            }).ToList();

            SetContentResult(AllDesigers);
            //return _response;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Designers
        /// </summary>
        /// <returns>object with List of all Designers</returns>
        public void GetDesignDetails(int ID)
        {
            DesignDetails details = new DesignDetails();
            details.GetDesignDetailsByJOID(ID);

            List<Models.DesignDetail> Alldetails = details.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.DesignDetail
                {
                    DesignDetailsID = Convert.ToInt32(row[DesignDetails.ColumnNames.DesignDetailsID].ToString()),
                    DesignerID = Convert.ToInt32(row[DesignDetails.ColumnNames.DesignerID].ToString()),
                    StartDate = Convert.ToDateTime(row[DesignDetails.ColumnNames.StartDate].ToString()),
                    EndDate = Convert.ToDateTime(row[DesignDetails.ColumnNames.EndDate].ToString()),
                    JobOrderStatusID = Convert.ToInt32(row[DesignDetails.ColumnNames.JobOrderStatusID].ToString()),
                    StatusClass = row["StatusClass"].ToString(),
                    StatusName = row["StatusName"].ToString(),

                };
            }).ToList();

            SetContentResult(Alldetails);
            //return _response;
        }


        private void SetContentResult(dynamic data)
        {
            string result = JsonConvert.SerializeObject(data, Formatting.None, new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" });
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
            HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
            HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.
        }
    }
}
