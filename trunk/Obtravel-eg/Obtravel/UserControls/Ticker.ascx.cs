using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Obtravel.UserControls
{
    public partial class Ticker : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer ();
            DataSet ds = new DataSet ();
            ds = db.GetAllNews();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                uiLiteralTicker.Text += ds.Tables[0].Rows[i]["Content"].ToString() + " | ";
            }

            uiLiteralTicker.Text = uiLiteralTicker.Text.Remove(uiLiteralTicker.Text.LastIndexOf("|"));
        }
    }
}