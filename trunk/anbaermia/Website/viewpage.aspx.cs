using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
using System.Data;
namespace Website
{
    public partial class viewpage : System.Web.UI.Page
    {
        // hold current page of datalist of files 
        public int currentPage
        {
            get
            {
                object o = ViewState["_CurrentPage"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_CurrentPage"] = value; }
        }
        // hold current page of datalist of files categories
        public int currentFileCat
        {
            get
            {
                object o = ViewState["_currentFileCat"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_currentFileCat"] = value; }
        }
        // hold current page of datalist of files sub-categories
        public int currentFileSub
        {
            get
            {
                object o = ViewState["_currentFileSub"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_currentFileSub"] = value; }
        }

        // hold current file category
        public int currentCat
        {
            get
            {
                object o = Session["currentCat"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { Session["currentCat"] = value; }
        }
        // hold current file subcategory
        public int currentSub
        {
            get
            {
                object o = Session["currentSub"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { Session["currentSub"] = value; }
        }


        /******** CMS **********/
        public int currentCMSPage
        {
            get
            {
                object o = ViewState["_currentCMSPage"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_currentCMSPage"] = value; }
        }

        public int currentCMSCatPage
        {
            get
            {
                object o = ViewState["_currentCMSCatPage"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_currentCMSCatPage"] = value; }
        }

        public int currentCMSSubPage
        {
            get
            {
                object o = ViewState["_currentCMSSubPage"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_currentCMSSubPage"] = value; }
        }

        public int currentCMSCat
        {
            get
            {
                object o = Session["currentCMSCat"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { Session["currentCMSCat"] = value; }
        }

        public int currentCMSSub
        {
            get
            {
                object o = Session["currentCMSSub"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { Session["currentCMSSub"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                int pid = 0;
                if (Request.QueryString["pid"] != null)
                {
                    try
                    {
                        pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        pid = 0;
                    }
                }

                if (pid == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    Pages page = new Pages();
                    page.LoadByPrimaryKey(pid);
                    uiLabelTitle.Text = page.ArTitle;
                    Master.PageTitle = page.ArTitle;
                    uiLiteralContent.Text = Server.HtmlDecode(page.ArContent);
                    uiImageMain.ImageUrl = "Images.aspx?Inner=t&Image=" + page.MainImagePath;
                    string pagetype = page.PageType;
                    if (string.IsNullOrEmpty(pagetype))
                        pagetype = "FFFFF";
                    tabs_1.Visible = TabContent.Visible = (pagetype[0] == 'T');  // content
                    tabs_2.Visible = TabVideos.Visible = (pagetype[1] == 'T');  // videos
                    tabs_3.Visible = TabFiles.Visible = (pagetype[2] == 'T');  // files
                    tabs_4.Visible = TabArticles.Visible = (pagetype[3] == 'T');  // articles
                    tabs_5.Visible = TabPics.Visible = (pagetype[4] == 'T');  // pics

                    RelatedContent rc = new RelatedContent();
                    rc.GetRelatedContentByTypeIDAndPageID(page.PageID, 3);
                    uiDataListVideos.DataSource = rc.DefaultView;
                    uiDataListVideos.DataBind();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scroll4", "$(document).ready(function () {$('#scrollbar5').tinyscrollbar();});", true);

                    RelatedContent rcp = new RelatedContent();
                    rcp.GetRelatedContentByTypeIDAndPageID(page.PageID, 4);
                    uiDataListPics.DataSource = rcp.DefaultView;
                    uiDataListPics.DataBind();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scroll7", "$(document).ready(function () {$('#scrollbar5').tinyscrollbar();});", true);
                    
                    LoadFilesCats();

                    LoadCMSCats();
                    /*RelatedContent rca = new RelatedContent();
                    rca.GetRelatedContentByTypeIDAndPageID(page.PageID, 1);
                    uiRepeaterCMS.DataSource = rca.DefaultView;
                    uiRepeaterCMS.DataBind();*/
                }
            }
        }

        private void LoadFilesCats()
        {            
            int pid = 0;
            if (Request.QueryString["pid"] != null)
            {
                try
                {
                    pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
                }
                catch (Exception ex)
                {
                    pid = 0;
                }
            }

            Pages page = new Pages();
            page.LoadByPrimaryKey(pid);

            Categories cat = new Categories();
            cat.GetCategoriesByTypeIDAndPageID(3, pid);
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = cat.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 6;
            pds.CurrentPageIndex = currentFileCat;
            uiDataListCats.DataSource = pds;
            uiDataListCats.DataBind();

            uiLinkButtonCatPrev.Enabled = true;
            uiLinkButtonCatNext.Enabled = true;

            if (currentFileCat == 0)
            {
                uiLinkButtonCatPrev.Enabled = false;
            }

            if (currentFileCat == (pds.PageCount - 1))
            {
                uiLinkButtonCatNext.Enabled = false;
            }

            uiPanelSubCats.Visible = false;
            uiPanelCats.Visible = true;
            uiPanelFiles.Visible = false;   
        }

        protected void uiDataListVideos_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image thumb = (Image)e.Item.FindControl("uiImageThumb");
                DataRowView row = (DataRowView)e.Item.DataItem;
                string vid = row["url"].ToString().Substring(row["url"].ToString().IndexOf("v=")+2);
                if(vid.Contains("&"))
                    vid = vid.Substring(0, vid.IndexOf("&"));
                thumb.ImageUrl = "http://img.youtube.com/vi/" + vid + "/0.jpg";
            }
        }

        protected void uiDataListCats_ItemCommand(object source, DataListCommandEventArgs e)
        {
            currentCat = Convert.ToInt32(e.CommandArgument.ToString());
            LoadFilesSubcats(e.CommandArgument.ToString());

        }

        protected void uiDataListSub_ItemCommand(object source, DataListCommandEventArgs e)
        {
            currentSub = Convert.ToInt32(e.CommandArgument.ToString());
            LoadFiles(e.CommandArgument.ToString());
        }

        private void LoadFiles(string id)
        {
            int pid = 0;
            if (Request.QueryString["pid"] != null)
            {
                try
                {
                    pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
                }
                catch (Exception ex)
                {
                    pid = 0;
                }
            }

            RelatedContent rcp = new RelatedContent();
            rcp.GetRelatedContentByTypeIDAndPageIDAndSubCatID(pid, 2,Convert.ToInt32(id));

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = rcp.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 6;
            pds.CurrentPageIndex = currentPage;
            uiRepeaterFiles.DataSource = pds;
            uiRepeaterFiles.DataBind();
            uiLinkButtonNext.Enabled = true;
            uiLinkButtonPrev.Enabled = true;
            if (currentPage == 0)
            {
                uiLinkButtonPrev.Enabled = false;
            }

            if (currentPage == (pds.PageCount - 1))
            {
                uiLinkButtonNext.Enabled = false;
            }
            uiPanelSubCats.Visible = false;
            uiPanelCats.Visible = false;
            uiPanelFiles.Visible = true;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scroll5", "$(document).ready(function () {$('#scrollbar5').tinyscrollbar();});", true);
            

        }
        private void LoadFilesSubcats(string id)
        {
            SubCategories scat = new SubCategories();
            scat.GetSubCatsByCategoryID(Convert.ToInt32(id));
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = scat.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 6;
            pds.CurrentPageIndex = currentFileSub;
            uiDataListSub.DataSource = pds;
            uiDataListSub.DataBind();
            uiLinkButtonSubPrev.Enabled = true;
            uiLinkButtonSubNext.Enabled = true;
            if (currentFileSub == 0)
            {
                uiLinkButtonSubPrev.Enabled = false;
            }

            if (currentFileSub == (pds.PageCount - 1))
            {
                uiLinkButtonSubNext.Enabled = false;
            }
            uiPanelSubCats.Visible = true;
            uiPanelCats.Visible = false;
            uiPanelFiles.Visible = false;
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            LoadFiles(currentSub.ToString());
        }
        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            currentPage--;
            LoadFiles(currentSub.ToString());
        }


        protected void uiLinkButtonCatPrev_Click(object sender, EventArgs e)
        {
            currentFileCat--;
            LoadFilesCats();
        }

        protected void uiLinkButtonCatNext_Click(object sender, EventArgs e)
        {
            currentFileCat--;
            LoadFilesCats();
        }

        protected void uiLinkButtonSubPrev_Click(object sender, EventArgs e)
        {
            currentFileSub--;
            LoadFilesSubcats(currentCat.ToString());
        }

        protected void uiLinkButtonSubNext_Click(object sender, EventArgs e)
        {
            currentFileSub--;
            LoadFilesSubcats(currentCat.ToString());
        }

        protected void uiLinkButtonBackCat_Click(object sender, EventArgs e)
        {            
            LoadFilesCats();
        }

        protected void uiLinkButtonBackSub_Click(object sender, EventArgs e)
        {
            uiRepeaterFiles.DataSource = null;
            uiRepeaterFiles.DataBind();
            LoadFilesSubcats(currentCat.ToString());
        }


        /****** CMS *********/
        private void LoadCMSCats()
        {
            int pid = 0;
            if (Request.QueryString["pid"] != null)
            {
                try
                {
                    pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
                }
                catch (Exception ex)
                {
                    pid = 0;
                }
            }

            Pages page = new Pages();
            page.LoadByPrimaryKey(pid);

            Categories cat = new Categories();
            cat.GetCategoriesByTypeIDAndPageID(4, pid);
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = cat.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 6;
            pds.CurrentPageIndex = currentCMSCatPage;
            uiDataListCMSCats.DataSource = pds;
            uiDataListCMSCats.DataBind();

            uiLinkButtonCMSCatPrev.Enabled = true;
            uiLinkButtonCMSCatNext.Enabled = true;

            if (currentCMSCatPage == 0)
            {
                uiLinkButtonCMSCatPrev.Enabled = false;
            }

            if (currentCMSCatPage == (pds.PageCount - 1))
            {
                uiLinkButtonCMSCatNext.Enabled = false;
            }

            uiPanelCMSSubCats.Visible = false;
            uiPanelCMSCats.Visible = true;
            uiPanelCMS.Visible = false;
        }


        protected void uiDataListCMSCats_ItemCommand(object source, DataListCommandEventArgs e)
        {
            currentCMSCat = Convert.ToInt32(e.CommandArgument.ToString());
            LoadCMSSubcats(e.CommandArgument.ToString());

        }

        protected void uiDataListCMSSub_ItemCommand(object source, DataListCommandEventArgs e)
        {
            currentCMSSub = Convert.ToInt32(e.CommandArgument.ToString());
            LoadCMS(e.CommandArgument.ToString());
        }

        private void LoadCMS(string id)
        {
            int pid = 0;
            if (Request.QueryString["pid"] != null)
            {
                try
                {
                    pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
                }
                catch (Exception ex)
                {
                    pid = 0;
                }
            }

            RelatedContent rcp = new RelatedContent();
            rcp.GetRelatedContentByTypeIDAndPageIDAndSubCatID(pid, 1, Convert.ToInt32(id));

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = rcp.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 6;
            pds.CurrentPageIndex = currentCMSPage;
            uiRepeaterCMS.DataSource = pds;
            uiRepeaterCMS.DataBind();
            uiLinkButtonCMSNext.Enabled = true;
            uiLinkButtonCMSPrev.Enabled = true;
            if (currentCMSPage == 0)
            {
                uiLinkButtonCMSPrev.Enabled = false;
            }

            if (currentCMSPage == (pds.PageCount - 1))
            {
                uiLinkButtonCMSNext.Enabled = false;
            }
            uiPanelCMSSubCats.Visible = false;
            uiPanelCMSCats.Visible = false;
            uiPanelCMS.Visible = true;

        }
        private void LoadCMSSubcats(string id)
        {
            SubCategories scat = new SubCategories();
            scat.GetSubCatsByCategoryID(Convert.ToInt32(id));
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = scat.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 6;
            pds.CurrentPageIndex = currentCMSSubPage;
            uiDataListCMSSub.DataSource = pds;
            uiDataListCMSSub.DataBind();
            uiLinkButtonCMSSubPrev.Enabled = true;
            uiLinkButtonCMSSubNext.Enabled = true;
            if (currentCMSSubPage == 0)
            {
                uiLinkButtonSubPrev.Enabled = false;
            }

            if (currentCMSSubPage == (pds.PageCount - 1))
            {
                uiLinkButtonSubNext.Enabled = false;
            }
            uiPanelCMSSubCats.Visible = true;
            uiPanelCMSCats.Visible = false;
            uiPanelCMS.Visible = false;
        }

        protected void uiLinkButtonCMSCatPrev_Click(object sender, EventArgs e)
        {
            currentCMSCatPage--;
            LoadCMSCats();
        }

        protected void uiLinkButtonCMSCatNext_Click(object sender, EventArgs e)
        {
            currentCMSCatPage++;
            LoadCMSCats();
        }

        protected void uiLinkButtonCMSSubPrev_Click(object sender, EventArgs e)
        {
            currentCMSSubPage--;
            LoadCMSSubcats(currentCMSCat.ToString());
        }

        protected void uiLinkButtonCMSSubNext_Click(object sender, EventArgs e)
        {
            currentCMSSubPage++;
            LoadCMSSubcats(currentCMSCat.ToString());
        }

        protected void uiLinkButtonCMSBackCat_Click(object sender, EventArgs e)
        {
            LoadCMSCats();
        }

        protected void uiLinkButtonCMSPrev_Click(object sender, EventArgs e)
        {
            currentCMSPage--;
            LoadCMS(currentCMSSub.ToString());
        }

        protected void uiLinkButtonCMSNext_Click(object sender, EventArgs e)
        {
            currentCMSPage++;
            LoadCMS(currentCMSSub.ToString());
        }

        protected void uiLinkButtonCMSBackSub_Click(object sender, EventArgs e)
        {
            uiRepeaterCMS.DataSource = null;
            uiRepeaterCMS.DataBind();
            LoadCMSSubcats(currentCMSCat.ToString());
        }




    }
}