using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using IStock.BLL;
using System.Text;
using System.Web.Script.Services;
namespace I_Stock.Modules
{
    /// <summary>
    /// Summary description for StockService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class StockService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }



        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] GetItems(string query, int ClientId)
        {
            /*string query = "";
            query = Context.Request.Form["query"].ToString();*/
            Clients client = new Clients();
            client.LoadByPrimaryKey(ClientId);
            int clientTypeID = 0 ;
            if(client.RowCount > 0)
                clientTypeID= client.ClientTypeID;            
            Items items = new Items();
            List<string> listString = new List<string>();
            if (clientTypeID != 0)
            {
                items.SearchItemsAjax(query, clientTypeID);


                if (items.RowCount > 0)
                {

                    for (int i = 0; i < items.RowCount; i++)
                    {
                        listString.Add(items.ItemID + "##" + items.Name + "##" + items.GetColumn("Price").ToString());
                        //ItemsJSON += "{'Name': '" + items.ItemCode + " - " + items.Name + "' , 'ItemID': '" + items.ItemID + "'}";
                        items.MoveNext();

                    }


                }
            }
            else
            {
                items.SearchItems(query);


                if (items.RowCount > 0)
                {

                    for (int i = 0; i < items.RowCount; i++)
                    {
                        listString.Add(items.ItemID + "##" + items.Name);
                        //ItemsJSON += "{'Name': '" + items.ItemCode + " - " + items.Name + "' , 'ItemID': '" + items.ItemID + "'}";
                        items.MoveNext();

                    }


                }
            }
            string[] str = listString.ToArray();
            //Context.Response.Output.Write(ItemsJSON);
            //Context.Response.End();

            return str;
        }


    }
}
