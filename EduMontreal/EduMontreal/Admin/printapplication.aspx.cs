using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal.Admin
{
    public partial class printapplication : System.Web.UI.Page
    {
        public int AppDataID
        {
            get
            {
                if (Request.QueryString["AppDataID"] != null)
                {
                    int d = 0;
                    int.TryParse(Request.QueryString["AppDataID"].ToString(), out d);
                    return d;
                }
                return 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (AppDataID != 0)
            {
                ApplicationData app = new ApplicationData ();
                app.GetApplication_print(AppDataID);
                uiReportViewer.LocalReport.DataSources.Add(app.DefaultView);
                uiReportViewer.LocalReport.Refresh();
            }
        }
    }
}