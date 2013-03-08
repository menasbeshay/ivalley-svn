using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HealthInfo : System.Web.UI.Page
{
    #region Events
    /// <summary>
    /// Handles the load Event of Page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.PageHeader = GetLocalResourceObject("lblHeaderPage").ToString();
        Master.MainHeader = GetLocalResourceObject("lblMainPage").ToString();
    }
    /// <summary>
    /// Handles The Click event of the control BtnBack
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterBirthInfo.aspx");
    }
    #endregion
   
}