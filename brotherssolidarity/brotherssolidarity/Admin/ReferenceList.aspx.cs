using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brotherssolidarity.Admin
{
    public partial class ReferenceList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getReferenceData();
            }
        }

        
        private void getReferenceData()
        {
            BLL.Reference obj = new BLL.Reference();
            obj.LoadAll();

            GrdReferences.DataSource = obj.DefaultView;
            GrdReferences.DataBind();
        }

        protected void btnCreateCollection_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageReference.aspx");
        }

        protected void LinkBtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int ID = int.Parse(btn.CommandArgument.ToString());
            Response.Redirect("ManageReference.aspx?refID=" + ID.ToString());
        }

        protected void LinkBtnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int ID = int.Parse(btn.CommandArgument.ToString());
            BLL.Reference obj = new BLL.Reference();
            obj.LoadByPrimaryKey(ID);
            obj.MarkAsDeleted();
            obj.Save();
            getReferenceData();
        }

        protected void GrdReferences_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdReferences.PageIndex = e.NewPageIndex;
            getReferenceData();
        }
    }

}
