using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class AccountMatster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentLoggedInStudent"] != null)
                {
                    DBLayer db = new DBLayer();
                    int id = Convert.ToInt32(Session["CurrentLoggedInStudent"]);
                    DataSet ds = new DataSet();
                    ds = db.GetStudent(id);
                    uiLabelAccount.Text = " مرحباً  " + ds.Tables[0].Rows[0]["ArStudentName"].ToString() + " " + ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                }
                else
                {
                  //  Page.RegisterClientScriptBlock("abc", "<script type='text/javascript'>$('#Right').css('display','none');</script>");
                }
            }
        }
    }
}