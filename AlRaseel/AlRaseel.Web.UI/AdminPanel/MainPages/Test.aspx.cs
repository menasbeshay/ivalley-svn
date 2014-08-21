using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.DataModels;
using Data.Extensions;
using Data.Repositories;


namespace Web.UI.AdminPanel.MainPages
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
                gitdata();
            
        }

        private void gitdata()
        {
            //AdminRepository _Obj = new AdminRepository();
            //grd.DataSource = _Obj.LoadByActiveState();
            //grd.DataBind();

            //ddl.DataSource = _Obj.LoadByActiveState();
            //ddl.DataTextField = "username";
            //ddl.DataValueField = "Id";

            //ddl.DataBind();

            ProductImagesRepositories _obj = new ProductImagesRepositories();
            grd.DataSource = _obj.LoadByProductIdAndLanguageId("b5c66d73-b2fa-436d-817a-e5332af83934", "c9dd4e88-fca1-460d-a0ab-233ddcf876ca");
            grd.DataBind();
            //PageSectionsRepository _obj = new PageSectionsRepository();
            //grd.DataSource = _obj.LoadByActiveState();
            //grd.DataBind();

            //LanguageRepository _Obj = new LanguageRepository();
            //grd.DataSource = _Obj.LoadByActiveState();
            //grd.DataBind();

            //PageRepository _Obj = new PageRepository();
            //grd.DataSource = _Obj.LoadByActiveState();
            //grd.DataBind();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            LanguageRepository obj = new LanguageRepository();
            obj._Obj.Name = txtname.Text;
            obj.Add();
            txtname.Text = "";
            gitdata();
        }





    }
}