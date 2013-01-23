using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
using System.Data;
namespace YMC_Website
{
    public partial class Persons : System.Web.UI.Page
    {
        public int currentPage
        {
            get
            {
                object o = ViewState["_CurrentPagePerson"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_CurrentPagePerson"] = value; }
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
            YMC.BLL.Persons persons = new YMC.BLL.Persons ();
            persons.LoadAll();
            persons.Filter = "IsNationalCommitte <> 1 Or IsNationalCommitte is Null";
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = persons.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 10;
            pds.CurrentPageIndex = currentPage;
            uiDataListPersons.DataSource = pds;
            uiDataListPersons.DataBind();
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

        protected void uiDataListPersons_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image img = (Image)e.Item.FindControl("uiImageService");
                DataRowView row = (DataRowView)e.Item.DataItem;
                if (string.IsNullOrEmpty(row["PersonImage"].ToString()))
                {
                    img.ImageUrl = "/images/default.gif";
                }
                else
                {
                    img.ImageUrl = "CreateThumbNail.aspx?Image=" + row["PersonImage"].ToString();
                }
            }
        }

        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            currentPage--;
            BindData();
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            BindData();
        }
    }
}