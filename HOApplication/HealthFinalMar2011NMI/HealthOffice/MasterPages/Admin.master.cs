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

public partial class MasterPages_Admin : System.Web.UI.MasterPage
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
            //TODO: get organization Id using Sim IP
          //  MHOCommon.LoadCurrentOrgData("TODO:Send IP Address for cuurent sim");

        }
    }
    #endregion
}
