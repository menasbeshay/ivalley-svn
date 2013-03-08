using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Print : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Hashtable htParameters = new Hashtable();

        if (Request.QueryString["Dead"].ToString() == "1")
        {
            htParameters.Add("DeadID", Request.QueryString["DeadEventID"].ToString());
            Response.Redirect(RSUtility.GenerateURL("Rpt_PrintDeadCase", htParameters));
        }
        if (Request.QueryString["Born"].ToString() == "1")
        {
            htParameters.Add("BornID", Request.QueryString["BornEventID"].ToString());
            Response.Redirect(RSUtility.GenerateURL("Rpt_PrintBornCase", htParameters));
        }
    }
}
