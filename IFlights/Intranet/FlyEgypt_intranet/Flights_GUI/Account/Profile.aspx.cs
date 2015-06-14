using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Web.Security;

namespace Flights_GUI.Account
{
    public partial class Profile : System.Web.UI.Page
    {
        public string userKey
        {
            get 
            {
                if (Request.QueryString["uid"] != null)
                {
                    return Request.QueryString["uid"].ToString();
                }
                else
                    return null;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = "Profile";
            LoadData();
            LoadProfile();
            
        }

        private void LoadProfile()
        {
            try
            {
                if (userKey != null)
                {
                    UsersProfiles up = new UsersProfiles();
                    up.getUserByGUID(new Guid(userKey.ToString()));
                    if (!up.IsColumnNull(UsersProfiles.ColumnNames.Photo))
                        userImg.Src = up.Photo;
                    uiLabelFullName.Text = up.FullName;
                    uiLabelEmail.Text = up.Email;
                    uiLabelTele.Text = up.Telephone;
                    uiLabelUsername.Text = Membership.GetUser(new Guid(userKey)).UserName;
                    if(!up.IsColumnNull(UsersProfiles.ColumnNames.GroupID))
                        DropDownListGroups.SelectedValue = up.GroupID.ToString();
                    uiLabelRoles.Text = string.Join(" - ", Roles.GetRolesForUser(Membership.GetUser(new Guid(userKey)).UserName));
                }
                else
                {
                    UsersProfiles up = new UsersProfiles();
                    up.getUserByGUID(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                    if (!up.IsColumnNull(UsersProfiles.ColumnNames.Photo))
                        userImg.Src = up.Photo;
                    uiLabelFullName.Text = up.FullName;
                    uiLabelEmail.Text = up.Email;
                    uiLabelTele.Text = up.Telephone;
                    uiLabelUsername.Text = Membership.GetUser(new Guid(Membership.GetUser().ProviderUserKey.ToString())).UserName;
                    if (!up.IsColumnNull(UsersProfiles.ColumnNames.GroupID))
                        DropDownListGroups.SelectedValue = up.GroupID.ToString();
                    uiLabelRoles.Text = string.Join(" - ", Roles.GetRolesForUser(Membership.GetUser().UserName));
                }
            }
            catch (Exception)
            {
                Response.Redirect("~/dashboard.aspx");
            }
        }

        private void LoadData()
        {
            Groups grps = new Groups();
            grps.LoadAll();
            DropDownListGroups.DataSource = grps.DefaultView;
            DropDownListGroups.DataTextField = Groups.ColumnNames.GroupName.ToString();
            DropDownListGroups.DataValueField = Groups.ColumnNames.GroupID.ToString();
            DropDownListGroups.DataBind();
        }
    }
}