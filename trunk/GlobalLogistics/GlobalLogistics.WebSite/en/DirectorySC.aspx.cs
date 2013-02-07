using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.en
{
    public partial class DirectorySC : System.Web.UI.Page
    {
        public int PageIndex
        {
            get
            {
                object o = this.ViewState["_CurrentPageSC"];
                if (o == null)
                    return 0;
                else
                    return (int)o;
            }
            set
            {
                this.ViewState["_CurrentPageSC"] = value;
            }
        }

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void uiRepeaterResults_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                Label cityname = (Label)e.Item.FindControl("uiLabelCityName");

                Cities city = new Cities();
                city.LoadByPrimaryKey(Convert.ToInt32(row["CityID"].ToString()));

                cityname.Text = city.ArName;

                HyperLink linkName = (HyperLink)e.Item.FindControl("CompanyLink");
                linkName.NavigateUrl = "CompanyProfile.aspx?cid=" + row["CompanyID"].ToString();
                System.Web.UI.HtmlControls.HtmlGenericControl Name = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("CompanyName");

                if (!string.IsNullOrEmpty(row["PackageTypeID"].ToString()) && row["PackageTypeID"].ToString() != "1")
                {
                    linkName.Visible = true;
                    Name.Visible = false;
                }
                else
                {
                    linkName.Visible = false;
                    Name.Visible = true;
                }
            }
        }

        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            PageIndex -= 1;
            BindData();
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            PageIndex += 1;
            BindData();
        }
        #endregion

        #region Methods
        private void BindData()
        {
            string type = "";
            if (Request.QueryString["type"] != null)
            {
                type = Request.QueryString["type"].ToString();
            }
            else
            {
                type = "";
            }
            int catid = 0;
            if (Request.QueryString["cid"] != null)
            {
                try
                {
                    catid = Convert.ToInt32(Request.QueryString["cid"].ToString());
                }
                catch (Exception ex)
                {
                    catid = 0;
                }
            }

            int subcatid = 0;
            if (Request.QueryString["scid"] != null)
            {
                try
                {
                    subcatid = Convert.ToInt32(Request.QueryString["scid"].ToString());
                }
                catch (Exception ex)
                {
                    subcatid = 0;
                }
            }

            if (subcatid == 0 && type != "o" && type == "sh")
            {
                LoadSubcatsForShipping(catid);
            }

            else if (subcatid == 0 && type != "o")
            {
                LoadSubcats(catid);
            }
            else if (type == "o")
            {
                LoadOtherSubcats();
            }
            else
            {
                LoadCompanies(catid, subcatid);
            }



        }

        private void LoadSubcatsForShipping(int catid)
        {
            PagedDataSource dt = new PagedDataSource();
            SubCategories objData = new SubCategories();
            objData.GetSubCategoriesForShipping(catid);

            dt.DataSource = objData.DefaultView;
            dt.AllowPaging = true;
            dt.PageSize = 10;
            dt.CurrentPageIndex = PageIndex;
            if (objData.RowCount > 0 && dt != null)
            {
                uiDataListSubCats.DataSource = dt;
                uiDataListSubCats.DataBind();
                uiLinkButtonPrev.Enabled = !dt.IsFirstPage;
                uiLinkButtonNext.Enabled = !dt.IsLastPage;
                uiLabelPages.Text = "Page " + (PageIndex + 1).ToString() + " of " + dt.PageCount.ToString() + " Pages";
                uiPanelNoResults.Visible = false;
                uiPanelCategories.Visible = true;
                uiPanelResults.Visible = false;
            }
            else
            {
                uiPanelCategories.Visible = false;
                uiPanelNoResults.Visible = true;
                uiPanelResults.Visible = false;
            }
        }

        private void LoadOtherSubcats()
        {
            PagedDataSource dt = new PagedDataSource();
            SubCategories objData = new SubCategories();
            objData.GetSubCategoriesForOtherTypes();

            dt.DataSource = objData.DefaultView;
            dt.AllowPaging = true;
            dt.PageSize = 10;
            dt.CurrentPageIndex = PageIndex;
            if (objData.RowCount > 0 && dt != null)
            {
                uiDataListSubCats.DataSource = dt;
                uiDataListSubCats.DataBind();
                uiLinkButtonPrev.Enabled = !dt.IsFirstPage;
                uiLinkButtonNext.Enabled = !dt.IsLastPage;
                uiLabelPages.Text = "Page " + (PageIndex + 1).ToString() + " of " + dt.PageCount.ToString() + " Pages";
                uiPanelNoResults.Visible = false;
                uiPanelCategories.Visible = true;
                uiPanelResults.Visible = false;
            }
            else
            {
                uiPanelCategories.Visible = false;
                uiPanelNoResults.Visible = true;
                uiPanelResults.Visible = false;
            }
        }


        private void LoadSubcats(int catid)
        {
            PagedDataSource dt = new PagedDataSource();
            SubCategories objData = new SubCategories();
            objData.GetAllSubCategoriesByCategory(catid);
            Categories cat = new Categories();
            cat.LoadByPrimaryKey(catid);

            dt.DataSource = objData.DefaultView;
            dt.AllowPaging = true;
            dt.PageSize = 10;
            dt.CurrentPageIndex = PageIndex;
            if (objData.RowCount > 0 && dt != null)
            {
                if (cat.RowCount > 0)
                    uiLabelTitle.Text = " - " + cat.ArName;

                uiDataListSubCats.DataSource = dt;
                uiDataListSubCats.DataBind();
                uiLinkButtonPrev.Enabled = !dt.IsFirstPage;
                uiLinkButtonNext.Enabled = !dt.IsLastPage;
                uiLabelPages.Text = "Page " + (PageIndex + 1).ToString() + " of " + dt.PageCount.ToString() + " Pages";
                uiPanelNoResults.Visible = false;
                uiPanelCategories.Visible = true;
                uiPanelResults.Visible = false;
            }
            else
            {
                uiPanelCategories.Visible = false;
                uiPanelNoResults.Visible = true;
                uiPanelResults.Visible = false;
            }
        }

        private void LoadCompanies(int catid, int subcatid)
        {
            PagedDataSource dt = new PagedDataSource();
            Companies objData = new Companies();
            objData.SearchCompanies("", 0, catid, subcatid);
            Categories cat = new Categories();
            cat.LoadByPrimaryKey(catid);
            SubCategories subcat = new SubCategories();
            subcat.LoadByPrimaryKey(subcatid);

            dt.DataSource = objData.DefaultView;
            dt.AllowPaging = true;
            dt.PageSize = 10;
            dt.CurrentPageIndex = PageIndex;
            if (objData.RowCount > 0 && dt != null)
            {
                if (cat.RowCount > 0)
                    uiLabelTitle.Text = " - " + cat.ArName;
                if (subcat.RowCount > 0)
                    uiLabelTitle.Text += " -> " + subcat.ArName;

                uiRepeaterResults.DataSource = dt;
                uiRepeaterResults.DataBind();
                uiLinkButtonPrev.Enabled = !dt.IsFirstPage;
                uiLinkButtonNext.Enabled = !dt.IsLastPage;
                uiLabelPages.Text = "Page " + (PageIndex + 1).ToString() + " of " + dt.PageCount.ToString() + " Pages";
                uiPanelNoResults.Visible = false;
                uiPanelResults.Visible = true;
                uiPanelCategories.Visible = false;
            }
            else
            {
                uiPanelNoResults.Visible = true;
                uiPanelResults.Visible = false;
                uiPanelCategories.Visible = false;
            }
        }

        #endregion
    }
}