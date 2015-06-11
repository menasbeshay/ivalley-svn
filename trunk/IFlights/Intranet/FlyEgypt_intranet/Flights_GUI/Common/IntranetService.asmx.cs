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

            //return Nms;
            SetContentResult(Nms);
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
}
