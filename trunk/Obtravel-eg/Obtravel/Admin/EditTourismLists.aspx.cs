using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace Obtravel.Admin
{
    public partial class EditTourismLists : System.Web.UI.Page
    {
        public int CurrentList
        {
            get
            {
                if (Session["CurrentList"] != null && !string.IsNullOrEmpty(Session["CurrentList"].ToString()) && Session["CurrentList"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentList"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentList"] = value;
            }
        }

        public int ParentPackage
        {
            get
            {
                if (Session["Parentpackage"] != null && !string.IsNullOrEmpty(Session["Parentpackage"].ToString()) && Session["Parentpackage"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["Parentpackage"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["Parentpackage"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
            uiPanelViewLists.Visible = true;
            uiPanelEditTourismList.Visible = false;
            BindData();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiRepeaterCurrentTourismLists.DataSource = db.GetEnglishTourismlists(ParentPackage,true);
            uiRepeaterCurrentTourismLists.DataBind();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewLists.Visible = false;
            uiPanelEditTourismList.Visible = true;
            ClearFields();
        }

        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxBrief.Text = "";
            uiTextBoxOrder.Text = "";
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            string imagepath = "";
            if (uiFileUploadImage.HasFile)
            {
                uiFileUploadImage.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["UserFilePath"] + "UploadedImages/" + uiFileUploadImage.FileName));
                imagepath = ConfigurationManager.AppSettings["UserFilePath"] + "UploadedImages/" + uiFileUploadImage.FileName;
            }
            // update
            if (CurrentList != 0)
            {
                DataSet ds = new DataSet();
                ds = db.GetTourismlistContent(CurrentList);
                string temp = ds.Tables[0].Rows[0]["Imagepath"].ToString();
                if (temp != imagepath && string.IsNullOrEmpty(imagepath))
                    db.SetEnglishTourismContent(CurrentList, uiTextBoxBrief.Text, Server.HtmlEncode(uiFCKeditorContent.Value), uiTextBoxTitle.Text, temp, Convert.ToInt32(uiTextBoxOrder.Text), ParentPackage, uiCheckBoxViewInWeb.Checked);
                else
                    db.SetEnglishTourismContent(CurrentList, uiTextBoxBrief.Text, Server.HtmlEncode(uiFCKeditorContent.Value), uiTextBoxTitle.Text, imagepath, Convert.ToInt32(uiTextBoxOrder.Text), ParentPackage, uiCheckBoxViewInWeb.Checked);
            }
            else // add new
            {
                db.AddEnglishTourismlistContent(uiTextBoxBrief.Text, Server.HtmlEncode(uiFCKeditorContent.Value), uiTextBoxTitle.Text, imagepath, Convert.ToInt32(uiTextBoxOrder.Text), ParentPackage, uiCheckBoxViewInWeb.Checked);
            }
            uiPanelViewLists.Visible = true;
            uiPanelEditTourismList.Visible = false;
            ClearFields();
            CurrentList = 0;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewLists.Visible = true;
            uiPanelEditTourismList.Visible = false;
            ClearFields();
        }

        protected void uiRepeaterTourismLists_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "EditList")
            {
                CurrentList = Convert.ToInt32(e.CommandArgument.ToString());
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetTourismlistContent(CurrentList);
                uiTextBoxBrief.Text = ds.Tables[0].Rows[0]["Brief"].ToString();
                uiTextBoxOrder.Text = ds.Tables[0].Rows[0]["Order"].ToString();
                uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                uiCheckBoxViewInWeb.Checked = (bool)ds.Tables[0].Rows[0]["ViewInWeb"];
                uiFCKeditorContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Imagepath"].ToString()))
                {
                    uiImageCurrent.ImageUrl = ds.Tables[0].Rows[0]["Imagepath"].ToString();
                    uiImageCurrent.Visible = true;
                }
                else
                {
                    uiImageCurrent.Visible = false;
                }
                uiPanelViewLists.Visible = false;
                uiPanelEditTourismList.Visible = true;
            }
            else if (e.CommandName == "DeleteList")
            {
                DBLayer db = new DBLayer();
                db.DeleteTourismList(Convert.ToInt32(e.CommandArgument.ToString()));
                BindData();
            }

        }
    }
}