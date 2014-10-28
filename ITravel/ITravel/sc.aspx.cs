using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITravel
{
    public partial class sc : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["t"] != null)
                {
                    if (Request.QueryString["t"].ToString() == "n")
                    {
                        IFramePage.Attributes.Add("src", "http://nesmaairlines.com/en/booking");
                        Label3.Text = GetLocalResourceObject("PageTitleN").ToString();
                    }
                    else if (Request.QueryString["t"].ToString() == "s")
                    {
                        IFramePage.Attributes.Add("src", "http://www.shaheenair.com");
                        Label3.Text = GetLocalResourceObject("PageTitleS").ToString();
                    }
                    else if (Request.QueryString["t"].ToString() == "k")
                    {
                        IFramePage.Attributes.Add("src", "http://www.kayak.com/");
                        Label3.Text = GetLocalResourceObject("PageTitleK").ToString();
                    }
                    else
                    {
                        IFramePage.Attributes.Add("src", "http://nesmaairlines.com/en/booking");
                        Label3.Text = GetLocalResourceObject("PageTitleN").ToString();
                    }
                }
            }
        }
    }
}