using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Controls
{
    public partial class News : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                DataTable one = new DataTable ();
                DataTable Two = new DataTable ();
                ds = db.GetTopNews();
                one = ds.Tables[0].Clone();
                Two = ds.Tables[0].Clone();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (i < 3)
                        one.ImportRow(ds.Tables[0].Rows[i]);
                    else
                        Two.ImportRow(ds.Tables[0].Rows[i]);

                }

                uiRepeaterOne.DataSource = one.DefaultView;
                uiRepeaterOne.DataBind();

                uiRepeaterTwo.DataSource = Two.DefaultView;
                uiRepeaterTwo.DataBind();
            }

        }
    }
}