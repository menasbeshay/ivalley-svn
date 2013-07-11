using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace website
{
    public partial class designers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                BindDesigners();
            }
        }

        private void BindDesigners()
        {
            if (Request.QueryString["did"] == null || string.IsNullOrEmpty(Request.QueryString["did"].ToString()))
            {
                DBLayer db = new DBLayer();
                uiRepeaterDesigners.DataSource = db.GetAllDesigners();
                uiRepeaterDesigners.DataBind();
                uiPanelAll.Visible = true;
                uiPanelDetails.Visible = false;
            }
            else
            {
                uiPanelAll.Visible = false;
                uiPanelDetails.Visible = true;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetDesignerContent(Convert.ToInt32(Request.QueryString["did"].ToString()));
                uiImagemain.ImageUrl = ds.Tables[0].Rows[0]["MainPic"].ToString();
                uiLabelName.Text = ds.Tables[0].Rows[0]["DesignerName"].ToString();
                uiLabelTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
            }
        }
    }
}