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

public partial class ChangePassword : System.Web.UI.Page
{
    #region properties

    public string pageRole
    {
        get
        {
            if (string.IsNullOrEmpty(Request.QueryString["pageRole"]))
            {
                return "";
            }
            else
            {
                return Request.QueryString["pageRole"].ToString();
            }
        }
    }

    #endregion

    protected void Page_PreInit(Object sender, EventArgs e)
    {
        if (User.IsInRole("SuperAdmin"))
        {
            this.MasterPageFile = "~/MasterPages/Admin.master";
        }
        else if (User.IsInRole("Admin"))
        {
            this.MasterPageFile = "~/MasterPages/AdminGov.master";
        }
        else if (User.IsInRole("SubAdmin"))
        {
            this.MasterPageFile = "~/MasterPages/SubAdmin.master";
        }
        else
        {
            this.MasterPageFile = "~/MasterPages/MasterPage.master";
        }
            //if (pageRole == "SuperVisor")
            //{
            //    this.MasterPageFile = "~/MasterPages/SubAdmin.master";
            //}
            //else if (pageRole == "Admin")
            //{
            //    this.MasterPageFile = "~/MasterPages/Admin.master";
            //}
            //else
            //{
            //    this.MasterPageFile = "~/MasterPages/MasterPage.master";
            //}
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Master.MainHeader = "تغيير كلمة المرور";
            MembershipUser objuser;
            objuser = Membership.GetUser();
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
        objuser = Membership.GetUser();
      
        if (objuser.ChangePassword(txtOldPassword.Text, txtNewPassword.Text))
        {
            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "تم تعديل كلمة المرور بنجاح";
        }
        else
        {
            lblError.Text = "كلمة المرور الحالية غير صحيحة او هناك خطا فى كلمة المرور الجديدة";
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (pageRole == "SuperVisor")
        {
            Response.Redirect("Admin/SubAdminHome.aspx");
        }
        else if (pageRole == "Admin")
        {
            Response.Redirect("Admin/AdminHomePage.aspx");
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
       
    }
}
