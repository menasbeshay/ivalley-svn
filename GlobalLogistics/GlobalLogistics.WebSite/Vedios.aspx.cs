using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite
{
    public partial class Vedios : System.Web.UI.Page
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
                if (Request.QueryString["cid"] != null && !string.IsNullOrEmpty(Request.QueryString["cid"]))
                {
                    BindVediosFromcat();
                    uiPanelCategories.Visible = false;
                    uiPanelAllVedios.Visible = true;
                    uiPanelVedio.Visible = false;
                }
                
                if(Request.QueryString["vid"] != null && !string.IsNullOrEmpty(Request.QueryString["vid"]))
                {                    
                    BindVedioLib();
                    uiPanelCategories.Visible = false;
                    uiPanelAllVedios.Visible = false;
                    uiPanelVedio.Visible = true;
                }

                if(Request.QueryString["cid"] == null && Request.QueryString["vid"] == null)
                {
                    Bindcats();
                    BindVediosFromcat();
                    BindVedioLib();
                    uiPanelCategories.Visible = true;
                    uiPanelAllVedios.Visible = true;
                    uiPanelVedio.Visible = false;
                }
            }
        }

        private void Bindcats()
        {
            BLL.VedioCategories currentvcats = new BLL.VedioCategories();
            currentvcats.LoadAll();
            uiDataListSubCats.DataSource = currentvcats.DefaultView;
            uiDataListSubCats.DataBind();
        }

        private void BindVedioLib()
        {
            int id = 0;
            if (Request.QueryString["vid"] != null)
            {
                try
                {
                    id = Convert.ToInt32(Request.QueryString["vid"].ToString());
                }
                catch (Exception ee)
                {                    
                }
            }            
            BLL.VedioLib currentvedio = new BLL.VedioLib();
            currentvedio.LoadByPrimaryKey(id);            
            uiRepeaterVedio.DataSource = currentvedio.DefaultView;
            uiRepeaterVedio.DataBind();
        }

        private void BindVediosFromcat()
        {
            int id = 0;
            if(Request.QueryString["cid"] != null)
            {
                try
                {
                    id = Convert.ToInt32(Request.QueryString["cid"].ToString());
                }
                catch (Exception ee)
                {
                    
                }
            }
            PagedDataSource dt = new PagedDataSource();
            BLL.VedioLib currentvedios = new BLL.VedioLib();
            currentvedios.GetAllVediosLibByCategory(id);
            dt.DataSource = currentvedios.DefaultView;
            dt.AllowPaging = true;
            dt.PageSize = 10;
            dt.CurrentPageIndex = PageIndex;
            uiRepeaterCurrentVedios.DataSource = dt;
            uiRepeaterCurrentVedios.DataBind();

            uiLinkButtonPrev.Enabled = !dt.IsFirstPage;
            uiLinkButtonNext.Enabled = !dt.IsLastPage;
            uiLabelPages.Text = "صفحة " + (PageIndex + 1).ToString() + " من " + dt.PageCount.ToString() + " صفحات";
        }

        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            PageIndex -= 1;
            BindVediosFromcat();
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            PageIndex += 1;
            BindVediosFromcat();
        }
    }
}