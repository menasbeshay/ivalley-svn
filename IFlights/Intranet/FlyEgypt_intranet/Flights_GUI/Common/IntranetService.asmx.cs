using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Flight_BLL;
using System.Data;
using System.Web.Script.Services;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Web.Security;
namespace Flights_GUI.Common
{
    /// <summary>
    /// Summary description for IntranetService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class IntranetService : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
        public void GetAvalName(string term)
        {
            UsersProfiles upro = new UsersProfiles();
            upro.getNamesList(term);

            List<NameListDetails> Nms = upro.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new NameListDetails
                {
                    label = row["FullName"].ToString(),
                    value = row["Email"].ToString()
                };

            }).ToList();

            SetContentResult(Nms);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
        public void GetManualVersions(int ID)
        {
            ManualVersion versions = new ManualVersion();
            versions.GetVersionsByManualID(ID);

            List<Version> AllVersions = versions.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Version
                {
                    Title = row["Title"].ToString(),
                    IssueNumber = row["IssueNumber"].ToString(),
                    IssueDate = DateTime.Parse(row["IssueDate"].ToString()),
                    RevisionNumber = row["RevisionNumber"].ToString(),
                    RevisionDate = DateTime.Parse(row["RevisionDate"].ToString()),
                    UpdatedByName = row["UpdatedByName"].ToString(),
                    LastUpdatedDate = DateTime.Parse(row["LastUpdatedDate"].ToString()),
                    Path = row["Path"].ToString()
                };

            }).ToList();
            UsersNofications usNot = new UsersNofications();

            usNot.MarkNotificationsReadByManualVersionID(new Guid(Membership.GetUser(Context.User.Identity.Name).ProviderUserKey.ToString()),ID);
            SetContentResult(AllVersions);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
        public void GetScheduleVersions(int ID)
        {
            ScheduleVersion versions = new ScheduleVersion();
            versions.GetVersionsByScheduleID(ID);

            List<Version> AllVersions = versions.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Version
                {
                    Title = row["Title"].ToString(),
                    IssueNumber = row["IssueNumber"].ToString(),
                    IssueDate = DateTime.Parse(row["IssueDate"].ToString()),
                    RevisionNumber = row["RevisionNumber"].ToString(),
                    RevisionDate = DateTime.Parse(row["RevisionDate"].ToString()),
                    UpdatedByName = row["UpdatedByName"].ToString(),
                    LastUpdatedDate = DateTime.Parse(row["LastUpdatedDate"].ToString()),
                    Path = row["Path"].ToString()
                };
            }).ToList();
            UsersNofications usNot = new UsersNofications();

            usNot.MarkNotificationsReadByScheduleVersionID(new Guid(Membership.GetUser(Context.User.Identity.Name).ProviderUserKey.ToString()), ID);
            SetContentResult(AllVersions);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
        public void GetFormVersions(int ID)
        {
            FromVersion versions = new FromVersion();
            versions.GetVersionsByFormID(ID);

            List<Version> AllVersions = versions.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Version
                {
                    Title = row["Title"].ToString(),
                    IssueNumber = row["IssueNumber"].ToString(),
                    IssueDate = DateTime.Parse(row["IssueDate"].ToString()),
                    RevisionNumber = row["RevisionNumber"].ToString(),
                    RevisionDate = DateTime.Parse(row["RevisionDate"].ToString()),
                    UpdatedByName = row["UpdatedByName"].ToString(),
                    LastUpdatedDate = DateTime.Parse(row["LastUpdatedDate"].ToString()),
                    Path = row["Path"].ToString()
                };

            }).ToList();
            UsersNofications usNot = new UsersNofications();
            usNot.MarkNotificationReadByFormVersionID(new Guid(Membership.GetUser(Context.User.Identity.Name).ProviderUserKey.ToString()), ID);
            SetContentResult(AllVersions);
        }

        private void SetContentResult(dynamic data)
        {
            string result = Newtonsoft.Json.JsonConvert.SerializeObject(data, Formatting.None, new IsoDateTimeConverter() { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" });
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
            HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
            HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.
        }
    }

    public class NameListDetails
    {

        public string label { get; set; }
        public string value  { get; set; }
    }


    public class Version 
    {
        public string Title { get; set; }
        public string IssueNumber { get; set; }
        public DateTime IssueDate { get; set; }
        public string RevisionNumber { get; set; }
        public DateTime RevisionDate { get; set; }
        public string UpdatedByName { get; set; }
        public DateTime LastUpdatedDate { get; set; }
        public string Path { get; set; }

    }
}
