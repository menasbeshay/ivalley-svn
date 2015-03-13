using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["CurrentLoggedInStudent"] != null)
            {
                Response.Redirect("MyAccount.aspx");
            }
            
        }

        protected void uiImageButtonLogin_Click(object sender, ImageClickEventArgs e)
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetStudentByUserNameAndSecertCode(uiTextBoxUserName.Text, uiTextBoxSecertCode.Text);

            //DataSet dsActive = new DataSet();
            //dsActive = db.GetStudentActiveOrNot(uiTextBoxUserName.Text);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["CurrentLoggedInStudent"] = ds.Tables[0].Rows[0]["StudentID"].ToString();
                Response.Redirect("MyAccount.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "يوجد خطأ فى تفاصيل الدخول (اسم المستخدم / كلمة المرور)  او المستخدم غير نشط - برجاء مراجعة مدير الموقع" + "');", true);
            }
        }
    }
}