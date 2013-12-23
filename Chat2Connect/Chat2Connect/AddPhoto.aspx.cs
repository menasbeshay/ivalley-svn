using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class AddPhoto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            string path = "~/" + ConfigurationManager.AppSettings["accountpics"].ToString();
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath(path + "/" + Membership.GetUser().ProviderUserKey.ToString()));
            if (!dir.Exists)
                dir.Create();
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            path += "/" + Membership.GetUser().ProviderUserKey.ToString();
            if (uiFileUploadImage.HasFile)
            {
                path = path + "/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_") + uiFileUploadImage.FileName;
                uiFileUploadImage.SaveAs(Server.MapPath(path));
                MemberPic pic = new MemberPic ();
                pic.AddNew();
                pic.Description = path.Substring(1);
                pic.MemberID = member.MemberID;
                pic.Save();
            }
        }
    }
}