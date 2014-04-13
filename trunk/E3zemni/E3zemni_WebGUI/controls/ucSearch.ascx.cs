using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;
using System.Data;

namespace E3zemni_WebGUI.controls
{
    public partial class ucSearch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCheckBoxes();
            }
        }

        private void LoadCheckBoxes()
        {
            Color colors = new Color();
            colors.LoadAll();
            uiRepeaterColors.DataSource = colors.DefaultView;            
            uiRepeaterColors.DataBind();

            Dimension dims = new Dimension();
            dims.GetAllDims();
            uiRepeaterSizes.DataSource = dims.DefaultView;
            uiRepeaterSizes.DataBind();

        }

        protected void uiRepeaterColors_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                Literal label = (Literal)e.Item.FindControl("uiLiteralLabel");
                label.Text = "<label for='color_" + row["ColorID"].ToString() + "' style='background: #" + row["ColorCode"].ToString() + "'></label>";
            }
        }

        protected void uiRepeaterSizes_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                Literal label = (Literal)e.Item.FindControl("uiLiteralLabel");
                label.Text = "<label for='size_" + row["DimensionID"].ToString() + "' >" + row["DisplayName"].ToString() + "</label>";
            }
        }
    }
}