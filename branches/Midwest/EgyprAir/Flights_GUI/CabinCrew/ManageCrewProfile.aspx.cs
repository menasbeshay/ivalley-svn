using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Flight_BLL;

namespace Flights_GUI.CabinCrew
{
    public partial class ManageCrewProfile : System.Web.UI.Page
    {
        #region Properties
        public Crew CurrentCrew
        {
            get
            {
                if (Session["CurrentCrew"] != null)
                    return (Crew)Session["CurrentCrew"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCrew"] = value;
            }
        }
        #endregion 

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchCrew();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
                Master.PageTitle = "Cabin Crew profile";
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
            CurrentCrew = null;
        }

        protected void uiLinkButtonSaveCrew_Click(object sender, EventArgs e)
        {
            if (CurrentCrew != null)
            {
                UpdateCrew();
            }
            else
            {
                AddNewCrew();
            }

            SearchCrew();
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
        }

        protected void uiLinkButtonCancelCrew_Click(object sender, EventArgs e)
        {
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentCrew = null;
        }

        protected void uiRadGridCrew_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridCrew.CurrentPageIndex = e.NewPageIndex;
            SearchCrew();
        }

        protected void uiRadGridCrew_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            SearchCrew();
        }

        protected void uiRadGridCrew_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditCrew")
            {
                Crew objData = new Crew();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentCrew = objData;
                FillCrewData();
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
                
            }

            else if (e.CommandName == "DeleteCrew")
            {
                Crew objData = new Crew();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                if (Membership.GetUser(objData.Username) != null)
                {
                    Membership.DeleteUser(objData.Username);
                }

                objData.MarkAsDeleted();
                objData.Save();
                                
                SearchCrew();
            }
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            SearchCrew();
        }
        #endregion

        #region Methods

        private void SearchCrew()
        {
            Crew CrewObj = new Crew();
            CrewObj.SearchCrew(uiTextBoxSearch.Text);
            uiRadGridCrew.DataSource = CrewObj.DefaultView;
            uiRadGridCrew.DataBind();
        }


        private void AddNewCrew()
        {
            MembershipCreateStatus obj;
            MembershipUser objUser = Membership.CreateUser(uiTextBoxUserName.Text, uiTextBoxPassword.Text, uiTextBoxEmail.Text, null, null, true, out obj);
            bool success = true;
            switch (obj)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    uiLabelError.Text = "duplicate username";
                    uiLabelError.Visible = true;
                    success = false;
                    break;
                case MembershipCreateStatus.InvalidPassword:
                    uiLabelError.Text = "invalid password. password must be (6) characters or more.";
                    uiLabelError.Visible = true;
                    success = false;
                    break;
                case MembershipCreateStatus.ProviderError:
                case MembershipCreateStatus.UserRejected:
                    uiLabelError.Text = "an error occurred. please try again.";
                    uiLabelError.Visible = true;
                    success = false;
                    break;
                default:
                    break;
            }
            if (!Roles.IsUserInRole(uiTextBoxUserName.Text, "CabinCrew") && success)
            {
                Roles.AddUserToRole(uiTextBoxUserName.Text, "CabinCrew");
            }

            if (success)
            {
                Crew objData = new Crew();
                objData.AddNew();
                objData.Name = uiTextBoxName.Text;
                objData.Username = uiTextBoxUserName.Text;
                objData.StaffNo = uiTextBoxStaffNo.Text;
                objData.Email = uiTextBoxEmail.Text;
                objData.Mobile = uiTextBoxMobile.Text;
                 objData.ShortName = uiTextBoxShortName.Text;

                objData.LicenseNo = uiTextBoxLicenseNo.Text;
                if(uiRadDatePickerCompetenecycheck.SelectedDate != null)
                    objData.Competenecycheck = uiRadDatePickerCompetenecycheck.SelectedDate.Value;
                if (uiRadDatePickerMLEF.SelectedDate != null)
                    objData.MEDICALLICENSEEXPIRYFrom = uiRadDatePickerMLEF.SelectedDate.Value;
                if (uiRadDatePickerMLET.SelectedDate != null)
                    objData.MEDICALLICENSEEXPIRYTo = uiRadDatePickerMLET.SelectedDate.Value;
                if (uiRadDatePickerInstructorRenewal.SelectedDate != null)
                    objData.InstructorRenewal = uiRadDatePickerInstructorRenewal.SelectedDate.Value;
                if (uiRadDatePickerTransitionCourse.SelectedDate != null)
                    objData.TRANSITIONCOURSE = uiRadDatePickerTransitionCourse.SelectedDate.Value;
                if (uiRadDatePickerRecurrent12.SelectedDate != null)
                    objData.RECURRENT12 = uiRadDatePickerRecurrent12.SelectedDate.Value;                
                if (uiRadDatePickerRecurrent24.SelectedDate != null)
                    objData.RECURRENT24 = uiRadDatePickerRecurrent24.SelectedDate.Value;
                if (uiRadDatePickerSMS.SelectedDate != null)
                    objData.SMS = uiRadDatePickerSMS.SelectedDate.Value;
                if (uiRadDatePickerSecurity.SelectedDate != null)
                    objData.Security = uiRadDatePickerSecurity.SelectedDate.Value;
                objData.Save();
            }
        }

        private void UpdateCrew()
        {
            Crew objData = new Crew();
            objData = CurrentCrew;
            objData.Name = uiTextBoxName.Text;            
            objData.StaffNo = uiTextBoxStaffNo.Text;
            objData.Email = uiTextBoxEmail.Text;
            objData.Mobile = uiTextBoxMobile.Text;
            objData.ShortName = uiTextBoxShortName.Text;
            objData.LicenseNo = uiTextBoxLicenseNo.Text;
            if (uiRadDatePickerCompetenecycheck.SelectedDate != null)
                objData.Competenecycheck = uiRadDatePickerCompetenecycheck.SelectedDate.Value;
            if (uiRadDatePickerMLEF.SelectedDate != null)
                objData.MEDICALLICENSEEXPIRYFrom = uiRadDatePickerMLEF.SelectedDate.Value;
            if (uiRadDatePickerMLET.SelectedDate != null)
                objData.MEDICALLICENSEEXPIRYTo = uiRadDatePickerMLET.SelectedDate.Value;
            if (uiRadDatePickerInstructorRenewal.SelectedDate != null)
                objData.InstructorRenewal = uiRadDatePickerInstructorRenewal.SelectedDate.Value;
            if (uiRadDatePickerTransitionCourse.SelectedDate != null)
                objData.TRANSITIONCOURSE = uiRadDatePickerTransitionCourse.SelectedDate.Value;
            if (uiRadDatePickerRecurrent12.SelectedDate != null)
                objData.RECURRENT12 = uiRadDatePickerRecurrent12.SelectedDate.Value;
            if (uiRadDatePickerRecurrent24.SelectedDate != null)
                objData.RECURRENT24 = uiRadDatePickerRecurrent24.SelectedDate.Value;
            if (uiRadDatePickerSMS.SelectedDate != null)
                objData.SMS = uiRadDatePickerSMS.SelectedDate.Value;
            if (uiRadDatePickerSecurity.SelectedDate != null)
                objData.Security = uiRadDatePickerSecurity.SelectedDate.Value;
            objData.Save();
        }


        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxStaffNo.Text = "";
            uiTextBoxLicenseNo.Text = "";
            uiRadDatePickerCompetenecycheck.SelectedDate = null;
            uiRadDatePickerMLEF.SelectedDate = null;
            uiRadDatePickerMLET.SelectedDate = null;
            uiRadDatePickerInstructorRenewal.SelectedDate = null;
            uiRadDatePickerTransitionCourse.SelectedDate = null;
            uiRadDatePickerRecurrent12.SelectedDate = null;
            uiRadDatePickerRecurrent24.SelectedDate = null;
            uiRadDatePickerSMS.SelectedDate = null;
            uiRadDatePickerSecurity.SelectedDate = null;
            uiTextBoxUserName.Enabled = true;
            uiTextBoxPassword.Enabled = true;
            uiTextBoxCPassword.Enabled = true;
            RequiredFieldValidator4.Enabled = true;
            RequiredFieldValidator5.Enabled = true;
            CompareValidator1.Enabled = true;

            uiTextBoxPassword.Text = "";
            uiTextBoxUserName.Text = "";
            uiTextBoxEmail.Text = "";
            uiTextBoxCPassword.Text = "";
            uiTextBoxMobile.Text = "";
            uiTextBoxShortName.Text = "";
        }

        private void FillCrewData()
        {
            uiTextBoxName.Text = CurrentCrew.Name;
            uiTextBoxStaffNo.Text = CurrentCrew.StaffNo;
            uiTextBoxEmail.Text = CurrentCrew.Email;
            uiTextBoxMobile.Text = CurrentCrew.Mobile;
            uiTextBoxShortName.Text = CurrentCrew.ShortName;
            uiTextBoxLicenseNo.Text = CurrentCrew.LicenseNo;
            if (!CurrentCrew.IsColumnNull("Competenecycheck"))
                uiRadDatePickerCompetenecycheck.SelectedDate = CurrentCrew.Competenecycheck;
            if (!CurrentCrew.IsColumnNull("MEDICALLICENSEEXPIRYFrom"))
                uiRadDatePickerMLEF.SelectedDate = CurrentCrew.MEDICALLICENSEEXPIRYFrom;
            if (!CurrentCrew.IsColumnNull("MEDICALLICENSEEXPIRYTo"))
                uiRadDatePickerMLET.SelectedDate = CurrentCrew.MEDICALLICENSEEXPIRYTo;
            if (!CurrentCrew.IsColumnNull("InstructorRenewal")) 
                uiRadDatePickerInstructorRenewal.SelectedDate = CurrentCrew.InstructorRenewal;
            if (!CurrentCrew.IsColumnNull("TRANSITIONCOURSE")) 
                uiRadDatePickerTransitionCourse.SelectedDate = CurrentCrew.TRANSITIONCOURSE;
            if (!CurrentCrew.IsColumnNull("RECURRENT12")) 
                uiRadDatePickerRecurrent12.SelectedDate = CurrentCrew.RECURRENT12;
            if (!CurrentCrew.IsColumnNull("RECURRENT24")) 
                uiRadDatePickerRecurrent24.SelectedDate = CurrentCrew.RECURRENT24;
            if (!CurrentCrew.IsColumnNull("SMS")) 
                uiRadDatePickerSMS.SelectedDate = CurrentCrew.SMS;
            if (!CurrentCrew.IsColumnNull("Security"))
                uiRadDatePickerSecurity.SelectedDate = CurrentCrew.Security;

            // fill membership data and disable fields 
            uiTextBoxUserName.Text = CurrentCrew.Username;
            uiTextBoxUserName.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            CompareValidator1.Enabled = false;
            try
            {
                uiTextBoxPassword.Text = Membership.GetUser(CurrentCrew.Username).GetPassword();
            }
            catch (Exception ex)
            {
                uiTextBoxPassword.Text = "";
            }
            uiTextBoxPassword.Enabled = false;
            uiTextBoxCPassword.Enabled = false;
        }

        #endregion

    }
}