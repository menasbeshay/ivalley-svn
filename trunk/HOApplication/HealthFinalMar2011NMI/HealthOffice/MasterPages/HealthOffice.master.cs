using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_HealthOffice : System.Web.UI.MasterPage
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

    }
    #endregion
}
