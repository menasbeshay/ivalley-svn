using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin.UserControls.Room
{
    public partial class RoomType : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.RoomType roomType = new BLL.RoomType();
                roomType.LoadAll();
                drpRoomType.DataValueField = BLL.RoomType.ColumnNames.RoomTypeID;
                drpRoomType.DataTextField = BLL.RoomType.ColumnNames.Name;
                drpRoomType.DataSource = roomType.DefaultView;
                drpRoomType.DataBind();
            }
        }

        public int RoomID
        {
            get
            {
                return Convert.ToInt32(ViewState["SelectedRoomID"]);
            }
            set
            {
                ViewState["SelectedRoomID"] = value;
                BindRoomInfo();
            }
        }

        private void BindRoomInfo()
        {
            
        }

        protected void btnUpdateRoomType_Click(object sender, EventArgs e)
        {

        }
    }
}