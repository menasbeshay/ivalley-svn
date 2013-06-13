using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
namespace Website.Admin
{
    public partial class EditAbout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GeneralSettings GS = new GeneralSettings();
                GS.LoadByPrimaryKey(2);
                uiTextBoxBrief.Text = GS.Value;
                uiLabelSucc.Visible = false;
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            GeneralSettings GS = new GeneralSettings();
            GS.LoadByPrimaryKey(2);
            GS.Value = uiTextBoxBrief.Text;
            GS.Save();
            uiLabelSucc.Visible = true;
        }

    }
}