using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brotherssolidarity
{
    public partial class Investors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFilesCat1();
                LoadFilesCat2();
                LoadFilesCat3(); 
                LoadFilesCat4();
            }
        }

        private void LoadFilesCat4()
        {
            BLL.InvestorFile files = new BLL.InvestorFile();
            files.GetFilesByCatID(4);

            uiGridViewFilesCat4.DataSource = files.DefaultView;
            uiGridViewFilesCat4.DataBind();
        }

        private void LoadFilesCat3()
        {
            BLL.InvestorFile files = new BLL.InvestorFile();
            files.GetFilesByCatID(3);

            uiGridViewFilesCat3.DataSource = files.DefaultView;
            uiGridViewFilesCat3.DataBind();
        }

        private void LoadFilesCat2()
        {
            BLL.InvestorFile files = new BLL.InvestorFile();
            files.GetFilesByCatID(2);

            uiGridViewFilesCat2.DataSource = files.DefaultView;
            uiGridViewFilesCat2.DataBind();
        }

        private void LoadFilesCat1()
        {
            BLL.InvestorFile files = new BLL.InvestorFile();
            files.GetFilesByCatID(1);

            uiGridViewFilesCat1.DataSource = files.DefaultView;
            uiGridViewFilesCat1.DataBind();
        }
    }
}
