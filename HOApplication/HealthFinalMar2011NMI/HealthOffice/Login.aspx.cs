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

[Serializable]
public partial class login : System.Web.UI.Page
{
    #region Events

    protected void Page_PreInit(object sender, EventArgs e)
    {
       // Response.Redirect("http://10.94.255.102/HoApplication/Login.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            News n = new News();
            rptrNews.DataSource = n.GetAllNews(null, true, null, null, null);
            rptrNews.DataBind();

            if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                Response.Redirect("login.aspx");
                
            }
        }
        if( Session["Error"]!=null)
        lblErr.Text = "هذا المستخدم لا يعمل";
    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        //MHOCommon.ClearCurrentSession();
        Session.Remove("Error");
        aspnet_Users user = new aspnet_Users();
        user.GetUserByName(Login1.UserName);

        // Validate User IP and Status
        // Check if the logged user is valid under his current IP
        OrgUser objOrgUser = new OrgUser();
        if (!objOrgUser.ValidateUserIPStatus(user.UserId, MHOCommon.CurrentOrgIP))
        {
            if (MHOCommon.EnableSmartLogin == 1)
            {
                FormsAuthentication.SignOut();
                Session["Error"] = true;
            }
        }

        OrgUser orgUser = new OrgUser();
        orgUser.LoadByPrimaryKey(user.UserId);

        if (orgUser.Status)
        {
            

            if (Roles.IsUserInRole(Login1.UserName, "SuperAdmin"))
            {
                Response.Redirect("~/Admin/AdminHomePage.aspx");
            }
            else if ( Roles.IsUserInRole(Login1.UserName, "SubAdmin"))
            {
                Response.Redirect("~/Admin/SubAdminHome.aspx");
            }
            else if (Roles.IsUserInRole(Login1.UserName, "Admin"))
            {
                Response.Redirect("~/Admin/AdminGovHome.aspx");
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        else
        {
            FormsAuthentication.SignOut();
            Session["Error"] = true;
            
        }
    }
    protected void lnkShowFile_Click(object sender, EventArgs e)
    {
        ImageButton lnk = (ImageButton)sender;
        ShowFile(int.Parse(lnk.CommandArgument));
    }
    protected void rptrNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        RepeaterItem item = e.Item;
        DataRow dr;
        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        {
            dr = ((DataRowView)(item.DataItem)).Row;
            if (dr["FileContentType"].ToString() == "")
            {
                ((ImageButton)(item.FindControl("lnkShowFile"))).Visible = false;
            }
        }
    }
    #endregion

    #region Functions

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
