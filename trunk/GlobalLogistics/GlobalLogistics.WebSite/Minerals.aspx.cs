using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;
namespace GlobalLogistics.WebSite.Arabic
{
    public partial class Minerals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.Mineral mins = new BLL.Mineral();
                mins.GetTopMinerals();
                UIGridViewMinerals.DataSource = mins.DefaultView;
                UIGridViewMinerals.DataBind();
            }
        }

        protected void UIGridViewMinerals_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                Label temp = (Label)e.Row.FindControl("uiLabelMineralName");
                Mines curr = new Mines();
                curr.LoadByPrimaryKey(Convert.ToInt32(objData["MinID"].ToString()));
                temp.Text = curr.ArName;
            }
        }
    }
}