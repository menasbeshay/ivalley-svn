using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;
using System.IO;
using Ionic.Zip;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditMagazine : System.Web.UI.Page
    {
        #region properties
        public BLL.Magazine CurrentMagazine
        {
            get
            {
                if (Session["CurrentMagazine"] != null)
                    return (BLL.Magazine)Session["CurrentMagazine"];
                else
                    return null;
            }
            set
            {
                Session["CurrentMagazine"] = value;
            }
        }
        #endregion
        #region Events
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewMagazines.Visible = true;
                uiPanelEdit.Visible = false;                    
            }
        }

        

        protected void uiGridViewMagazines_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditMagazine")
            {
                Magazine objData = new Magazine();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxArTitle.Text = objData.ArTitle;
                uiTextBoxEnTitle.Text = objData.EnTitle;
                uiTextBoxPath.Text = objData.FilePath;
                uiTextBoxDate.Text = objData.CreatedDate.ToString("dd/MM/yyyy");
                uiPanelViewMagazines.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentMagazine = objData;
            }
            else if (e.CommandName == "DeleteMagazine")
            {
                Magazine objData = new Magazine();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
                uiPanelViewMagazines.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {            
            string filepath = "";
            /*DirectoryInfo dir = new DirectoryInfo(Server.MapPath("~/FileUploads/Magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Parse(uiTextBoxDate.Text))));
            if (!dir.Exists)
            {
                dir.Create();
            }
            if (uiFileUpload.HasFile)
            {                
                uiFileUpload.SaveAs(Server.MapPath("~/FileUploads/Magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Parse(uiTextBoxDate.Text)) + "/" +uiFileUpload.FileName));
                filepath = "/Fileuploads/Magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Now) + "/" + uiFileUpload.FileName.Substring(0, uiFileUpload.FileName.LastIndexOf("."));
                if (ZipFile.IsZipFile(Server.MapPath("~/fileuploads/magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Parse(uiTextBoxDate.Text)) + "/" + uiFileUpload.FileName)))
                {
                    ZipFile s = ZipFile.Read(Server.MapPath("~/fileuploads/magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Parse(uiTextBoxDate.Text)) + "/" + uiFileUpload.FileName));
                    if (s.SelectEntries("*.swf", uiFileUpload.FileName.Substring(0, uiFileUpload.FileName.LastIndexOf("."))).Count == 1)
                    {
                        s.ExtractAll(Server.MapPath("~/fileuploads/magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Parse(uiTextBoxDate.Text))), ExtractExistingFileAction.OverwriteSilently);
                        FileInfo[] files = dir.GetDirectories(uiFileUpload.FileName.Substring(0, uiFileUpload.FileName.LastIndexOf(".")))[0].GetFiles("*.swf");
                        if (files.Length > 0)
                        {
                            filepath = "/Fileuploads/Magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Parse(uiTextBoxDate.Text)) + "/" + uiFileUpload.FileName.Substring(0, uiFileUpload.FileName.LastIndexOf(".")) + "/" + files[0].Name;
                        }
                    }
                }
                else
                {
                    uiLabelError.Text = "Error in zip file : damaged zip file or no swf file exist.";
                    uiLabelError.Visible = true;
                    return;
                }
            }*/

            filepath = uiTextBoxPath.Text;
            if (CurrentMagazine != null)
            {
                Magazine objData = CurrentMagazine;
                string temp = objData.FilePath;
                if (temp != filepath && string.IsNullOrEmpty(filepath))
                {
                    objData.EnTitle = uiTextBoxEnTitle.Text;
                    objData.ArTitle = uiTextBoxArTitle.Text;
                    objData.FilePath = temp;
                    objData.CreatedDate = DateTime.Parse(uiTextBoxDate.Text);
                    uiPanelEdit.Visible = false;
                    uiPanelViewMagazines.Visible = true;
                    BindData();
                    Clearfields();
                    objData.Save();
                    CurrentMagazine = null;
                }
                else
                {
                    objData.EnTitle = uiTextBoxEnTitle.Text;
                    objData.ArTitle = uiTextBoxArTitle.Text;
                    objData.FilePath = filepath;
                    objData.CreatedDate = DateTime.Parse(uiTextBoxDate.Text);
                    uiPanelEdit.Visible = false;
                    uiPanelViewMagazines.Visible = true;
                    BindData();
                    Clearfields();
                    CurrentMagazine = null;
                }
            }
            else
            {
                Magazine objData = new Magazine();
                objData.AddNew();
                objData.EnTitle = uiTextBoxEnTitle.Text;
                objData.ArTitle = uiTextBoxArTitle.Text;
                objData.FilePath = filepath;
                objData.CreatedDate = DateTime.Parse(uiTextBoxDate.Text);
                objData.Save();
                BindData();
                Clearfields();
                CurrentMagazine = null;
            }

            uiPanelViewMagazines.Visible = true;
            uiPanelEdit.Visible = false;

        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewMagazines.Visible = false;
            Clearfields();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentMagazine = null;
            uiPanelEdit.Visible = false;
            uiPanelViewMagazines.Visible = true;
            Clearfields();
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            Magazine objData = new Magazine();
            objData.SearchMagazines(uiTextBoxSearch.Text);
            uiGridViewMagazines.DataSource = objData.DefaultView;
            uiGridViewMagazines.DataBind();
        }

        #endregion
        #region Methods

        private void BindData()
        {
            Magazine objData = new Magazine();
            objData.LoadAll();
            uiGridViewMagazines.DataSource = objData.DefaultView;
            uiGridViewMagazines.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiTextBoxEnTitle.Text = "";
            uiTextBoxDate.Text = "";
            uiTextBoxPath.Text = "";
            uiLabelError.Visible = false;
        }

        #endregion

        
    }
}