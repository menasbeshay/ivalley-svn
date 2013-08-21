using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Request.QueryString["cid"] != null && !string.IsNullOrEmpty(Request.QueryString["cid"])))
                {
                    uiPanelRepeaters.Visible = true;
                    uiPanelDetails.Visible = false;

                    uiRepeaterProducts.Visible = false;
                    uiRepeaterSubCats.Visible = true;
                    uiRepeaterCats.Visible = false;

                    EGEMech.BLL.SubCategory scats = new EGEMech.BLL.SubCategory();
                    scats.GetSubCategoryByCatID(Convert.ToInt32(Request.QueryString["cid"].ToString()));

                    uiRepeaterSubCats.DataSource = scats.DefaultView;
                    uiRepeaterSubCats.DataBind();

                }
                if ((Request.QueryString["scid"] != null && !string.IsNullOrEmpty(Request.QueryString["scid"])))
                {
                    uiPanelRepeaters.Visible = true;
                    uiPanelDetails.Visible = false;

                    uiRepeaterProducts.Visible = true;
                    uiRepeaterSubCats.Visible = false;
                    uiRepeaterCats.Visible = false;

                    EGEMech.BLL.Product prod = new EGEMech.BLL.Product();
                    prod.GetProductsBySubCatID(Convert.ToInt32(Request.QueryString["scid"].ToString()));

                    uiRepeaterProducts.DataSource = prod.DefaultView;
                    uiRepeaterProducts.DataBind();
                }
                if ((Request.QueryString["pid"] != null && !string.IsNullOrEmpty(Request.QueryString["pid"])))
                {
                    uiPanelRepeaters.Visible = false;
                    uiPanelDetails.Visible = true;

                    EGEMech.BLL.Product prod = new EGEMech.BLL.Product();
                    prod.LoadByPrimaryKey(Convert.ToInt32(Request.QueryString["pid"].ToString()));

                    uiLabelTitle.Text = prod.Name;
                    uiLabelPrice.Text = prod.Price.ToString();
                    uiLiteralDescription.Text = Server.HtmlDecode(prod.Description);
                    uiImageProd.ImageUrl = "Images.aspx?Inner=News&Image=" + prod.PicPath;
                }
                else if ((Request.QueryString["cid"] == null || string.IsNullOrEmpty(Request.QueryString["cid"])) && (Request.QueryString["pid"] == null || string.IsNullOrEmpty(Request.QueryString["pid"])))
                {
                    uiPanelRepeaters.Visible = true;
                    uiPanelDetails.Visible = false;

                    uiRepeaterProducts.Visible = false;
                    uiRepeaterSubCats.Visible = false;
                    uiRepeaterCats.Visible = true;

                    EGEMech.BLL.Category cats = new EGEMech.BLL.Category();
                    cats.LoadAll();

                    uiRepeaterCats.DataSource = cats.DefaultView;
                    uiRepeaterCats.DataBind();

                }
            }
        }
    }
}