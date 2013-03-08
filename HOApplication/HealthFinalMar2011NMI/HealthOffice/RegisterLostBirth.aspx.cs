using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisterLostBirth : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.PageHeader = GetLocalResourceObject("lblHeaderPage").ToString();
        Master.MainHeader = GetLocalResourceObject("lblMainPage").ToString();
    }
}