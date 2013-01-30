using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Collections;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditUsers : System.Web.UI.Page
    {
        #region Properties
        public bool IsSearch 
        {
            get
            {
                if (Session["IsSearch"] != null)
                    return (bool)Session["IsSearch"];
                else
                    return false;
            }
            set
            {
                Session["IsSearch"] = value;
            }
                    
        }

        public MembershipUser CurrentUser
        {
            get
            {
                if (Session["_CurrentUser"] != null)
                    return (MembershipUser)Session["_CurrentUser"];
                else
                    return null;
            }
            set
            {
                Session["_CurrentUser"] = value;
            }

        }
        #endregion

        #region Events
        protected void Page_PreRender(object sender, EventArgs e)
        {
            BindData();            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRoles();
                BindData();
                uiPanelViewUsers.Visible = true;
                uiPanelEdit.Visible = false;
                uiPanelPassword.Visible = false;
            }
        }

        protected void uiGridViewUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewUsers.PageIndex = e.NewPageIndex;
            if (!IsSearch)
            {
                BindData();
            }
            else
            {
                SearchByText();
            }
        }
        #endregion

        #region Methods
        private void BindData()
        {
            IsSearch = false;
            ArrayList UserTable = new ArrayList();
            MembershipUserCollection _users;
            if (AlphaLinks1.Letter == "All")
            {
                _users = Membership.GetAllUsers();
            }
            else
            {
                _users = Membership.FindUsersByName(AlphaLinks1.Letter + "%");
            }

            foreach (MembershipUser item in _users)
            {
                if (!Roles.IsUserInRole(item.UserName, "Company"))
                {
                    UserTable.Add(item);
                }
            }

            uiGridViewUsers.DataSource = UserTable;
            uiGridViewUsers.DataBind();
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            SearchByText();
        }


        protected void uiGridViewUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditUser")
            {
                MembershipUser ObjData = Membership.GetUser(e.CommandArgument.ToString());
                uiTextBoxUserName.Text = ObjData.UserName;
                uiTextBoxUserName.Enabled = false;
                uiTextBoxPassword.Enabled = false;
                RequiredFieldValidator2.Enabled = false;
                CompareValidator1.Enabled = false;
                uiTextBoxConfirm.Enabled = false;
                uiLinkButtonEditPassword.Enabled = true;
                uiTextBoxMail.Text = ObjData.Email;
                foreach (string role in Roles.GetRolesForUser(ObjData.UserName))
                {
                    foreach (ListItem item in uiCheckBoxListRoles.Items)
                    {
                        if (role == item.Text)
                        {
                            item.Selected = true;
                            break;
                        }
                    }
                }
                uiPanelEdit.Visible = true;
                uiPanelViewUsers.Visible = false;
                uiPanelPassword.Visible = false;
                CurrentUser = ObjData;
                
            }
            else if (e.CommandName == "DeleteUser")
            {
                MembershipUser ObjData = Membership.GetUser(e.CommandArgument.ToString());
                if (ObjData != null)
                {
                    Membership.DeleteUser(ObjData.UserName, true);
                }
                BindData();                
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentUser != null)
            {
                CurrentUser.Email = uiTextBoxMail.Text;
                List<string> stringListToAdd = new List<string>();
                List<string> stringListToRemove = new List<string>();

                foreach (ListItem item in uiCheckBoxListRoles.Items)
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
                MembershipUser objUser = Membership.CreateUser(uiTextBoxUserName.Text, uiTextBoxPassword.Text, uiTextBoxMail.Text, null, null, true, out obj);
                bool success = true;
                switch (obj)
                {
                    case MembershipCreateStatus.DuplicateUserName:
                        uiLabelError.Text = "duplicate username";
                        uiLabelError.Visible = true;
                        success = false;
                        break;
                    case MembershipCreateStatus.InvalidPassword:
                        uiLabelError.Text = "invalid password. password must be (6) characters or more.";
                        uiLabelError.Visible = true;
                        success = false;
                        break;
                    case MembershipCreateStatus.ProviderError:
                    case MembershipCreateStatus.UserRejected:
                        uiLabelError.Text = "an error occurred. please try again.";
                        uiLabelError.Visible = true;
                        success = false;
                        break;
                    default:
                        break;
                }
                if (success)
                {
                    foreach (ListItem item in uiCheckBoxListRoles.Items)
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
            uiPanelEdit.Visible = false;
            uiPanelPassword.Visible = false;
            uiPanelViewUsers.Visible = true;
            ClearFields();
            CurrentUser = null;

        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelEdit.Visible = false;
            uiPanelViewUsers.Visible = true;
            uiPanelPassword.Visible = false;
            CurrentUser = null;
        }



        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelViewUsers.Visible = false;
            uiPanelEdit.Visible = true;
            uiPanelPassword.Visible = false;
        }


        protected void uiButtonDone_Click(object sender, EventArgs e)
        {
            MembershipUser _user = Membership.GetUser(CurrentUser.UserName);
            if (_user.ChangePassword(_user.GetPassword(), uiTextBoxMainPassword.Text))
            {
                uiLabelError.Text = "تم تغيير كلمة السر بنجاح.";
                uiPanelPassword.Visible = false;
                uiPanelEdit.Visible = true;
                uiPanelViewUsers.Visible = false;
            }
            else
            {
                uiLabelMessage.Text = "حدث خطأ . من فضلك حاول مرة أخرى.";
                uiPanelPassword.Visible = true;
                uiPanelEdit.Visible = false;
                uiPanelViewUsers.Visible = false;
            }
            
        }

        protected void uiLinkButtonEditPassword_Click(object sender, EventArgs e)
        {
            uiPanelPassword.Visible = true;
            uiPanelEdit.Visible = false;
            uiPanelViewUsers.Visible = false;
        }

        protected void uiLinkButtonSkip_Click(object sender, EventArgs e)
        {
            uiPanelPassword.Visible = false;
            uiPanelEdit.Visible = true;
            uiPanelViewUsers.Visible = false;
        }

        #endregion

        #region Methods

        private void LoadRoles()
        {
            uiCheckBoxListRoles.DataSource = Roles.GetAllRoles();
            uiCheckBoxListRoles.DataBind();
        }
        
        private void SearchByText()
        {
            IsSearch = true;
            ArrayList UserTable = new ArrayList();
            MembershipUserCollection _users;
            if (AlphaLinks1.Letter == "All")
            {
                _users = Membership.FindUsersByName("%" + uiTextBoxSearch.Text +  "%");
            }
            else
            {
                _users = Membership.FindUsersByName(AlphaLinks1.Letter + "%");
            }

            foreach (MembershipUser item in _users)
            {
                if (!Roles.IsUserInRole(item.UserName, "Company"))
                {
                    UserTable.Add(item);
                }
            }

            uiGridViewUsers.DataSource = UserTable;
            uiGridViewUsers.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxUserName.Text = "";
            uiTextBoxPassword.Text = "";
            uiTextBoxConfirm.Text = "";
            uiTextBoxMail.Text = "";
            RequiredFieldValidator2.Enabled = true;
            CompareValidator1.Enabled = true;
            uiTextBoxUserName.Enabled = true;
            uiTextBoxPassword.Enabled = true;
            uiTextBoxConfirm.Enabled = true;
            uiLinkButtonEditPassword.Enabled = false;
            uiCheckBoxListRoles.ClearSelection();
        }
        #endregion

        

    }
}