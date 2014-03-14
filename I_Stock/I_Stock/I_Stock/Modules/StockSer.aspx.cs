using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IStock.BLL;

namespace I_Stock.Modules
{
    public partial class StockSer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string t = Request.QueryString["query"].ToString();
                GetItems(t);
            }
        }

        public string GetItems(string term)
        {
            string ItemsJSON = "";
            Items items = new Items();
            items.SearchItems(term);
            if (items.RowCount > 0)
            {
                ItemsJSON = "[";
                for (int i = 0; i < items.RowCount; i++)
                {
                    ItemsJSON += "'" + items.Name + "'";
                    //ItemsJSON += "{'Name': '" + items.ItemCode + " - " + items.Name + "' , 'ItemID': '" + items.ItemID + "'}";
                    if (items.MoveNext())
                        ItemsJSON += ",";
                }
                ItemsJSON += "]";
            }

            Context.Response.Output.Write(ItemsJSON);
            Context.Response.End();

            return string.Empty;
        }
    }
}