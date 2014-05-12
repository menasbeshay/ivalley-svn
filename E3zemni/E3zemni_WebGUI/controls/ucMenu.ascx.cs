﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;
namespace E3zemni_WebGUI.controls
{
    public partial class ucMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTopCats();
            }
        }

        private void LoadTopCats()
        {
            string menu = "";
            TopLevelCat cats = new TopLevelCat();
            cats.LoadAll();
            for (int i = 0; i < cats.RowCount; i++)
            {
                menu += "<li><a href='browse.aspx?tcid=" + cats.TopLevelCatID.ToString() + (cats.IsPartySupplier ? "&ps=true" : "") +"'>" + cats.NameEng + "</a> ";
                menu += LoadMainCats(cats.TopLevelCatID);
                menu += "</li>";
                cats.MoveNext();
            }

            uiLiteralmenu.Text = menu;
        }

        private string LoadMainCats(int p)
        {
            string submenu = "";
            MainCat scat = new MainCat();
            scat.GetMaincatByTopLevelCatId(p);
            if (scat.RowCount > 0)
            {
                submenu = "<ul>";
                for (int i = 0; i < scat.RowCount; i++)
                {
                    submenu += "<li><a href='browse.aspx?tcid=" + scat.TopLevelCatID.ToString() + "&mcid=" + scat.MainCatID.ToString() + (scat.IsPartySupplier ? "&ps=true" : "") + "'>" + scat.NameEng + "</a>";
                    submenu += LoadCats(scat.MainCatID);
                    submenu += " </li>";
                    scat.MoveNext();
                }
                submenu += "</ul>";
            }
            return submenu;
        }


        private string LoadCats(int p)
        {
            string submenu = "";
            Categories scat = new Categories();
            scat.GetCatsByMainCatID(p);
            if (scat.RowCount > 0)
            {
                submenu = "<ul>";
                for (int i = 0; i < scat.RowCount; i++)
                {
                    submenu += "<li><a href='browse.aspx?catid=" + scat.CategoryID.ToString() + (scat.IsPartySupplier ? "&ps=true" : "") + "'>" + scat.CatNameEng + "</a> </li>";
                    scat.MoveNext();
                }
                submenu += "</ul>";
            }
            return submenu;
        }
    }
}