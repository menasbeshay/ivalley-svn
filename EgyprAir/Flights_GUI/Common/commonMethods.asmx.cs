using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Web.Script.Serialization;
namespace Flights_GUI.Common
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
        /// Get All Countries
        /// </summary>
        /// <returns>ComboResponse object with List of all Countries</returns>
        public void GetAirports()
        {            
            AirPort airports = new AirPort();
            airports.LoadAll();
            
            List<string> AllAirports = airports.DefaultView.Table.AsEnumerable().Select(row => row.Field<string>("IATACode")).ToList();

            SetContentResult(AllAirports);
            //return _response;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get flight sectors
        /// </summary>
        /// <returns>Response object with List of all Countries</returns>
        public void GetFlightSectors(int FlightID)
        {
            Sector sectors = new Sector();
            sectors.GetSectorsByFlightID(FlightID);


            List<Models.Sector> AllSectors = sectors.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.Sector
                {
                    //SectorID = Convert.ToInt32(row["SectorID"].ToString()),
                    SectorDate = Convert.ToDateTime(row["SectorDate"].ToString()),
                    FlightNo = row["FlightNo"].ToString()
                };
            }).ToList();

            SetContentResult(AllSectors);
            //return _response;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get flight sectors
        /// </summary>
        /// <returns>Response object with List of all Countries</returns>
        public void GetSectorsByAircraftRouteID(int ID)
        {
            AircraftRouteDetails ACsectors = new AircraftRouteDetails();
            ACsectors.GetSectorsByAircraftRouteID(ID);

            List<Models.Sector> AllSectors = ACsectors.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.Sector
                {
                    AircraftRouteID = Convert.ToInt32(row["AircraftRouteID"].ToString()),
                    SectorID = Convert.ToInt32(row["SectorID"].ToString()),
                    SectorDate = DateTime.Parse(row["SectorDate"].ToString()),
                    FlightNo = row["FlightNo"].ToString(),
                    FromID = row["Fcode"].ToString(),
                    ToID = row["TCode"].ToString(),
                    STD = Convert.ToDateTime(row["STD"].ToString()),
                    STA = Convert.ToDateTime(row["STA"].ToString()),
                };
            }).ToList();

            SetContentResult(AllSectors);
            //return _response;
        }
        
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get flight sectors
        /// </summary>
        /// <returns>Response object with List of all Countries</returns>
        public void SaveSectorsToAircraftRoute(List<Models.Sector> Allsectors)
        {           
            
            AircraftRouteDetails ACsectors = new AircraftRouteDetails();
            foreach (Models.Sector item in Allsectors)
            {
                Sector sector = new Sector();
                if ( item.SectorID == 0)
                {
                    sector.AddNew();
                }
                else
                {
                    sector.LoadByPrimaryKey(item.SectorID);
                }
                AirPort from = new AirPort();
                AirPort to = new AirPort();

                if(from.GetAirportByCode(item.FromID))
                    sector.From_AirportID = from.AirPortID;
                
                if(to.GetAirportByCode(item.ToID))
                    sector.To_AirportID = to.AirPortID;

                sector.SectorDate = item.SectorDate;
                sector.FlightNo = item.FlightNo;
                sector.AirCraft_AirPlaneID = item.AircraftID;
                sector.STD = item.STD;
                sector.STA = item.STA;
                sector.Save();
                
                if (!ACsectors.GetBySectorIDAndAircraftRouteID(item.AircraftRouteID, sector.SectorID))                
                {
                    ACsectors.AddNew();
                }
                ACsectors.AircraftRouteID = item.AircraftRouteID;
                ACsectors.SectorID = sector.SectorID;
                ACsectors.Save();
            }

            
            //return true;
            //return _response;
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
}
