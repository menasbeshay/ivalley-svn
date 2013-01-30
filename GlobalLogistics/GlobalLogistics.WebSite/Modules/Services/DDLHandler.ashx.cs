using System;
using System.Collections.Generic;
using System.Web;
using System.Text;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.Modules.Services
{
    /// <summary>
    /// Summary description for DDLHandler
    /// </summary>
    public class DDLHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string type = context.Request.QueryString["t"].ToString();
            string lang = context.Request.QueryString["lang"].ToString();
            StringBuilder List = new StringBuilder();
            List.Append("[");
            
            switch (type)
            {
                case "a":
                    AirPorts air = new AirPorts();
                    air.LoadAll();
                    air.DefaultView.Sort = "EnName";                                        
                    
                    
                    if (lang == "ar")
                    {
                        List.Append("{");
                        List.Append("\"EnName\" : \"إختر المطار\" ,");
                        List.Append("\"AirportID\" : \"0\"");
                        List.Append("},");
                    }
                    else if (lang == "en")
                    {
                        List.Append("{");
                        List.Append("\"EnName\" : \"Select Airport\" ,");
                        List.Append("\"AirportID\" : \"0\"");
                        List.Append("},");
                    }
                    foreach (DataRow row in air.DefaultView.Table.Rows)
                    {
                        List.Append("{");
                        List.Append("\"EnName\" : \"" + row["EnName"].ToString() + "\" ,");
                        List.Append("\"AirportID\" : \"" + row["AirportID"].ToString() + "\"");
                        List.Append("},");
                    }
                    List.Remove(List.Length - 1, 1);
                    List.Append("]");
                    break;
                case "s":
                    SeaPorts sea = new SeaPorts();
                    sea.LoadAll();
                    sea.DefaultView.Sort = "EnName";
                    
                    
                    if (lang == "ar")
                    {
                        List.Append("{");
                        List.Append("\"EnName\" : \"إختر الميناء\" ,");
                        List.Append("\"SeaPortID\" : \"0\"");
                        List.Append("},");
                    }
                    else if (lang == "en")
                    {
                        List.Append("{");
                        List.Append("\"EnName\" : \"Select Seaport\" ,");
                        List.Append("\"SeaPortID\" : \"0\"");
                        List.Append("},");
                    }
                    foreach (DataRow row in sea.DefaultView.Table.Rows)
                    {
                        List.Append("{");
                        List.Append("\"EnName\" : \"" + row["EnName"].ToString() + "\" ,");
                        List.Append("\"SeaPortID\" : \"" + row["SeaPortID"].ToString() + "\"");
                        List.Append("},");
                    }
                    List.Remove(List.Length - 1, 1);
                    List.Append("]");
                    break;
                default :
                    break;
            }
            
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            context.Response.Write(List.ToString());
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}