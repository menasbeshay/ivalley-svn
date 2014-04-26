using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI
{
    public partial class ViewEnvelops : System.Web.UI.Page
    {
        #region props       

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
            Envelops envelops = new Envelops();
            envelops.LoadAll();

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = envelops.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 12;
            pds.CurrentPageIndex = currentPage;
            uiRepeaterEnvelops.DataSource = pds;
            uiRepeaterEnvelops.DataBind();
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