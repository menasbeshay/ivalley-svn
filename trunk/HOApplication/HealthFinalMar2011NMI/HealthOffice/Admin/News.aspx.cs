using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MHO.BLL;
using System.IO;

public partial class Admin_News : System.Web.UI.Page
{
    #region Properties

    public int SelectedNewsID
    {
        get
        {
            if (Session["SelectedNewsID"] != null)
            {
                return int.Parse(Session["SelectedNewsID"].ToString());
            }
            return 0;
        }
        set
        {
            Session["SelectedNewsID"] = value;
        }
    }

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.PageHeader = "تحديث الاخبار بالصفحة الرئيسية";

        if (!Page.IsPostBack)
        {
            LoadExistedNews();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (SelectedNewsID == 0)
            {
                AddNewNews();
            }
            else
            {
                UpdateNews(SelectedNewsID);
                SelectedNewsID = 0;
            }
            LoadExistedNews();
            Clear();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        ImageButton lnk = (ImageButton)sender;
        SelectedNewsID = int.Parse(lnk.CommandArgument);
        loadEditedNews();
        btnSave.Text = "تعديل الخبر";

       
        
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        ImageButton lnk = (ImageButton)sender;
        DeleteNews(int.Parse(lnk.CommandArgument));
        LoadExistedNews();
    }
    
    protected void lnkShowFile_Click(object sender, EventArgs e)
    {
        ImageButton lnk = (ImageButton)sender;
        ShowFile(int.Parse(lnk.CommandArgument));
    }

    protected void grdNews_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        DataRow r;
        if (row.RowType == DataControlRowType.DataRow)
        {
            r = ((DataRowView)(e.Row.DataItem)).Row;
            if (r["FileContentType"].ToString() == "")
            {
                ((ImageButton)(row.Cells[4].FindControl("lnkShowFile"))).Visible = false;
            }
            if ((Guid)r["CreatedByUserID"] != MHOCommon.CurrentLoggedUserID)
            {
                ((ImageButton)(row.Cells[4].FindControl("lnkEdit"))).Visible = false;
                ((ImageButton)(row.Cells[4].FindControl("lnkDelete"))).Visible = false;
            }
        }
    }

    protected void lnkViewFile_Click(object sender, EventArgs e)
    {
        ShowFile(SelectedNewsID);
    }

    protected void lnkChangeFile_Click(object sender, EventArgs e)
    {
        areaFileUpload.Style.Add("display", "block");
        areaChangeFile.Style.Add("display", "none");
        lnkCancelUpload.Visible = true;
    }

    protected void lnkCancelUpload_Click(object sender, EventArgs e)
    {
        areaFileUpload.Style.Add("display", "none");
        areaChangeFile.Style.Add("display", "block");
        lnkCancelUpload.Visible = false;
    }

    #endregion

    #region Functions
        
    public void LoadExistedNews()
    {
        News objNews = new News();
        grdNews.DataSource =  objNews.GetAllNews(null,null, null, null, null);
        grdNews.DataBind();
    }

    public bool AddNewNews()
    {
        News n = new News();
        HttpPostedFile fileData = filUpload.PostedFile;
        byte[] arFile = null;
        string ctype = "";
        string fExtention = "";
        if (fileData.ContentLength > 0)
        {
            arFile = new byte[fileData.ContentLength];
            fileData.InputStream.Read(arFile, 0, fileData.ContentLength);
            ctype = fileData.ContentType;
            string[] arrExt = fileData.FileName.Split('.');
            fExtention = arrExt[1];
        }
        
        return n.AddNew(txtTitle.Text, txtDescription.Text,
                 fExtention, chkShowLive.Checked, null, null, null, MHOCommon.CurrentLoggedUserID, ctype, arFile);
    }

    public bool UpdateNews(int newsID)
    {
        News n = new News();
        HttpPostedFile fileData = filUpload.PostedFile;
        byte[] arFile = null;
        string ctype = "";
        string fExtention = "";
        if (fileData.ContentLength > 0)
        {
            arFile = new byte[fileData.ContentLength];
            fileData.InputStream.Read(arFile, 0, fileData.ContentLength);
            ctype = fileData.ContentType;
            string[] arrExt = fileData.FileName.Split('.');
            fExtention = arrExt[1];
        }

        return n.Update(newsID, txtTitle.Text, txtDescription.Text,
                 fExtention, chkShowLive.Checked, null, null, null, MHOCommon.CurrentLoggedUserID, ctype, arFile);
    }

    public bool DeleteNews(int newsID)
    {
         News n = new News();
         return n.Delete(newsID);
    }

    public void loadEditedNews()
    {
        News objNews = new News();
        DataTable dt = objNews.GetAllNews(SelectedNewsID, null, null, null, null);

        txtTitle.Text = dt.Rows[0]["Title"].ToString();
        txtDescription.Text = dt.Rows[0]["Description"].ToString();
        chkShowLive.Checked = bool.Parse(dt.Rows[0]["ShowLive"].ToString());

        if (dt.Rows[0]["FileContentType"].ToString() == "")
        {
            areaFileUpload.Style.Add("display", "block");
            areaChangeFile.Style.Add("display", "none");
            lnkCancelUpload.Visible = false;
        }
        else
        {
            areaFileUpload.Style.Add("display", "none");
            areaChangeFile.Style.Add("display", "block");
            
        }
    }

    public void Clear()
    {
        txtTitle.Text = "";
        txtDescription.Text = "";
        chkShowLive.Checked = false;
        btnSave.Text = "اضافة خبر";
        areaFileUpload.Style.Add("display", "block");
        areaChangeFile.Style.Add("display", "none");
        lnkCancelUpload.Visible = false;

    }

    public void ShowFile(int newsID)
    {
        News objnews = new News();
        DataTable dt = objnews.GetAllNews(newsID, null, null, null, null);
        switch (dt.Rows[0]["FilePath"].ToString().ToLower())
        {
            case "doc":
            case "docx":
                Response.AddHeader("content-disposition", "attachment;filename=News Details" + dt.Rows[0]["NewsID"].ToString() + ".doc");
                break;
            case "xls":
                Response.AddHeader("content-disposition", "attachment;filename=News Details" + dt.Rows[0]["NewsID"].ToString() + ".xls");
                break;
            case "xlsx":
                Response.AddHeader("content-disposition", "attachment;filename=News Details" + dt.Rows[0]["NewsID"].ToString() + ".xlsx");
                break;
            case "pdf":
                Response.AddHeader("content-disposition", "attachment;filename=News Details" + dt.Rows[0]["NewsID"].ToString() + ".pdf");
                break;

        }
        
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = dt.Rows[0]["FileContentType"].ToString();
        Response.BinaryWrite((byte[])(dt.Rows[0]["FileData"]));
       
        Response.End();
    }

    #endregion

}
