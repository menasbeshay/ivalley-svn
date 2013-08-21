using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;
namespace website.UC
{
    public partial class register : System.Web.UI.UserControl
    {
        public event EventHandler registered;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void uiButtonRegister_Click(object sender, EventArgs e)
        {
            Users user = new Users();
            user.AddNew();
            user.FirstName = uiTextBoxFN.Text;
            user.LastName = uiTextBoxLN.Text;
            user.UserName = uiTextBoxUsername.Text;
            user.Password = uiTextBoxPassword.Text;
            user.Mail = uiTextBoxMail.Text;
            user.Address = uiTextBoxAddress.Text;
            user.City = uiTextBoxCity.Text;
            user.Country = uiTextBoxCountry.Text;
            user.Phone = uiTextBoxPhone.Text;
            user.Fax = uiTextBoxFax.Text;
            user.PostalCode = uiTextBoxPC.Text;
            user.State = uiTextBoxState.Text;
            user.Save();
            Session["UserLoggedIn"] = user;
            if (null != registered)
                registered(this, EventArgs.Empty);
        }

        
    }
}