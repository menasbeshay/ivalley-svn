using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Globalization;

namespace Flights_GUI.CabinCrew
{
    public partial class CrewSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindData();
                if (Request.QueryString["F"] != null)
                {
                    uiTextBoxFrom.Text = Request.QueryString["F"].ToString();
                }
                else
                {
                    uiTextBoxFrom.Text = GetWeekStartDaTe().ToString("dd/MM/yyyy");
                }
                if (Request.QueryString["T"] != null)
                {
                    uiTextBoxTo.Text = Request.QueryString["T"].ToString();
                }
                else
                {
                    uiTextBoxTo.Text = GetWeekStartDaTe().AddDays(7).ToString("dd/MM/yyyy");
                }                
            }
        }

        private DateTime GetWeekStartDaTe()
        {
            if (DateTime.Now.DayOfWeek == DayOfWeek.Monday)
            {
                return DateTime.Now;
            }
            else if (DateTime.Now.DayOfWeek == DayOfWeek.Sunday)
            {
                return DateTime.Now.AddDays(1);
            }
            else
            {
                return DateTime.Now.AddDays(-1 * (Convert.ToInt32(DateTime.Now.DayOfWeek) - 1));
            }
        }


        private void BindData()
        {
            Crew current = new Crew();
            current.GetCrewByUserName(Page.User.Identity.Name);
            Crew p = new Crew();
            DateTime? From = null;
            DateTime? To = null;
            CultureInfo provider = CultureInfo.InvariantCulture;
            provider = new CultureInfo("fr-FR");
            if (!string.IsNullOrEmpty(uiTextBoxFrom.Text))
            {
                From = DateTime.ParseExact(uiTextBoxFrom.Text, "dd/MM/yyyy", provider);
            }
            if (!string.IsNullOrEmpty(uiTextBoxTo.Text))
            {
                To = DateTime.ParseExact(uiTextBoxTo.Text, "dd/MM/yyyy", provider);
            }
            if (current.RowCount > 0)
                p.GetCrewSchedule(current.CrewID, From, To);
            else
                p.GetCrewSchedule(0, From, To);
            uiGridViewSchedule.DataSource = p.DefaultView;
            uiGridViewSchedule.DataBind();
        }

        protected void uiLinkButtonExport_Click(object sender, EventArgs e)
        {
            Response.Redirect("Exportschedule.aspx?F=" + uiTextBoxFrom.Text + "&T=" + uiTextBoxTo.Text);
        }

        protected void uiLinkButtonView_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiGridViewSchedule_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSchedule.PageIndex = e.NewPageIndex;
            BindData();
        }
    }
}