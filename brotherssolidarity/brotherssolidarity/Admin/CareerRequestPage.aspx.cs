using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace brotherssolidarity.Admin
{
    public partial class CareerRequestPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataBindReq();
        }

        protected void GrdCareerRequest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            CareerRequests carReq = new CareerRequests();
            carReq.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));

            if (e.CommandName=="DownloadCV")
            {
                string url = carReq.CVPath.ToString();
                Response.Redirect(url);
            }
            else if (e.CommandName=="DeleteGrd")
            {
                carReq.MarkAsDeleted();
                carReq.Save();
                DataBindReq();
            }

        }

        protected void GrdCareerRequest_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void DataBindReq()
        {
            CareerRequests CareerReq = new CareerRequests();
            CareerReq.LoadAll();
            GrdCareerRequest.DataSource = CareerReq.DefaultView;
            GrdCareerRequest.DataBind(); 
        }

        protected void GrdCareerRequest_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView Row = (DataRowView)e.Row.DataItem;
                if (!string.IsNullOrEmpty(Row["CareerID"].ToString()))
                {
                    int ID = int.Parse(Row["CareerID"].ToString());

                    BLL.Career currCareer = new BLL.Career();                    
                    if (currCareer.LoadByPrimaryKey(ID))
                    {
                        Label lblCareerName = e.Row.FindControl("uiLabelPostion") as Label;
                        lblCareerName.Text = currCareer.PositionEn;
                    }
                }
            }
        }
          
    }
}