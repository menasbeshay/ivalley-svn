using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
namespace GlobalLogistics.WebSite.MasterPages
{
    public partial class Company : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool servicesEnabled = false;
                Companies currentCompany = new Companies();
                currentCompany.GetCompanyByUserName(Page.User.Identity.Name);
                CompanyEnabledOptions options = new CompanyEnabledOptions();
                options.GetCompanyEnabledOptionsByCompanyID(currentCompany.CompanyID);
                for (int i = 0; i < options.RowCount;i++ )
                {
                    if ((options.PackageOptionID == 11 || options.PackageOptionID == 12 || options.PackageOptionID == 13 || options.PackageOptionID == 14) && !servicesEnabled)
                    {
                        servicesEnabled = true;
                        if(options.Enabled)
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a class='hide' href='../Company/Services.aspx'>الخدمات</a></li>";
                    }
                    if (options.PackageOptionID == 16)
                    {
                        if (options.Enabled)
                            uiLiteralMenu.Text += " <li class='VMenuBorder'></li><li><a class='hide' href='../Company/Photos.aspx'>الصور</a></li>";
                    }
                    if (options.PackageOptionID == 17)
                    {
                        if (options.Enabled)
                            uiLiteralMenu.Text += " <li class='VMenuBorder'></li><li><a class='hide' href='../Company/Vidoes.aspx'>الفيديو</a></li>";   
                    }
                    if (options.PackageOptionID == 19)
                    {
                        if (options.Enabled)
                            uiLiteralMenu.Text += " <li class='VMenuBorder'></li><li><a class='hide' href='../Company/Schedule.aspx'>الجدول الملاحى</a></li>";
                    }
                    options.MoveNext();
                }                
            }

        }
    }
}