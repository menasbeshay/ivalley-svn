using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.usercontrols
{
    public partial class SendMail : System.Web.UI.UserControl
    {
        public int MemberID
        {
            get
            {
                if (String.IsNullOrEmpty(uiHiddenFieldCurrentMember.Value))
                    uiHiddenFieldCurrentMember.Value = "0";
                return Convert.ToInt32(uiHiddenFieldCurrentMember.Value);
            }
            set
            {
                uiHiddenFieldCurrentMember.Value = Convert.ToString(value);
            }
        }
        public string MemberName
        {
            get
            {
                return txtFrom.Text;
            }
            set
            {
                txtFrom.Text = value;
            }
        }

        public string MessageSubject
        {
            get
            {
                return txtSubject.Text;
            }
            set
            {
                txtSubject.Text = value;
            }
        }
        public string MessageBody
        {
            get
            {
                return Convert.ToString(ViewState["MsgBody"]);
            }
            set
            {
                ViewState["MsgBody"] = value;
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}