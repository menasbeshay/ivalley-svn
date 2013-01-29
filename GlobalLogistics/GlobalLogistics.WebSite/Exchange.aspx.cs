using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Arabic
{
    public partial class Exchange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.Exchange ex = new BLL.Exchange();
                ex.GetTopExchange();
                UIGridViewExchange.DataSource = ex.DefaultView;
                UIGridViewExchange.DataBind();
            }
        }

        protected void UIGridViewExchange_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                Label temp = (Label)e.Row.FindControl("uiLabelCurrencyName");
                Currency curr = new Currency();
                curr.LoadByPrimaryKey(Convert.ToInt32(objData["CurrencyID"].ToString()));
                temp.Text = curr.ArName;
            }
        }
    }
}