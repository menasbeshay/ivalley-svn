using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        #region properties
        public BLL.Companies CurrentCompany
        {
            get
            {
                if (Session["CurrentCompany"] != null)
                    return (BLL.Companies)Session["CurrentCompany"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCompany"] = value;
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {            
            MembershipUser _user = Membership.GetUser(CurrentCompany.UserName);
            if (_user.ChangePassword(_user.GetPassword(), uiTextBoxPassword.Text))
                uiLabelMessage.Text = "تم تغيير كلمة السر بنجاح.";
            else
                uiLabelMessage.Text = "حدث خطأ . من فضلك حاول مرة أخرى.";
            ClearFields();
        }

        private void ClearFields()
        {
            uiTextBoxPassword.Text = "";
            uiTextBoxRePassword.Text = "";
        }
    }
}