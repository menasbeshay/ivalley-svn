using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;

namespace website.Admin
{
    public partial class EditProjects : System.Web.UI.Page
    {
        #region properties
        public EGEMech.BLL.Project CurrentProject
        {
            get
            {
                if (Session["CurrentProject"] != null)
                    return (EGEMech.BLL.Project)Session["CurrentProject"];
                else
                    return null;
            }
            set
            {
                Session["CurrentProject"] = value;
            }
        }
        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    Users user = (Users)Session["CurrentUser"];
                    if (!user.IsColumnNull("IsAdmin") && user.IsAdmin)
                    {
                        BindData();
                        uiPanelViewProjects.Visible = true;
                        uiPanelEdit.Visible = false;
                    }
                    else
                    {
                        Response.Redirect("~/default.aspx");
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewProjects.Visible = false;
            Clearfields();
        }

        protected void uiGridViewProjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewProjects.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditProject")
            {
                EGEMech.BLL.Project project = new EGEMech.BLL.Project();
                project.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                CurrentProject = project;
                
                uiTextBoxName.Text = project.Name;
                uiCheckBoxIsEPC.Checked = project.IsEPC;
                uiFCKeditorDescription.Value = Server.HtmlDecode(project.Description);                
                uiPanelViewProjects.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteProject")
            {
                try
                {
                    EGEMech.BLL.Project project = new EGEMech.BLL.Project();
                    project.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                    project.MarkAsDeleted();
                    project.Save();
                    BindData();
                }
                catch (Exception ex)
                {
                    uiLabelError.Visible = true;
                }

            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            EGEMech.BLL.Project project = new EGEMech.BLL.Project();
            if (CurrentProject != null)
            {
                project = CurrentProject;
            }
            else
            {
                project.AddNew();
            }
            
            project.Name = uiTextBoxName.Text;
            project.IsEPC= uiCheckBoxIsEPC.Checked;
            project.Description= Server.HtmlEncode(uiFCKeditorDescription.Value);
            string file = "";
            if (uiFileUploadImg.HasFile)
            {
                uiFileUploadImg.SaveAs(Server.MapPath("~/UploadFolder/projects/" + uiFileUploadImg.FileName));
                file = "/UploadFolder/projects/" + uiFileUploadImg.FileName;
                project.PicPath = file;
            }            
            project.Save();
            uiPanelEdit.Visible = false;
            uiPanelViewProjects.Visible = true;
            Clearfields();
            BindData();            
            CurrentProject = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewProjects.Visible = true;
            Clearfields();
            CurrentProject = null;

        }
        #endregion

        #region methods

        private void BindData()
        {
            EGEMech.BLL.Project projects = new EGEMech.BLL.Project();
            projects.LoadAll();
            uiGridViewProjects.DataSource = projects.DefaultView;
            uiGridViewProjects.DataBind();
        }


        private void Clearfields()
        {
            
            uiTextBoxName.Text = "";
            uiCheckBoxIsEPC.Checked = false;
            uiFCKeditorDescription.Value = "";
        }


        #endregion
    }
}