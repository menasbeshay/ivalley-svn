using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class OutStandings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllOutstanding();
            uiDataListOutStanding.DataSource = ds;
            uiDataListOutStanding.DataBind();
        }

        protected void uiDataListOutStanding_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Literal l = (Literal)e.Item.FindControl("uiLiteralComments");
            DataRowView row = (DataRowView)e.Item.DataItem;
            l.Text = Server.HtmlDecode(row["ARComments"].ToString());   
        }
    }
}