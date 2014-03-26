using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;

namespace Taqwa.Website
{
    public partial class GSB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiRepeaterSchoolBus.DataSource = db.GetAllSchoolBus();
            uiRepeaterSchoolBus.DataBind();
        }
    }
}