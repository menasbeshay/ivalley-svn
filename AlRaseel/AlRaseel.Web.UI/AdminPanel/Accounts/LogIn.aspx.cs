using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data;
using Data.DataModels;
using Data.Extensions;

using Data.Repositories;
using System.Web.Security;




namespace Web.UI.AdminPanel.Accounts
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Boolean IsInvaledAdmin = false;
            loginAdmin(txtUserName.Text, txtPassword.Text, out IsInvaledAdmin);
        }

        private void loginAdmin(String LoginNamePram, String PasswordPram, out Boolean IsInvaledAdminPram)
        {


            AdminRepository _ObjRepo = new AdminRepository();
            Admin _AdminObj = new Admin();
            Admin _AdminLoginObj = new Admin();
            String _AdminId = String.Empty;


            _AdminObj.Password = PasswordPram;
            _AdminObj.LoginName = LoginNamePram;

            Boolean loginStat;


            if (String.IsNullOrEmpty(LoginNamePram) || String.IsNullOrEmpty(PasswordPram))
            {
                //lblMessage.Text = "invaled username or password";
                //divMessage.Visible = true;
                IsInvaledAdminPram = true;
            }
            else
            {
                _AdminId = _ObjRepo.LoginUser(LoginNamePram, PasswordPram, out loginStat);
                //_LoginUser = _UsersManagement.LoginUser(_UserPramObj, out loginStat);

                if (loginStat)
                {
                    HttpCookie CooLoginUser = new HttpCookie("CooLoginUser");


                    HttpCookie CooLoginUserID = new HttpCookie("CooLoginUserId");
                    CooLoginUserID.Value = _AdminId;


                    Response.Cookies.Add(CooLoginUser);
                    Response.Cookies.Add(CooLoginUserID);

                    FormsAuthentication.RedirectFromLoginPage(LoginNamePram, chkRememberMe.Checked);

                    IsInvaledAdminPram = loginStat;
                }

                IsInvaledAdminPram = false;
            }

        }
    }
}