using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Combo.BLL;
namespace Combo
{
    public partial class resetpass : System.Web.UI.Page
    {
        public string Passcode
        {
            get
            {                
                if (!string.IsNullOrEmpty(Request.QueryString["code"]))
                {
                    return Request.QueryString["code"].ToString();
                }
                else                
                    return null;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Passcode != null)
                {
                    ComboUser user = new ComboUser();
                    if (user.GetUserByPasscode(Passcode))
                    {
                        uiPanelError.Visible = false;
                        uiPanelsuccess.Visible = false;
                        uiPanelReset.Visible = true;
                    }
                    else
                    {
                        uiPanelError.Visible = true;
                        uiPanelsuccess.Visible = false;
                        uiPanelReset.Visible = false;
                    }
                }
                else
                {
                    uiPanelError.Visible = true;
                    uiPanelReset.Visible = false;
                    uiPanelsuccess.Visible = false;
                }
            }
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            ComboUser user = new ComboUser();
            user.GetUserByPasscode(Passcode);
            user.Password = uiTextBoxPass.Text;
            user.Save();
            uiPanelsuccess.Visible = true;
            uiPanelError.Visible = false;
            uiPanelReset.Visible = false;
        }




    }
}