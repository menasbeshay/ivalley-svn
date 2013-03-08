using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPages_MasterPage : System.Web.UI.MasterPage
{
    #region Properties
    /// <summary>
    /// Sets page header value
    /// </summary>
    public string PageHeader
    {
        set
        {
            lblPageHeader.Text = value;
        }
    }
    /// <summary>
    /// Sets main header value
    /// </summary>
    public string MainHeader
    {
        set
        {
           lblMainheader.Text = value;
        }
    }
    #endregion

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblPageHeader.Text =MHOCommon.UnitDisplayTitle;

            if (Membership.GetUser(HttpContext.Current.User.Identity.Name) != null)
            {
                if(Roles.IsUserInRole(HttpContext.Current.User.Identity.Name,"Doctor"))
                {
                    Menu1.Items.Remove(Menu1.FindItem("OpenRegister"));
                    Menu1.Items.Remove(Menu1.FindItem("RegisterBirth"));
                    Menu1.Items.Remove(Menu1.FindItem("IsLostBirth"));
                    Menu1.Items.Remove(Menu1.FindItem("IsLostDeath"));
                    Menu1.Items.Remove(Menu1.FindItem("RegisterDeathCase"));
                   // Menu1.Items.Remove(Menu1.FindItem("EditDeathCase"));
                }
                else if (Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, "Writer"))
                {
                    Menu1.Items.Remove(Menu1.FindItem("ApproveBirth"));
                    Menu1.Items.Remove(Menu1.FindItem("ApproveDead"));
                    Menu1.Items.Remove(Menu1.FindItem("List"));
                    Menu1.Items.Remove(Menu1.FindItem("EditDeadMedicalInfo"));
                }
            }
           
        }
    }
    #endregion
  
}
