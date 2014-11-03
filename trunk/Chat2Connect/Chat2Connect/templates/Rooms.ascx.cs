using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.templates
{
    public partial class Rooms : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Category cats = new Category();
                cats.LoadAll();
                uiRepeaterCats.DataSource = cats.DefaultView;
                uiRepeaterCats.DataBind();
            }
        }

        protected void uiRepeaterCats_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                SubCategory subs = new SubCategory();
                subs.GetSubCategoryByCategoryID(Convert.ToInt32(row["CategoryID"].ToString()));
                if (subs.RowCount > 0)
                {
                    Repeater subrep = (Repeater)e.Item.FindControl("uiRepeaterSubcats");
                    subrep.DataSource = subs.DefaultView;
                    subrep.DataBind();
                }
            }
        }
    }
}