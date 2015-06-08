using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flights_GUI.Models
{
    public class Sector
    {
        public int AircraftRouteID { get; set; }
        public int AircraftID { get; set; }
        public int SectorID { get; set; }
        public DateTime SectorDate { get; set; }
        public string FlightNo { get; set; }
        public string FromID { get; set; }
        public string ToID { get; set; }
        public DateTime STD { get; set; }
        public DateTime STA { get; set; }


    }
}