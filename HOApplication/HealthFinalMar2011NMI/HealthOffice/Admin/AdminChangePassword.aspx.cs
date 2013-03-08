using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class AdminChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Master.MainHeader = "تغيير كلمة المرور";
            MembershipUser objuser;
            objuser = Membership.GetUser(new Guid(Request.QueryString["userID"]));
            txtUserName.Text = objuser.UserName;
        }
        lblError.ForeColor = System.Drawing.Color.Red;
        lblError.Text = "";
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        MembershipUser objuser;
        objuser = Membership.GetUser(new Guid(Request.QueryString["userID"]));
      
        if (objuser.ChangePassword(objuser.ResetPassword(), txtNewPassword.Text))
        {
            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "تم تعديل كلمة المرور بنجاح";
        }
        else
        {
            lblError.Text = "هناك خطا فى كلمة المرور الجديدة";
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditUser.aspx");
    }
}
