using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite
{
    public partial class Directory : System.Web.UI.Page
    {
        public int PageIndex
        {
            get
            {
                object o = this.ViewState["_CurrentPage"];
                if (o == null)
                    return 0;
                else
                    return (int)o;
            }
            set
            {
                this.ViewState["_CurrentPage"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
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

            string searchfor = "";
            if (Request.QueryString["f"] != null)
            {
                try
                {
                    searchfor = Request.QueryString["f"].ToString();
                }
                catch (Exception ex)
                {
                    searchfor = "";
                }
            }


            PagedDataSource dt = new PagedDataSource();
            Companies objData = new Companies();
            if (!string.IsNullOrEmpty(searchfor) || searchfor != "sh")
                objData.SearchCompanies("", 0, catid, subcatid);
            else if (searchfor == "sh")
            {
                objData.SearchCompaniesForShipping();
            }
            else if (searchfor == "off")
            {
                objData.SearchCompaniesForOffers(catid, subcatid);
            }

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
                if(cat.RowCount > 0 )
                    uiLabelTitle.Text = " - " + cat.EnName;
                if (subcat.RowCount > 0)
                    uiLabelTitle.Text += " -> " + subcat.EnName;

                uiRepeaterResults.DataSource = dt;
                uiRepeaterResults.DataBind();
                uiLinkButtonPrev.Enabled = !dt.IsFirstPage;
                uiLinkButtonNext.Enabled = !dt.IsLastPage;
                uiLabelPages.Text = "Page " + (PageIndex + 1).ToString() + " of " + dt.PageCount.ToString() + " Pages";
                uiPanelNoResults.Visible = false;
                uiPanelResults.Visible = true;
            }
            else
            {
                uiPanelNoResults.Visible = true;
                uiPanelResults.Visible = false;
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

                cityname.Text = city.EnName;

                HyperLink linkName = (HyperLink)e.Item.FindControl("CompanyLink");
                linkName.NavigateUrl = "CompanyProfile.aspx?cid=" + row["CompanyID"].ToString();
                System.Web.UI.HtmlControls.HtmlGenericControl Name = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("CompanyName");
                System.Web.UI.HtmlControls.HtmlGenericControl offersDiv = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("OffersDiv");

                Services ser = new Services();
                ser.GetServicesByCompanyIDAndTypeID(Convert.ToInt32(row["CompanyID"].ToString()), 1);

                if (ser.RowCount > 0)
                {
                    offersDiv.Visible = true;
                }
                else
                {
                    offersDiv.Visible = false;
                }

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
    }
}