using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public class Defaults
    {
        public static int MemberTypeSpecDurationID
        {
            get
            {
                int id = 1;
                if (System.Configuration.ConfigurationManager.AppSettings["DefaultMemberTypeSpecDurationID"] != null)
                    id = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["DefaultMemberTypeSpecDurationID"]);
                return id;
            }
        }

        public static int RoomTypeSpecDurationID
        {
            get
            {
                int id = 1;
                if (System.Configuration.ConfigurationManager.AppSettings["DefaultRoomTypeSpecDurationID"] != null)
                    id = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["DefaultRoomTypeSpecDurationID"]);
                return id;
            }
        }
        public static int VIPRoomTypeSpecID
        {
            get
            {
                int id = 4;
                if (System.Configuration.ConfigurationManager.AppSettings["VIPRoomTypeSpecID"] != null)
                    id = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["VIPRoomTypeSpecID"]);
                return id;
            }
        }

        public static string AdsPicFolder
        {
            get
            {
                string path = "files/ads";
                if (System.Configuration.ConfigurationManager.AppSettings["mailadpics"] != null)
                {
                    path = System.Configuration.ConfigurationManager.AppSettings["mailadpics"].ToString();
                }
                return path;
            }
        }
    }
}
