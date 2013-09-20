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
    public partial class Photos : System.Web.UI.Page
    {
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

        public int currentPageCat
        {
            get
            {
                object o = ViewState["_currentPageCat"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_currentPageCat"] = value; }
        }

        public int currentPageSub
        {
            get
            {
                object o = ViewState["_currentPageSub"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_currentPageSub"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //LoadDDLs();
                Master.PageTitle = "صور";
                BindData();
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
                uiPanelPics.Visible = false;
            }
            else if (Request.QueryString["scatid"] != null && !string.IsNullOrEmpty(Request.QueryString["scatid"]))
            {
                GeneralPhotos objData = new GeneralPhotos();
                objData.GetGeneralPhotosBySubCategoryID(Convert.ToInt32(Request.QueryString["scatid"].ToString()));
                PagedDataSource pds = new PagedDataSource();
                objData.DefaultView.Sort = "ArTitle asc";
                pds.DataSource = objData.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 6;
                pds.CurrentPageIndex = currentPage;
                uiDataListPics.DataSource = pds;
                uiDataListPics.DataBind();
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
                uiPanelPics.Visible = true;
            }
            else
            {
                Categories scat = new Categories();
                scat.GetCategoriesByTypeID(2);
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = scat.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 6;
                pds.CurrentPageIndex = currentPageSub;
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
                uiPanelPics.Visible = false;
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
            currentPageCat--;
            BindData();
        }

        protected void uiLinkButtonSubPrev_Click(object sender, EventArgs e)
        {
            currentPageSub--;
            BindData();
        }

        protected void uiLinkButtonSubNext_Click(object sender, EventArgs e)
        {
            currentPageSub--;
            BindData();
        }
    }
}