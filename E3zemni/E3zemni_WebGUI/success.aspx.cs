using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI
{
    public partial class success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserPayment"] != null)
                {
                    UserPayement order = new UserPayement();
                    order = (UserPayement)Session["UserPayment"];
                    uiLabelON.Text = order.PayementID.ToString();
                    Session["UserPayment"] = null;
                }
                else
                {
                    Response.Redirect("default.aspx");
                }

            }

        }
    }
}