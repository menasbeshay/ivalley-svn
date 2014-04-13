using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI
{
    public partial class Browse : System.Web.UI.Page
    {
        #region props
        public int CatID
        {
            get
            {
                if (Request.QueryString["cid"] != null)
                {
                    try
                    {
                        return int.Parse(Request.QueryString["cid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }

                }
                else
                {
                    return 0;
                }
            }
        }

        public string SearchText
        {
            get
            {
                if (Request.QueryString["q"] != null)
                {
                    return Request.QueryString["q"].ToString();

                }
                else
                {
                    return "";
                }
            }            
        }

        public double PriceFrom
        {
            get
            {
                if (Request.QueryString["pfrom"] != null)
                {
                    try
                    {
                        return double.Parse(Request.QueryString["pfrom"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }

                }
                else
                {
                    return 0;
                }
            }
        }

        public double PriceTo
        {
            get
            {
                if (Request.QueryString["pto"] != null)
                {
                    try
                    {
                        return double.Parse(Request.QueryString["pto"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }

                }
                else
                {
                    return 0;
                }
            }
        }

        public string ColorIds
        {
            get
            {
                if (Request.QueryString["c"] != null)
                {
                    
                    return Request.QueryString["c"].ToString();
                }
                else
                {
                    return "";
                }
            }
        }

        public string DimIds
        {
            get
            {
                if (Request.QueryString["s"] != null)
                {

                    return Request.QueryString["s"].ToString();
                }
                else
                {
                    return "";
                }
            }
        }


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
        #endregion 

        #region events 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                BindData();
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
        #endregion 

        #region methods

        private void BindData()
        {
            Cards cards = new Cards();
            cards.SearchCards(SearchText, CatID, PriceFrom, PriceTo, DimIds, ColorIds);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = cards.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 12;
            pds.CurrentPageIndex = currentPage;
            uiRepeaterCards.DataSource = pds;
            uiRepeaterCards.DataBind();
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
        }
        #endregion
    }
}