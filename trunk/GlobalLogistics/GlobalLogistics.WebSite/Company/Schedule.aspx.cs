using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.IO;

namespace GlobalLogistics.WebSite.Company
{
    public partial class Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Companies currentCompany = new Companies();
            currentCompany.GetCompanyByUserName(Page.User.Identity.Name);
            if (uiFileUpload.HasFile)
            {
                DirectoryInfo Dir = new DirectoryInfo(Server.MapPath("~/FileUploads/Companies/" + currentCompany.CompanyID.ToString()));
                if (!Dir.Exists)
                    Dir.Create();

                uiFileUpload.SaveAs(Server.MapPath("~/FileUploads/Companies/" + currentCompany.CompanyID.ToString() + "/" + uiFileUpload.FileName));
                currentCompany.SchedulePath = "/FileUploads/Companies/" + currentCompany.CompanyID.ToString() + "/" + uiFileUpload.FileName;
                currentCompany.Save();
                uiLabelmsg.Visible = true;
            }
        }
    }
}