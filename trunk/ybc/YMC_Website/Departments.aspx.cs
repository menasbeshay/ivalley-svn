using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YMC_Website
{
    public partial class Departments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["did"] != null && !string.IsNullOrEmpty(Request.QueryString["did"]))
                {
                    uiPanelViewAllPages.Visible = false;
                    uiPanelEdit.Visible = true;
                    int id = Convert.ToInt32(Request.QueryString["did"].ToString());
                    YMC.BLL.Departements currentdept = new YMC.BLL.Departements();
                    currentdept.LoadByPrimaryKey(id);                    
                    uiLabelTitle.Text = currentdept.Name;
                    uiLiteralContent.Text = Server.HtmlDecode(currentdept.DetailsArabic);
                }
                else
                {
                    uiPanelViewAllPages.Visible = true;
                    uiPanelEdit.Visible = false;
                    BindData();
                }
            }
        }

        private void BindData()
        {
            YMC.BLL.Departements objData = new YMC.BLL.Departements();
            objData.LoadAll();
            uiDataListDepts.DataSource = objData.DefaultView;
            uiDataListDepts.DataBind();
        }
    }


}