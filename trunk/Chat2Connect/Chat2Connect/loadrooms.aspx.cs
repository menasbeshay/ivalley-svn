using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect
{
    public partial class loadrooms : System.Web.UI.Page
    {
        public string localParams 
        {
            get 
            { 
                if (Request.Form["data_related"] != null) 
                    return Request.Form["data_related"].ToString();
                return string.Empty;
            } 
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getRooms();
        }

        private void getRooms()
        {
            string[] myparams = null;
            if (!string.IsNullOrEmpty(localParams))
            {
                 myparams = localParams.Split('&');
            }

            if (myparams.Length > 0)
            {
                if (myparams[0] == "cat=1")
                {
                    int cid = Convert.ToInt32(myparams[1].Substring(3));

                }
                else if (myparams[0]=="subcat=1") 
                {
                    int scid = Convert.ToInt32(myparams[1].Substring(3));
                }
            }
        }
    }
}