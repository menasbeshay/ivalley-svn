using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brotherssolidarity.Admin
{
    public partial class ManageInvFiles : System.Web.UI.Page
    {
        public int FileID
        {
            get
            {
                if (Session["FileID"] != null)
                {
                    try
                    {
                        return Convert.ToInt32(Session["FileID"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }
                }
                return 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (FileID == 0)
            {
                LoadDDLs();
                LoadFiles();
            }
        }

        private void LoadDDLs()
        {
            BLL.InvestorCat cats = new BLL.InvestorCat();
            cats.LoadAll();
            uiDropDownListAllCats.DataSource = cats.DefaultView;
            uiDropDownListAllCats.DataTextField = BLL.InvestorCat.ColumnNames.Name;
            uiDropDownListAllCats.DataValueField = BLL.InvestorCat.ColumnNames.InvestorCatID;
            uiDropDownListAllCats.DataBind();
            uiDropDownListCats.DataSource = cats.DefaultView;
            uiDropDownListCats.DataTextField = BLL.InvestorCat.ColumnNames.Name;
            uiDropDownListCats.DataValueField = BLL.InvestorCat.ColumnNames.InvestorCatID;
            uiDropDownListCats.DataBind();

        }

        private void LoadFiles()
        {
            BLL.InvestorFile files = new BLL.InvestorFile();
            files.GetFilesByCatID(Convert.ToInt32(uiDropDownListAllCats.SelectedValue));
        }

        protected void SaveBranch_Click(object sender, EventArgs e)
        {
            BLL.InvestorFile file = new BLL.InvestorFile();
            file.AddNew();
            file.Name = TxtName.Text;
            if (UploadPDF.HasFile)
            {
                string path = "/admin/UploadedFiles/invFiles/" + DateTime.Now.ToString("ddmmyyyyhhmmss") + UploadPDF.FileName;
                UploadPDF.SaveAs(Server.MapPath("~" + path));
                file.FilePath = path;
            }
            if (UploadWord.HasFile)
            {
                string path = "/admin/UploadedFiles/invFiles/" + DateTime.Now.ToString("ddmmyyyyhhmmss") + UploadWord.FileName;
                UploadWord.SaveAs(Server.MapPath("~" + path));
                file.WordFilePath = path;
            }
            file.InvestorCatID = Convert.ToInt32(uiDropDownListCats.SelectedValue);
            file.Save();
            uiPanelAdd.Visible = false;
            uiPanelAll.Visible = true;
            LoadFiles();
            TxtName.Text = "";
        }

        protected void uiGridViewFiles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewFiles.PageIndex = e.NewPageIndex;
            LoadFiles();
        }

        protected void uiGridViewFiles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteGrd")
            {
                BLL.InvestorFile file = new BLL.InvestorFile();
                file.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                file.MarkAsDeleted();
                file.Save();
                LoadFiles();
            }
        }

        protected void uiDropDownListAllCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadFiles();
        }
    }
}