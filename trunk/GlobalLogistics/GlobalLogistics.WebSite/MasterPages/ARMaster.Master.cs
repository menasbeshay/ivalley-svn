using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.MasterPages
{
    public partial class ARMaster : System.Web.UI.MasterPage
    {
        public string Currentlang
        {
            get
            {
                if (Session["CurrentLang"] != null && !string.IsNullOrEmpty(Session["CurrentLang"].ToString()))
                {
                    return Session["CurrentLang"].ToString();
                }
                else
                {
                    return "AR";
                }
            }
            set { Session["CurrentLang"] = value; }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Currentlang = "AR";
            Thread.CurrentThread.CurrentCulture = new CultureInfo("ar-EG");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                BindMenu();
            }
        }
       
        private void BindMenu()
        {
            Categories cats = new Categories();
            cats.LoadAll();
            uiRepeaterDir.DataSource = cats.DefaultView;
            uiRepeaterDir.DataBind();
        }

        private void LoadDDLs()
        {
            Cities objCities = new Cities();
            objCities.LoadAll();
            uiDropDownListCities.DataSource = objCities.DefaultView;
            uiDropDownListCities.DataTextField = "ArName";
            uiDropDownListCities.DataValueField = "CityID";
            uiDropDownListCities.DataBind();
            uiDropDownListCities.Items.Insert(0, new ListItem("إختر المدينة", "0"));


            //AirPorts airport = new AirPorts();
            //airport.LoadAll();
            //uiDropDownListAitFrom.DataSource = airport.DefaultView;
            //uiDropDownListAitFrom.DataTextField = "EnName";
            //uiDropDownListAitFrom.DataValueField = "AirportID";
            //uiDropDownListAitFrom.DataBind();
            //uiDropDownListAitFrom.Items.Insert(0, new ListItem("إختر المطار", "0"));

            //uiDropDownListAirTo.DataSource = airport.DefaultView;
            //uiDropDownListAirTo.DataTextField = "EnName";
            //uiDropDownListAirTo.DataValueField = "AirportID";
            //uiDropDownListAirTo.DataBind();
            //uiDropDownListAirTo.Items.Insert(0, new ListItem("إختر المطار", "0"));

            //SeaPorts seaport = new SeaPorts();
            //seaport.LoadAll();
            //uiDropDownListFromShippinglines.DataSource = seaport.DefaultView;
            //uiDropDownListFromShippinglines.DataTextField = "EnName";
            //uiDropDownListFromShippinglines.DataValueField = "SeaPortID";
            //uiDropDownListFromShippinglines.DataBind();
            //uiDropDownListFromShippinglines.Items.Insert(0, new ListItem("إختر الميناء", "0"));

            //uiDropDownListToShippinglines.DataSource = seaport.DefaultView;
            //uiDropDownListToShippinglines.DataTextField = "EnName";
            //uiDropDownListToShippinglines.DataValueField = "SeaPortID";
            //uiDropDownListToShippinglines.DataBind();
            //uiDropDownListToShippinglines.Items.Insert(0, new ListItem("إختر الميناء", "0"));

            Categories objCategories = new Categories();
            objCategories.LoadAll();
            uiDropDownListCategories.DataSource = objCategories.DefaultView;
            uiDropDownListCategories.DataTextField = "ArName";
            uiDropDownListCategories.DataValueField = "CategoryID";
            uiDropDownListCategories.DataBind();
            uiDropDownListCategories.Items.Insert(0, new ListItem("قطاع الأعمال", "0"));

           
        }


        protected void uiLinkButtonEnglish_Click(object sender, EventArgs e)
        {
            Currentlang = "EN";            
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
            Response.Redirect("~/en/" + Request.RawUrl);
        }

        protected void uiImageButtonEnglish_Click(object sender, ImageClickEventArgs e)
        {
            Currentlang = "EN";            
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");

            Response.Redirect("~/en/" + Request.RawUrl);
        }

        protected void uiLinkButtonSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchResults.aspx?q=" + uiTextBoxSearchText.Text + "&cid=0&cat=0&scat=0");
        }

        protected void uiLinkButtonAdvSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchResults.aspx?q=" + uiTextBoxAdvSearchText.Text + "&cid=" + uiDropDownListCities.SelectedValue + "&cat=" + uiDropDownListCategories.SelectedValue + "&scat=" + uiDropDownListSubCategories.SelectedValue);
        }

        protected void uiRepeaterDir_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                int catid = Convert.ToInt32(row["CategoryID"].ToString());

                SubCategories sub = new SubCategories();
                sub.GetAllSubCategoriesByCategory(catid);

                Literal subs = (Literal)e.Item.FindControl("uiLiteralSub");

                if (sub.RowCount > 0)
                {
                    subs.Text = "<ul>";
                    for (int i = 0; i < sub.RowCount; i++)
                    {
                        subs.Text += "<li><a href=\"/Directory.aspx?cid=" + catid.ToString() + "&scid=" + sub.SubCategoryID.ToString() + "\" >" + sub.ArName + "</a></li>";
                        sub.MoveNext();
                    }
                    subs.Text += "</ul>";
                }
            }
        }

        protected void uiLinkButtonAirroutes_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/Arabic/SearchResults.aspx?fcid=" + uiDropDownListAitFrom.SelectedValue + "&tcid=" + uiDropDownListAirTo.SelectedValue + "&al=true");
            Response.Redirect("~/SearchResults.aspx?fcid=" + HiddenFieldFromA.Value + "&tcid=" + HiddenFieldToA.Value + "&al=true");
        }

        protected void uiLinkButtonShippinglines_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/Arabic/SearchResults.aspx?fcid=" + uiDropDownListFromShippinglines.SelectedValue + "&tcid=" + uiDropDownListToShippinglines.SelectedValue + "&sl=true");
            Response.Redirect("~/SearchResults.aspx?fcid=" + HiddenFieldFromS.Value + "&tcid=" + HiddenFieldToS.Value + "&sl=true");
        }

        protected void uiDropDownListCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategories objSubCategories = new SubCategories();
            objSubCategories.GetAllSubCategoriesByCategory(Convert.ToInt32(uiDropDownListCategories.SelectedValue));
            uiDropDownListSubCategories.DataSource = objSubCategories.DefaultView;
            uiDropDownListSubCategories.DataTextField = "ArName";
            uiDropDownListSubCategories.DataValueField = "SubCategoryID";
            uiDropDownListSubCategories.DataBind();
            uiDropDownListSubCategories.Items.Insert(0, new ListItem("قطاع الأعمال الفرعى", "0"));
        }        
    }
}