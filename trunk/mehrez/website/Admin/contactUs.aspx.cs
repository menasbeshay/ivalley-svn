using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace website.Admin
{
    public partial class contactUs : System.Web.UI.Page
    {
        #region properties
        public int CurrentContact
        {
            get
            {
                if (Session["CurrentContact"] != null)
                    return (int)Session["CurrentContact"];
                else
                    return 0;
            }
            set
            {
                Session["CurrentContact"] = value;
            }
        }
        #endregion
        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                BindData();
                uiPanelViewContact.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiGridViewContacts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewContacts.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewContacts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditContact")
            {
                DBLayer db = new DBLayer();
                CurrentContact = Convert.ToInt32(e.CommandArgument);
                DataSet ds = db.GetContactContent(CurrentContact);
                uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                uiTextBoxLatitude.Text = ds.Tables[0].Rows[0]["Latitude"].ToString();
                uiTextBoxLongitude.Text = ds.Tables[0].Rows[0]["Longitude"].ToString();
                uiTextBoxContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                uiTextBoxMail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                uiPanelViewContact.Visible = false;
                uiPanelEdit.Visible = true;

            }
            else if (e.CommandName == "DeleteContact")
            {
                DBLayer db = new DBLayer();
                db.DeleteContact(Convert.ToInt32(e.CommandArgument));
                CurrentContact = 0;
                BindData();

            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewContact.Visible = false;
            Clearfields();
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentContact != 0)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewContact.Visible = true;
            Clearfields();
            BindData();
            CurrentContact = 0;

        }



        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewContact.Visible = true;
            Clearfields();
            CurrentContact = 0;
        }



        #endregion
        #region Methods
        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiGridViewContacts.DataSource = db.GetAllContact();
            uiGridViewContacts.DataBind();
        }

        private void AddNewRecord()
        {
            DBLayer db = new DBLayer();            
            db.AddContactContent(uiTextBoxContent.Text, uiTextBoxTitle.Text, uiTextBoxLatitude.Text, uiTextBoxLongitude.Text, uiTextBoxMail.Text);

        }

        private void UpdateRecord()
        {
            DBLayer db = new DBLayer();
            db.SetContactContent(CurrentContact, uiTextBoxContent.Text, uiTextBoxTitle.Text, uiTextBoxLatitude.Text, uiTextBoxLongitude.Text, uiTextBoxMail.Text);

        }



        private void Clearfields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxContent.Text = "";
            uiTextBoxLatitude.Text = "";
            uiTextBoxLongitude.Text = "";
            uiTextBoxMail.Text = "";
        }

        #endregion
    }
}