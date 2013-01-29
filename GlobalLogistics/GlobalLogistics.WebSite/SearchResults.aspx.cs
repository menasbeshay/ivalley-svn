using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.Arabic
{
    public partial class SearchResults : System.Web.UI.Page
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
            PagedDataSource dt = new PagedDataSource();
            Companies objData = new Companies();

            int cityid = 0;
            int catid = 0;
            int scatid = 0;
            string filter = "";
            int fromCity = 0;
            int toCity = 0;
            bool isAirLine = false;
            bool isSailingLine = false;

            if (Request.QueryString["q"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["q"].ToString()))
                {
                    filter = Request.QueryString["q"].ToString();
                }
            }

            if (Request.QueryString["cat"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["cat"].ToString()))
                {
                    try
                    {
                        catid = Convert.ToInt32(Request.QueryString["cat"].ToString());
                    }
                    catch (Exception ex)
                    {
                        catid = 0;
                    }
                }
            }

            if (Request.QueryString["scat"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["scat"].ToString()))
                {
                    try
                    {
                        scatid = Convert.ToInt32(Request.QueryString["scat"].ToString());
                    }
                    catch (Exception ex)
                    {
                        scatid = 0;
                    }
                }
            }

            if (Request.QueryString["cid"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["cid"].ToString()))
                {
                    try
                    {
                        cityid = Convert.ToInt32(Request.QueryString["cid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        cityid = 0;
                    }
                }
            }

            if (Request.QueryString["fcid"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["fcid"].ToString()))
                {
                    try
                    {
                        fromCity = Convert.ToInt32(Request.QueryString["fcid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        fromCity = 0;
                    }
                }
            }

            if (Request.QueryString["tcid"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["tcid"].ToString()))
                {
                    try
                    {
                        toCity = Convert.ToInt32(Request.QueryString["tcid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        toCity = 0;
                    }
                }
            }

            if (Request.QueryString["al"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["al"].ToString()))
                {
                    try
                    {
                        isAirLine = Convert.ToBoolean(Request.QueryString["al"].ToString());
                        isAirLine = true;
                    }
                    catch (Exception ex)
                    {
                        isAirLine = false;
                    }
                }
            }

            if (Request.QueryString["sl"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["sl"].ToString()))
                {
                    try
                    {
                        isSailingLine = Convert.ToBoolean(Request.QueryString["sl"].ToString());
                        isSailingLine = true;
                    }
                    catch (Exception ex)
                    {
                        isSailingLine = false;
                    }
                }
            }


            if (!isAirLine && !isSailingLine)
            {
                objData.SearchCompanies(filter, cityid, catid, scatid);
            }
            else if (isAirLine)
            {
                objData.SearchCompaniesForAirLines(fromCity, toCity);
            }
            else if (isSailingLine)
            {
                objData.SearchCompaniesForSeaLines(fromCity, toCity);
            }

            dt.DataSource = objData.DefaultView;
            dt.AllowPaging = true;
            dt.PageSize = 10;
            dt.CurrentPageIndex = PageIndex;

            if (objData.RowCount > 0 && dt != null)
            {
                uiPanelResults.Visible = true;
                uiPanelNoResults.Visible = false;
                uiRepeaterResults.DataSource = dt;
                uiRepeaterResults.DataBind();

                uiLinkButtonPrev.Enabled = !dt.IsFirstPage;
                uiLinkButtonNext.Enabled = !dt.IsLastPage;
                uiLabelPages.Text = "صفحة " + (PageIndex + 1).ToString() + " من " + dt.PageCount.ToString() + " صفحات";
            }
            else
            {
                uiPanelResults.Visible = false;
                uiPanelNoResults.Visible = true;
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

                if (!string.IsNullOrEmpty(row["PackageTypeID"].ToString()) && row["PackageTypeID"] != "1")
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
    }
}