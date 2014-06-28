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
    public partial class ucFav : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadFavItems();
        }

        private void LoadFavItems()
        {
            if (Session["CurrentUser"] != null)
            {
                UserInfo user = new UserInfo();
                user = (UserInfo)Session["CurrentUser"];
                UserFavorites favs = new UserFavorites();
                favs.GetFavouritesByUserID(user.UserID);
                if (favs.RowCount > 0)
                {
                    uiRepeaterItems.DataSource = favs.DefaultView;
                    uiRepeaterItems.DataBind();
                }
            }
            else
            {
                uiLiteralNoItems.Visible = true;
            }
        }

        protected void uiRepeaterItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            UserFavorites favs = new UserFavorites();
            favs.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
            favs.MarkAsDeleted();
            favs.Save();
            LoadFavItems();
        }

        protected void uiRepeaterItems_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                Cards prod = new Cards();
                prod.LoadByPrimaryKey(Convert.ToInt32(row["CardID"].ToString()));
                Image image = (Image)e.Item.FindControl("uiImageMain");
                Label name = (Label)e.Item.FindControl("uiLabelName");
                name.Text = prod.CardNameEng;
                image.ImageUrl = prod.MainPhoto;
            }
        }
    }
}