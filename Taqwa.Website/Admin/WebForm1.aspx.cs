using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Taqwa.Website.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = new[] { 1, 2, 3, 4 };
                GridView1.DataBind();
            }
            else
            {
                if (GridView1.Rows.Count > 0)
                    foreach (GridViewRow row in GridView1.Rows)
                        ((Panel)row.FindControl("pnl")).Controls.Add(new TextBox() { ID = "txt" });
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
                ((Panel)e.Row.FindControl("pnl")).Controls.Add(new TextBox() { ID = "txt" });
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
                Response.Write(((TextBox)row.FindControl("txt")).Text + "<br/>");
        }
    }
}