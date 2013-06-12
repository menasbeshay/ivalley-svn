using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
namespace Flights_GUI.CabinCrew
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillCrewData();
        }

        private void FillCrewData()
        {
            Crew CurrentCrew = new Crew();
            CurrentCrew.GetCrewByUserName(Page.User.Identity.Name);
            uiLabelName.Text = CurrentCrew.Name;
            uiLabelStaffNo.Text = CurrentCrew.StaffNo.ToString();
            uiLabelLicenseNo.Text = CurrentCrew.LicenseNo;
            if (!CurrentCrew.IsColumnNull("Competenecycheck"))
                uiLabelCompetencyCheck.Text = CurrentCrew.Competenecycheck.ToString("dd/MM/yyyy"); ;
            if (!CurrentCrew.IsColumnNull("MEDICALLICENSEEXPIRYFrom"))
                uiLabelFrom.Text = CurrentCrew.MEDICALLICENSEEXPIRYFrom.ToString("dd/MM/yyyy"); ;
            if (!CurrentCrew.IsColumnNull("MEDICALLICENSEEXPIRYTo"))
                uiLabelTo.Text = CurrentCrew.MEDICALLICENSEEXPIRYTo.ToString("dd/MM/yyyy"); ;
            if (!CurrentCrew.IsColumnNull("InstructorRenewal"))
                uiLabelInstructorRenewal.Text = CurrentCrew.InstructorRenewal.ToString("dd/MM/yyyy"); ;
            if (!CurrentCrew.IsColumnNull("TRANSITIONCOURSE"))
                uiLabeltransitionCourse.Text = CurrentCrew.TRANSITIONCOURSE.ToString("dd/MM/yyyy"); ;
            if (!CurrentCrew.IsColumnNull("RECURRENT12"))
                uiLabelRecurrent12.Text = CurrentCrew.RECURRENT12.ToString("dd/MM/yyyy"); ;
            if (!CurrentCrew.IsColumnNull("RECURRENT24"))
                uiLabelRecurrent24.Text = CurrentCrew.RECURRENT24.ToString("dd/MM/yyyy"); ;
            if (!CurrentCrew.IsColumnNull("SMS"))
                uiLabelSMS.Text = CurrentCrew.SMS.ToString("dd/MM/yyyy"); ;
            if (!CurrentCrew.IsColumnNull("Security"))
                uiLabelSecurity.Text = CurrentCrew.Security.ToString("dd/MM/yyyy"); ;
            
            uiLabelUsername.Text = CurrentCrew.Username;            
        }
    }
}