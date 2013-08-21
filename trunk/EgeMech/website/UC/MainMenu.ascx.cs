using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;
namespace website.UC
{
    public partial class MainMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //LoadMenu();
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            string menu = "";
            EGEMech.BLL.Category cats = new EGEMech.BLL.Category();
            cats.LoadAll();
            for (int i = 0; i < cats.RowCount; i++)
            {
                menu += "<li><a href='products.aspx?cid=" + cats.CategoryID.ToString() + "'>" + cats.Name + "</a> ";
                menu += LoadSubCats(cats.CategoryID);
                menu += "</li>";
                cats.MoveNext();
            }

            Literal2.Text = menu;
        }

        private string LoadSubCats(int parent)
        {
            string submenu = "";
            EGEMech.BLL.SubCategory scat = new EGEMech.BLL.SubCategory();
            scat.GetSubCategoryByCatID(parent);
            if (scat.RowCount > 0)
            {
                submenu = "<ul style='display: none;'>";
                for (int i = 0; i < scat.RowCount; i++)
                {
                    submenu += "<li><a href='products.aspx?cid=" + scat.CategoryID.ToString() + "&scid=" + scat.SubCategoryID.ToString() + "'>" + scat.Name + "</a> </li>";
                    scat.MoveNext();
                }
                submenu += "</ul>";
            }
            return submenu;
        }

        private void LoadMenu()
        {
            string menu = " <ul>";
            EGEMech.BLL.Page page = new EGEMech.BLL.Page();
            page.GetAllPagesByParent(0);
            for (int i = 0; i < page.RowCount; i++)
            {
                menu += "<li><a href='Default.aspx'>" + page.Title + "</a> ";
                menu += LoadChildren(page.PageID);
                menu += "</li>";
                page.MoveNext();
            }
            menu += "</ul>";

            Literal1.Text = menu;
        }

        private string LoadChildren(int parent)
        {
            string submenu = "";
            EGEMech.BLL.Page page = new EGEMech.BLL.Page();
            page.GetAllPagesByParent(parent);
            if (page.RowCount > 0)
            {
                submenu = "<ul style='display: none;'>";
                for (int i = 0; i < page.RowCount; i++)
                {
                    submenu += "<li><a href='Default.aspx'>" + page.Title + "</a> ";
                    submenu += LoadChildren(page.PageID);
                    submenu += "</li>";
                    page.MoveNext();
                }
                submenu += "</ul>";
            }
            return submenu;
        }
    }
}