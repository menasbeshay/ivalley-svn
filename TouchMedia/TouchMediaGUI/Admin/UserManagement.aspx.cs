using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace TouchMediaGUI
{
    public partial class UserManagement : System.Web.UI.Page
    {
        public string EditUser
        {
            get
            {
                if (Session["EditUser"] != null)
                {
                    return Session["EditUser"].ToString();
                }
                else
                {
                    return null;
                }
            }
            set
            {
                Session["EditUser"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "إدارة المستخدم";
                bindData();
                bindRoles();
            }
        }
        public void bindData()
        {
            MembershipUserCollection AllUsers = Membership.GetAllUsers();
            GridViewUsers.DataSource = AllUsers;
            GridViewUsers.DataBind();
        }

        public void ClearFields()
        {
            EditUser = null;
            txtUserName.Text = "";
            CheckBoxListRoles.ClearSelection();
            //btnAddNewUser.Visible = true;
            lblError.Text = "";
            txtUserName.Enabled = true;
            txtConfirmPassword.Enabled = true;

        }

        public void bindRoles()
        {
            CheckBoxListRoles.DataSource = Roles.GetAllRoles();
            CheckBoxListRoles.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (EditUser != null)
            {
                List<string> stringListToAdd = new List<string>();
                List<string> stringListToRemove = new List<string>();

                MembershipUser CurrentUser = Membership.GetUser(EditUser);

                if (CurrentUser.GetPassword() != txtPassword.Text && !string.IsNullOrEmpty(txtPassword.Text))
                {
                    CurrentUser.ChangePassword(CurrentUser.GetPassword(), txtPassword.Text);
                }

                foreach (ListItem item in CheckBoxListRoles.Items)
                {
                    if (item.Selected)
                    {
                        if (!Roles.IsUserInRole(CurrentUser.UserName, item.Text))
                        {
                            stringListToAdd.Add(item.Text);
                        }
                    }
                    else
                    {
                        if (Roles.IsUserInRole(CurrentUser.UserName, item.Text))
                        {
                            stringListToRemove.Add(item.Text);
                        }
                    }
                }

                string[] stringArrayToAdd = stringListToAdd.ToArray();
                string[] stringArrayToRemove = stringListToRemove.ToArray();
                if (stringArrayToAdd.Length > 0)
                    Roles.AddUserToRoles(CurrentUser.UserName, stringArrayToAdd);
                if (stringArrayToRemove.Length > 0)
                    Roles.RemoveUserFromRoles(CurrentUser.UserName, stringArrayToRemove);
            }
            else
            {
                List<string> stringListToAdd = new List<string>();
                MembershipCreateStatus obj;
                MembershipUser objUser = Membership.CreateUser(txtUserName.Text, txtPassword.Text, "dummy@example.com", null, null, true, out obj);
                bool success = true;
                switch (obj)
                {
                    case MembershipCreateStatus.DuplicateUserName:
                        lblError.Text = "اسم المستخدم غير متاح";
                        lblError.Visible = true;
                        success = false;
                        break;
                    case MembershipCreateStatus.InvalidPassword:
                        lblError.Text = "كلمة المرور يجب ان تكون 6 حروف على الاقل";
                        lblError.Visible = true;
                        success = false;
                        break;
                    case MembershipCreateStatus.ProviderError:
                    case MembershipCreateStatus.UserRejected:
                        lblError.Text = "خطأ غير متوقع, برجاء اعادة المحاولة";
                        lblError.Visible = true;
                        success = false;
                        break;
                    default:
                        break;
                }
                if (success)
                {
                    foreach (ListItem item in CheckBoxListRoles.Items)
                    {
                        if (item.Selected)
                        {
                            if (!Roles.IsUserInRole(objUser.UserName, item.Text))
                            {
                                stringListToAdd.Add(item.Text);
                            }
                        }
                    }
                    string[] stringArrayToAdd = stringListToAdd.ToArray();
                    if (stringArrayToAdd.Length > 0)
                        Roles.AddUserToRoles(objUser.UserName, stringArrayToAdd);
                }
            }
            ClearFields();
            bindData();
            panelUserGrid.Visible = true;
            panelUserEdit.Visible = false;
        }

        protected void btnAddNewUser_Click(object sender, EventArgs e)
        {
            ClearFields();
            panelUserEdit.Visible = true;
            panelUserGrid.Visible = false;
            //btnAddNewUser.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            panelUserEdit.Visible = false;
            panelUserGrid.Visible = true;
        }

        protected void GridViewUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editUser")
            {
                MembershipUser ObjData = Membership.GetUser(e.CommandArgument.ToString());
                txtUserName.Text = ObjData.UserName;
                txtUserName.Enabled = false;
                RequiredFieldValidator2.Enabled = false;
                RequiredFieldValidator3.Enabled = false;
                CompareValidator1.Enabled = false;
                txtConfirmPassword.Enabled = false;
                foreach (string role in Roles.GetRolesForUser(ObjData.UserName))
                {
                    foreach (ListItem item in CheckBoxListRoles.Items)
                    {
                        if (role == item.Text)
                        {
                            item.Selected = true;
                            break;
                        }
                    }
                }
                panelUserEdit.Visible = true;
                panelUserGrid.Visible = false;

                EditUser = ObjData.UserName.ToString();
                //btnAddNewUser.Visible = false;
            }
            else if (e.CommandName == "deleteUser")
            {
                MembershipUser ObjData = Membership.GetUser(e.CommandArgument.ToString());
                if (ObjData != null)
                {
                    Membership.DeleteUser(ObjData.UserName, true);
                }
                bindData();
            }
        }
    }
}