using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class RoomsReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var lstStatus = Helper.EnumUtil.GetValues<Helper.Enums.RowStatus>().Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
                lstRoomStatus.DataValueField = "ID";
                lstRoomStatus.DataTextField = "Name";
                lstRoomStatus.DataSource = lstStatus;
                lstRoomStatus.DataBind();
                lstRoomStatus.Items.Insert(0, new ListItem("", ""));
            }
        }

        protected void uiLinkButtonSearch_Click(object sender, EventArgs e)
        {
            BindResult();
        }

        protected void grdResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdResult.PageIndex = e.NewPageIndex;
            BindResult();
        }

        private void BindResult()
        {
            BLL.Room rooms = new BLL.Room();
            DateTime? dateFrom = null, dateTo = null;
            if (!String.IsNullOrEmpty(txtCreatedFrom.Text))
            {
                dateFrom = Helper.Date.ToDate(txtCreatedFrom.Text);
            }
            if (!String.IsNullOrEmpty(txtCreatedTo.Text))
            {
                dateTo = Helper.Date.ToDate(txtCreatedTo.Text);
            }
            int? status = null;
            if (!String.IsNullOrEmpty(lstRoomStatus.SelectedValue))
                status = Helper.TypeConverter.ToInt32(lstRoomStatus.SelectedValue);
            rooms.Search(dateFrom,dateTo,status);

            grdResult.DataSource = rooms.DefaultView;
            grdResult.DataBind();
        }
    }
}