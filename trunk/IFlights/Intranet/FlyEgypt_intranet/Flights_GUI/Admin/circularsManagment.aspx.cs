using Flight_BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Admin
{
    public partial class circularsManagment : System.Web.UI.Page
    {
        #region Properties
        public Announcement CurrentAnnouncement
        {
            get
            {
                if (Session["CurrentAnnouncement"] != null)
                    return (Announcement)Session["CurrentAnnouncement"];
                else
                    return null;
            }
            set
            {
                Session["CurrentAnnouncement"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Circulars Management";
                BindData();
                loadGroups();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiRadGridcirculars_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditCircular")
            {
                Announcement objData = new Announcement();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Title;
                uiRadEditorContnet.Content = Server.HtmlDecode(objData.Content);
                //uiTextBoxCreatedBy.Text = objData.CreatedBy;
                if (!objData.IsColumnNull(Announcement.ColumnNames.MainPic))
                {
                    uiImageMain.ImageUrl = objData.MainPic;
                    uiImageMain.Visible = true;
                }
                else
                    uiImageMain.Visible = false;

                if (!objData.IsColumnNull(Announcement.ColumnNames.UploadedFile))
                {
                    txtCurrentFile.Visible = true;
                    btnDeleteCurrentFile.Visible = true;
                    lblCurrentFile.Visible = true;
                    txtCurrentFile.Text = objData.UploadedFile.Substring(objData.UploadedFile.LastIndexOf('/')+1);
                }
                if (!objData.IsColumnNull(Announcement.ColumnNames.GroupID))
                {
                    DropDownListGroups.SelectedValue =objData.GroupID.ToString();
                }
                else
                {
                    DropDownListGroups.SelectedIndex = 0;
                }
                uiTextBoxBrief.Text = objData.Brief;
                CurrentAnnouncement = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteCircular")
            {
                Announcement objData = new Announcement();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridcirculars_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentAnnouncement = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            uiImageMain.Visible = false;
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            Announcement objdata = new Announcement();
            if (CurrentAnnouncement == null)
            {   objdata.AddNew();
                objdata.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                objdata.CreatedDate = DateTime.Now;
            }
            else
                objdata = CurrentAnnouncement;
            objdata.Title = uiTextBoxTitle.Text;
            objdata.Brief = uiTextBoxBrief.Text;
            //objdata.CreatedBy = uiTextBoxCreatedBy.Text;
            
            if (uiFileUploadImg.HasFile)
            {
                string path = "/fileuploads/circulars/" + Guid.NewGuid() + "_" + uiFileUploadImg.FileName;
                uiFileUploadImg.SaveAs(Server.MapPath("~" + path));
                objdata.MainPic = path;
            }
            objdata.Content = Server.HtmlEncode(uiRadEditorContnet.Content);


            if (Session["CurrentUploadedFiles"] != null)
            {
                Hashtable Files;
                Files = (Hashtable)Session["CurrentUploadedFiles"];

                if (Files.Count > 0)
                {
                    foreach (DictionaryEntry item in Files)
                    {
                        objdata.UploadedFile = item.Value.ToString();
                    }

                    Session["CurrentUploadedFiles"] = null;
                }
            }

            if (DropDownListGroups.SelectedValue =="0")
            {
                objdata.SetColumnNull(Announcement.ColumnNames.GroupID);
            }
            else
            {
                objdata.GroupID = int.Parse(DropDownListGroups.SelectedValue.ToString());
            }
            
            objdata.Save();
            BindData();
            CurrentAnnouncement = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();

            SendingNotifications.sendNotif(1, null, null, null, null, null, null, null);
        }


        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentAnnouncement = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            Announcement objdata = new Announcement();
            objdata.GetAllCirculars();
            uiRadGridcirculars.DataSource = objdata.DefaultView;
            uiRadGridcirculars.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxCreatedBy.Text = "";
            uiRadEditorContnet.Content = "";
            uiTextBoxBrief.Text = "";
            uiImageMain.ImageUrl = "";
            DropDownListGroups.SelectedIndex = 0;
        }

        protected void btnDeleteCurrentFile_Click(object sender, EventArgs e)
        {
            Announcement objData = new Announcement();
            objData = CurrentAnnouncement;
            objData.SetColumnNull(Announcement.ColumnNames.UploadedFile);
            objData.Save();
            txtCurrentFile.Text = "";
            txtCurrentFile.Visible = false;
            btnDeleteCurrentFile.Visible = false;
            lblCurrentFile.Visible = false;
        }

        private void loadGroups()
        {
            Groups grps = new Groups();
            grps.LoadAll();
            DropDownListGroups.DataSource = grps.DefaultView;
            DropDownListGroups.DataTextField = Groups.ColumnNames.GroupName.ToString();
            DropDownListGroups.DataValueField = Groups.ColumnNames.GroupID.ToString();
            DropDownListGroups.DataBind();
            DropDownListGroups.Items.Insert(0, new ListItem("Public", "0"));
        }

        #endregion

    }
}