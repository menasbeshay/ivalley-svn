using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace Obtravel.Arabic.Admin
{
    public partial class EditServices : System.Web.UI.Page
    {
        public int CurrentService
        {
            get
            {
                if (Session["CurrentService"] != null && !string.IsNullOrEmpty(Session["CurrentService"].ToString()) && Session["CurrentService"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentService"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentService"] = value;
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
            uiPanelViewServices.Visible = true;
            uiPanelEditService.Visible = false;
            BindData();
        }


        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiRepeaterCurrentServices.DataSource = db.GetArabicServices();
            uiRepeaterCurrentServices.DataBind();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewServices.Visible = false;
            uiPanelEditService.Visible = true;
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
            if (CurrentService != 0)
            {
                DataSet ds = new DataSet();
                ds = db.GetServicesContent(CurrentService);
                string temp = ds.Tables[0].Rows[0]["arImagepath"].ToString();
                if (temp != imagepath && string.IsNullOrEmpty(imagepath))
                    db.SetArabicServiceContent(CurrentService, uiTextBoxBrief.Text, Server.HtmlEncode(uiFCKeditorContent.Value), uiTextBoxTitle.Text, temp, Convert.ToInt32(uiTextBoxOrder.Text));
                else
                    db.SetArabicServiceContent(CurrentService, uiTextBoxBrief.Text, Server.HtmlEncode(uiFCKeditorContent.Value), uiTextBoxTitle.Text, imagepath, Convert.ToInt32(uiTextBoxOrder.Text));
            }
            else // add new
            {
                db.AddArabicServiceContent(uiTextBoxBrief.Text, Server.HtmlEncode(uiFCKeditorContent.Value), uiTextBoxTitle.Text, imagepath, Convert.ToInt32(uiTextBoxOrder.Text));
            }
            uiPanelViewServices.Visible = true;
            uiPanelEditService.Visible = false;
            ClearFields();
            CurrentService = 0;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewServices.Visible = true;
            uiPanelEditService.Visible = false;
            ClearFields();
        }

        protected void uiRepeaterCurrentServices_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "EditService")
            {
                CurrentService = Convert.ToInt32(e.CommandArgument.ToString());
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetServicesContent(CurrentService);
                uiTextBoxBrief.Text = ds.Tables[0].Rows[0]["arBrief"].ToString();
                uiTextBoxOrder.Text = ds.Tables[0].Rows[0]["arOrder"].ToString();
                uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["arTitle"].ToString();
                uiFCKeditorContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["arContent"].ToString());
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["arImagepath"].ToString()))
                {
                    uiImageCurrent.ImageUrl = ds.Tables[0].Rows[0]["arImagepath"].ToString();
                    uiImageCurrent.Visible = true;
                }
                else
                {
                    uiImageCurrent.Visible = false;
                }
                uiPanelViewServices.Visible = false;
                uiPanelEditService.Visible = true;
            }
            else if (e.CommandName == "DeleteService")
            {
                DBLayer db = new DBLayer();
                db.DeleteService(Convert.ToInt32(e.CommandArgument.ToString()));
                BindData();
            }

        }
    }
}