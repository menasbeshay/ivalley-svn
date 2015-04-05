using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace brotherssolidarity.Admin
{
    public partial class CareersContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ShowWidgets();
                getCareersData();
            }

            if (getQueryString > 0)
            {
                if (!Page.IsPostBack)
                {
                    ShowWidgets();
                    btnNewCareer.Visible = true;

                    BLL.Career EditCareer = new BLL.Career();
                    EditCareer.LoadByPrimaryKey(getQueryString);

                    txtCareerPosition.Text = EditCareer.PositionEn;
                    uiFCKeditorArContent.Value = Server.HtmlDecode(EditCareer.DescriptionEn);

                    btnCreateCareer.Text = "Update Career";
                }
            }
        }

        private int getQueryString
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["PID"]))
                {
                    return int.Parse(Request.QueryString["PID"].ToString());
                }
                else
                {
                    return 0;
                }
            }
        }

        private void ShowWidgets()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["NewCar"]))
            {
                CreateEditCareerPlaceHolder.Visible = true;
                CareerTablePlaceHolder.Visible = false;
                btnNewCareer.Visible = true;
            }
            else if (getQueryString > 0)
            {
                CreateEditCareerPlaceHolder.Visible = true;
                CareerTablePlaceHolder.Visible = false;
            }
            else
            {
                CreateEditCareerPlaceHolder.Visible = false;
                CareerTablePlaceHolder.Visible = true;
            }
        }

        protected void btnCreateCareer_Click(object sender, EventArgs e)
        {
            BLL.Career NewCareer = new BLL.Career();

            if (getQueryString > 0)
            {
                NewCareer.LoadByPrimaryKey(getQueryString);
                NewCareer.PositionEn = txtCareerPosition.Text;
                
            }
            else
            {
                NewCareer.AddNew();
                NewCareer.PositionEn = txtCareerPosition.Text;
               
            }
            NewCareer.DescriptionEn = Server.HtmlEncode(uiFCKeditorArContent.Value);
            NewCareer.Save();
            Response.Redirect("CareersContent.aspx");
            getCareersData();
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Saved Successfully" + "');", true);
        }

        private void getCareersData()
        {
            BLL.Career CareersData = new BLL.Career();
            CareersData.LoadAll();
            GrdCareers.DataSource = CareersData.DefaultView;
            GrdCareers.DataBind();
        }

        protected void GrdCareers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCareer")
            {
                int ID = int.Parse(e.CommandArgument.ToString());
                Response.Redirect("CareersContent.aspx?PID=" + ID.ToString());
            }
            else if (e.CommandName=="DeleteCareer")
            {
                int ID = int.Parse(e.CommandArgument.ToString());
                BLL.Career DeleteCareer = new BLL.Career();
                DeleteCareer.LoadByPrimaryKey(ID);
                DeleteCareer.MarkAsDeleted();
                DeleteCareer.Save();
                getCareersData();
            }
        }

        protected void btnNewCareer_Click(object sender, EventArgs e)
        {
            Response.Redirect("CareersContent.aspx");
        }

        protected void BtnCreateNewCareer_Click(object sender, EventArgs e)
        {
            Response.Redirect("CareersContent.aspx?NewCar=1");
        }
    }
}