using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Configuration;
using System.Data;
using Microsoft.Office.Interop.Word;
using System.Text;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditArNews : System.Web.UI.Page
    {
        #region properties
        public BLL.ArNews CurrentArNews
        {
            get
            {
                if (Session["CurrentArNews"] != null)
                    return (BLL.ArNews)Session["CurrentArNews"];
                else
                    return null;
            }
            set
            {
                Session["CurrentArNews"] = value;
            }
        }
        #endregion
        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDls();
                BindData();
                uiPanelViewNews.Visible = true;
                uiPanelEdit.Visible = false;
                uiPanelExport.Visible = false;
                Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
            }
        }

        protected void uiGridViewNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewNews.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditNews")
            {
                ArNews objData = new ArNews();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentArNews = objData;
                uiTextBoxArTitle.Text = objData.ArTitle;
                uiTextBoxEnTitle.Text = objData.EnTitle;
                uiFCKeditorArBody.Value = Server.HtmlDecode(objData.ArBody);
                uiFCKeditorEnBody.Value = Server.HtmlDecode(objData.EnBody);
                //uiDropDownListCategory.SelectedValue = objData.CategoryID.ToString();
                uiTextBoxEnBreif.Text = objData.EnBrief;
                uiTextBoxArBrief.Text = objData.ArBrief;
                //uiTextBoxDate.Text = ds.Tables[0].Rows[0]["CreatedDate"].ToString();
                uiPanelViewNews.Visible = false;
                uiPanelEdit.Visible = true;
               
            }
            else if (e.CommandName == "DeleteNews")
            {
                ArNews objData = new ArNews();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentArNews = null;
                BindData();

            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewNews.Visible = false;
            uiPanelExport.Visible = false;
            Clearfields();
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentArNews != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewNews.Visible = true;
            uiPanelExport.Visible = false;
            Clearfields();
            BindData();
            CurrentArNews = null;

        }



        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewNews.Visible = true;
            uiPanelExport.Visible = false;
            Clearfields();
            CurrentArNews = null;
        }


        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            ArNews objData = new ArNews();
            objData.SearchArNews(uiTextBoxSearch.Text, !string.IsNullOrEmpty(uiTextBoxFromDate.Text) ? DateTime.Parse(uiTextBoxFromDate.Text) : DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null)
                                                     , !string.IsNullOrEmpty(uiTextBoxToDate.Text) ? DateTime.Parse(uiTextBoxToDate.Text) : DateTime.MaxValue);
            uiGridViewNews.DataSource = objData.DefaultView;
            uiGridViewNews.DataBind();
        }

        #endregion
        #region Methods
        private void BindData()
        {
            ArNews objData = new ArNews();
            objData.LoadAll();
            uiGridViewNews.DataSource = objData.DefaultView;
            uiGridViewNews.DataBind();
        }

        private void AddNewRecord()
        {
            ArNews objData = new ArNews();
            objData.AddNew();
            objData.EnTitle = uiTextBoxEnTitle.Text;
            objData.ArTitle = uiTextBoxArTitle.Text;
            objData.EnBody = Server.HtmlEncode(uiFCKeditorEnBody.Value);
            objData.ArBody = Server.HtmlEncode(uiFCKeditorArBody.Value);
           //objData.CategoryID = Convert.ToInt32(uiDropDownListCategory.SelectedValue);
            objData.EnBrief = uiTextBoxEnBreif.Text;
            objData.ArBrief = uiTextBoxArBrief.Text;
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/FileUploads/News/" + uiFileUploadMainPicturePath.FileName));
                objData.MainPicturePath = "/FileUploads/News/" + uiFileUploadMainPicturePath.FileName;
            }
            objData.CreatedDate = DateTime.Now.AddHours(6);
            objData.Save();
        }

        private void UpdateRecord()
        {
            ArNews objData = new ArNews();
            objData = CurrentArNews;
            objData.EnTitle = uiTextBoxEnTitle.Text;
            objData.ArTitle = uiTextBoxArTitle.Text;
            objData.EnBody = Server.HtmlEncode(uiFCKeditorEnBody.Value);
            objData.ArBody = Server.HtmlEncode(uiFCKeditorArBody.Value);
            //objData.CategoryID = Convert.ToInt32(uiDropDownListCategory.SelectedValue);
            objData.EnBrief = uiTextBoxEnBreif.Text;
            objData.ArBrief = uiTextBoxArBrief.Text;
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/FileUploads/News/" + uiFileUploadMainPicturePath.FileName));
                objData.MainPicturePath = "/FileUploads/News/" + uiFileUploadMainPicturePath.FileName;
            }
            objData.CreatedDate = DateTime.Now.AddHours(6);
            objData.Save();
        }

        private void LoadDDls()
        {
            GlobalLogistics.BLL.Categories objData = new GlobalLogistics.BLL.Categories();
            objData.LoadAll();
            uiDropDownListCategory.DataSource = objData.DefaultView;
            uiDropDownListCategory.DataTextField = "ArName";
            uiDropDownListCategory.DataValueField = "CategoryID";
            uiDropDownListCategory.DataBind();

        }

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiTextBoxEnTitle.Text = "";
            uiFCKeditorArBody.Value = "";
            uiFCKeditorEnBody.Value = "";
            uiTextBoxArBrief.Text = "";
            uiTextBoxEnBreif.Text = "";
            uiDropDownListCategory.SelectedIndex = 0;
            //uiTextBoxDate.Text = "";
        }
        #endregion

        #region Export

        protected void uiLinkButtonAskExport_Click(object sender, EventArgs e)
        {
            uiPanelExport.Visible = true;
            uiPanelEdit.Visible = false;
            uiPanelViewNews.Visible = false;
            BindExportData();
        }

        protected void uiButtonExportSearch_Click(object sender, EventArgs e)
        {
            ArNews objData = new ArNews();
            objData.SearchArNews(uiTextBoxExportSearch.Text, !string.IsNullOrEmpty(uiTextBoxExportFrom.Text) ? DateTime.Parse(uiTextBoxExportFrom.Text) : DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null)
                                                     , !string.IsNullOrEmpty(uiTextBoxExportTo.Text) ? DateTime.Parse(uiTextBoxExportTo.Text) : DateTime.MaxValue);
            uiGridViewExport.DataSource = objData.DefaultView;
            uiGridViewExport.DataBind();
        }

        private void BindExportData()
        {
            ArNews objData = new ArNews();
            objData.LoadAll();
            uiGridViewExport.DataSource = objData.DefaultView;
            uiGridViewExport.DataBind();
        }

        protected void uiGridViewExport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewExport.PageIndex = e.NewPageIndex;
            BindExportData();
        }

        protected void uiLinkButtonExport_Click(object sender, EventArgs e)
        {
            string filter = "";
            //DataTable dt = new DataTable ();
            ArNews news = new ArNews();
            foreach (GridViewRow row in uiGridViewExport.Rows)
            {
                
                System.Web.UI.WebControls.CheckBox cb = (System.Web.UI.WebControls.CheckBox)row.FindControl("uiCheckBoxExport");
                if (cb.Checked)
                {
                    if(!string.IsNullOrEmpty(filter))
                        filter += ",";
                    HiddenField hf = (HiddenField)row.FindControl("uiHiddenFieldID");
                    filter += hf.Value;                    
                }
            }
            news.LoadAll();
            news.Filter = "NewsID in (" + filter + ")";

            if (news.RowCount > 0)
            {
                StringBuilder sbDocBody = new StringBuilder();

                /*object oMissing = System.Reflection.Missing.Value;

                Application oWordApp = new Application();
                Document document = oWordApp.Documents.Add(ref oMissing, ref oMissing, ref oMissing, ref oMissing);
                document.Activate();*/

                int i = 0;
                sbDocBody.Append("<html><body>");  
                foreach (DataRowView item in news.DefaultView)
                {

                   /* oWordApp.Selection.TypeText(item["ArTitle"].ToString());
                    oWordApp.Selection.TypeParagraph();
                    oWordApp.Selection.TypeParagraph();

                    oWordApp.Selection.InlineShapes.AddPicture("http://www.globallogistics.mtg-eg.com/" + item["MainPicturePath"].ToString());
                    oWordApp.Selection.TypeParagraph();


                    oWordApp.Selection.TypeText(StripTagsCharArray(Server.HtmlDecode(item["ArBody"].ToString())));
                    oWordApp.Selection.InsertNewPage();*/
                    sbDocBody.Append(item["ArTitle"].ToString());
                    sbDocBody.Append("<br />");
                    sbDocBody.Append("<img src=\'http://www.globallogistics.mtg-eg.com/" + item["MainPicturePath"].ToString() + "\'");
                    sbDocBody.Append("<br />");
                    sbDocBody.Append(Server.HtmlDecode(item["ArBody"].ToString()));
                    sbDocBody.Append("<br />");
                    sbDocBody.Append("<br />");
                    sbDocBody.Append("<hr />");
                    i++;

                }
                sbDocBody.Append("</body></html>");
                /*document.SaveAs(Server.MapPath("~/fileuploads/News.docx"), oMissing, oMissing, oMissing, oMissing, oMissing, oMissing,
                        oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing);
                document.Close();*/
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.Buffer = true;
                HttpContext.Current.Response.Charset = "utf-8";

                HttpContext.Current.Response.ContentType = "application/msword";
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=\"news.doc\"");
                /*HttpContext.Current.Response.TransmitFile("/fileuploads/News.docx");

                HttpContext.Current.Response.Flush();*/
                HttpContext.Current.Response.Write(sbDocBody.ToString());
                HttpContext.Current.Response.End();
               // oWordApp.Application.Quit(ref oMissing, ref oMissing, ref oMissing);
            }
            else
            {

            }
        }

        public string StripTagsCharArray(string source)
        {
            char[] array = new char[source.Length];
            int arrayIndex = 0;
            bool inside = false;

            for (int i = 0; i < source.Length; i++)
            {
                char let = source[i];
                if (let == '<')
                {
                    inside = true;
                    continue;
                }
                if (let == '>')
                {
                    inside = false;
                    continue;
                }
                if (!inside)
                {
                    array[arrayIndex] = let;
                    arrayIndex++;
                }
            }
            return new string(array, 0, arrayIndex);
        }

        protected void uiLinkButtonCancelExport_Click(object sender, EventArgs e)
        {
            uiPanelExport.Visible = false;
            uiPanelEdit.Visible = false;
            uiPanelViewNews.Visible = true;
        }
        #endregion

        

    }
}