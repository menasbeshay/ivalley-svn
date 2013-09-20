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
    public partial class Videos : System.Web.UI.Page
    {

        public int currentPage
        {
            get
            {
                object o = Session["_CurrentPagev1"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { Session["_CurrentPagev1"] = value; }
        }

        public int currentPageCat
        {
            get
            {
                object o = Session["_currentPageCatv2"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { Session["_currentPageCatv2"] = value; }
        }

        public int currentPageSub
        {
            get
            {
                object o = Session["_currentPageSubv3"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { Session["_currentPageSubv3"] = value; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                //LoadDDLs();
                Master.PageTitle = "ملتيمديا - فيديو";
                BindData();
            }
        }        
        

        protected void uiDataListVideos_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image thumb = (Image)e.Item.FindControl("uiImageThumb");
                DataRowView row = (DataRowView)e.Item.DataItem;
                string vid = row["url"].ToString().Substring(row["url"].ToString().IndexOf("v=") + 2);
                if (vid.Contains("&"))
                    vid = vid.Substring(0, vid.IndexOf("&"));
                thumb.ImageUrl = "http://img.youtube.com/vi/" + vid + "/0.jpg";
            }
        }

        private void BindData()
        {
            if (Request.QueryString["catid"] != null && !string.IsNullOrEmpty(Request.QueryString["catid"]))
            {
                SubCategories scat = new SubCategories();
                scat.GetSubCatsByCategoryID(Convert.ToInt32(Request.QueryString["catid"].ToString()));
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = scat.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 6;
                pds.CurrentPageIndex = currentPageSub;
                uiDataListSub.DataSource = pds;
                uiDataListSub.DataBind();
                uiLinkButtonSubPrev.Enabled = true;
                uiLinkButtonSubNext.Enabled = true;
                if (currentPageSub == 0)
                {
                    uiLinkButtonSubPrev.Enabled = false;
                }

                if (currentPageSub == (pds.PageCount - 1))
                {
                    uiLinkButtonSubNext.Enabled = false;
                }
                uiPanelSubCats.Visible = true;
                uiPanelCats.Visible = false;
                uiPanelVideos.Visible = false;
            }
            else if (Request.QueryString["scatid"] != null && !string.IsNullOrEmpty(Request.QueryString["scatid"]))
            {
                GeneralVideos objData = new GeneralVideos();
                objData.GetGeneralVideosBySubCategoryID(Convert.ToInt32(Request.QueryString["scatid"].ToString()));
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = objData.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 6;
                pds.CurrentPageIndex = currentPage;
                uiDataListVideos.DataSource = objData.DefaultView;
                uiDataListVideos.DataBind();
                uiLinkButtonPrev.Enabled = true;
                uiLinkButtonNext.Enabled = true;
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
                uiPanelVideos.Visible = true;

            }
            else
            {
                Categories scat = new Categories();
                scat.GetCategoriesByTypeID(1);
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = scat.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 6;
                pds.CurrentPageIndex = currentPageCat;
                uiDataListCats.DataSource = pds;
                uiDataListCats.DataBind();
                uiLinkButtonCatPrev.Enabled = true;
                uiLinkButtonCatNext.Enabled = true;
                if (currentPageCat == 0)
                {
                    uiLinkButtonCatPrev.Enabled = false;
                }

                if (currentPageCat == (pds.PageCount - 1))
                {
                    uiLinkButtonCatNext.Enabled = false;
                }
                uiPanelSubCats.Visible = false;
                uiPanelCats.Visible = true;
                uiPanelVideos.Visible = false;
            }

            
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            BindData();
        }
        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            currentPage--;
            BindData();
        }

        protected void uiLinkButtonCatPrev_Click(object sender, EventArgs e)
        {
            currentPageCat--;
            BindData();
        }

        protected void uiLinkButtonCatNext_Click(object sender, EventArgs e)
        {
            currentPageCat++;
            BindData();
        }

        protected void uiLinkButtonSubPrev_Click(object sender, EventArgs e)
        {
            currentPageSub--;
            BindData();
        }

        protected void uiLinkButtonSubNext_Click(object sender, EventArgs e)
        {
            currentPageSub++;
            BindData();
        }

    }
}