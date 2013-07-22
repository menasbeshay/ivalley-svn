using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace website
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["view"] != null && !string.IsNullOrEmpty(Request.QueryString["view"]))
                {
                    if (Request.QueryString["view"].ToString() == "f")
                    {
                        DBLayer db = new DBLayer();
                        DataSet ds = new DataSet();
                        ds = db.GetAllContactByType(2);
                        uiLiteralFactScript.Text = "<script type='text/javascript'>function initializeFact() {var latlng = new google.maps.LatLng(" + ds.Tables[0].Rows[0]["latitude"].ToString() + ", " + ds.Tables[0].Rows[0]["longitude"].ToString() + ");var myOptions = {zoom: 16,center: latlng};var map = new google.maps.Map(document.getElementById('map_canvas'),myOptions); var marker = new google.maps.Marker({position: latlng,map: map,title:'Factory'});}</script>";
                        uiLiteralFactoryContent.Text = ds.Tables[0].Rows[0]["Content"].ToString();
                        uiPanelFactory.Visible = true;
                        
                    }
                    else if (Request.QueryString["view"].ToString() == "ho")
                    {
                        DBLayer db = new DBLayer();
                        DataSet ds = new DataSet();
                        ds = db.GetAllContactByType(1);
                        uiLiteralHOscript.Text = "<script type='text/javascript'>function initializeHead() {var latlng = new google.maps.LatLng(" + ds.Tables[0].Rows[0]["latitude"].ToString() + ", " + ds.Tables[0].Rows[0]["longitude"].ToString() + ");var myOptions = {zoom: 16,center: latlng};var map = new google.maps.Map(document.getElementById('map_canvas'),myOptions); var marker = new google.maps.Marker({position: latlng,map: map,title:'Head office'});}</script>";
                        uiLiteralHOContent.Text = ds.Tables[0].Rows[0]["Content"].ToString();
                        uiPanelHO.Visible = true;

                    }

                    else if (Request.QueryString["view"].ToString() == "s")
                    {
                        DBLayer db = new DBLayer();
                        DataSet ds = new DataSet();
                        ds = db.GetAllContactByType(3);
                        uiRepeaterRooms.DataSource = ds;
                        uiRepeaterRooms.DataBind();
                        uiPanelShowrooms.Visible = true;
                        /*
                        uiLiteralHOscript.Text = "<script type='text/javascript'>function initializeHead() {var latlng = new google.maps.LatLng(" + ds.Tables[0].Rows[0]["latitude"].ToString() + ", " + ds.Tables[0].Rows[0]["longitude"].ToString() + ");var myOptions = {zoom: 16,center: latlng};var map = new google.maps.Map(document.getElementById('map_canvas'),myOptions);}</script>";
                        uiLiteralHOContent.Text = ds.Tables[0].Rows[0]["Content"].ToString();                        
                        */
                    }
                }
                
                    
                

            }
        }

        protected void uiRepeaterRooms_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal link = (Literal) e.Item.FindControl("uiLiteralLink");
                Literal scripts = (Literal)e.Item.FindControl("uiLiteralScripts");
                DataRowView row = (DataRowView)e.Item.DataItem;

                link.Text = "<a href='#?custom=true&width=400&height=400' rel='" + row["title"].ToString().Replace(" ", "") + e.Item.ItemIndex.ToString() + "'>View Map</a>";
                scripts.Text = "<script type='text/javascript'>function initialize" + row["title"].ToString().Replace(" ", "") + e.Item.ItemIndex.ToString() + "() {var latlng = new google.maps.LatLng(" + row["latitude"].ToString() + ", " + row["longitude"].ToString() + ");var myOptions = {zoom: 16,center: latlng};var map = new google.maps.Map(document.getElementById('map_canvas'),myOptions); var marker = new google.maps.Marker({position: latlng,map: map,title:'" + row["title"].ToString() + "'});}</script>";
                scripts.Text += "<script type='text/javascript'>$(document).ready(function () {$(\"a[rel^='" + row["title"].ToString().Replace(" ", "") + e.Item.ItemIndex.ToString() + "']\").prettyPhoto({custom_markup: \"<div id='map_canvas' style='width:400px; height:405px'></div>\",changepicturecallback: function () { initialize" + row["title"].ToString().Replace(" ","") + e.Item.ItemIndex.ToString() + "(); },social_tools: false, description: false});});";
                scripts.Text += "</script>";
            }
        }
    }
}