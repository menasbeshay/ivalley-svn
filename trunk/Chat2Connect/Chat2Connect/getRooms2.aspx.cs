using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;


namespace Chat2Connect
{
    public partial class getRooms2 : System.Web.UI.Page
    {
        public string localParams
        {
            get
            {
                if (Request.Form["data_related"] != null)
                    return Request.Form["data_related"].ToString();
                return string.Empty;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            BindRooms();
        }

        private void BindRooms()
        {
            string[] myparams = null;
            if (!string.IsNullOrEmpty(localParams))
            {
                myparams = localParams.Split('&');
            }

            if (myparams.Length > 0)
            {
                if (myparams[0] == "cat=1")
                {
                    int cid = Convert.ToInt32(myparams[1].Substring(2));
                    Room rooms = new Room();
                    rooms.GetRoomsByCategoryID(cid);
                    uiRepeaterRooms.DataSource = rooms.DefaultView;
                    uiRepeaterRooms.DataBind();
                }
                else if (myparams[0] == "subcat=1")
                {
                    int scid = Convert.ToInt32(myparams[1].Substring(2));
                    Room rooms = new Room();
                    rooms.GetRoomsBySubCategoryID(scid);
                    uiRepeaterRooms.DataSource = rooms.DefaultView;
                    uiRepeaterRooms.DataBind();
                }
                else if (myparams[0] == "vip=1")
                {
                    Room rooms = new Room();
                    rooms.GetPremiumRooms();
                    uiRepeaterRooms.DataSource = rooms.DefaultView;
                    uiRepeaterRooms.DataBind();
                }
                else if (myparams[0] == "cb=1")
                {
                    Room rooms = new Room();
                    rooms.GetRoomsByCreatorID(BLL.Member.CurrentMember.MemberID);
                    uiRepeaterRooms.DataSource = rooms.DefaultView;
                    uiRepeaterRooms.DataBind();
                }
                else if (myparams[0] == "fav=1")
                {
                    Room rooms = new Room();
                    rooms.GetFavoriteByMemberID(BLL.Member.CurrentMember.MemberID);
                    uiRepeaterRooms.DataSource = rooms.DefaultView;
                    uiRepeaterRooms.DataBind();
                }
                else if (myparams[0] == "s=1") // search rooms
                {
                    string filterText = myparams[1].Substring(3); // st=
                    Room rooms = new Room();
                    rooms.SearchRooms(filterText);
                    uiRepeaterRooms.DataSource = rooms.DefaultView;
                    uiRepeaterRooms.DataBind();
                }

            }
        }

        public string GetRoomRate(int rate)
        {
            string rateString = "";
            for (int i = 0; i < 5; i++)
            {

                if (i < rate)
                    rateString += "<i class='icon icon-star GoldRate'></i>";
                else
                    rateString += "<i class='icon icon-star-empty GoldRate'></i>";
            }
            return rateString;
        }

    }
}