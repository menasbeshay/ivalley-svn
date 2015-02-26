using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Operation
{
    public partial class PilotProfileData : System.Web.UI.Page
    {
        #region Properties
        public Pilot CurrentPilot
        {
            get
            {
                if (Session["CurrentPilot"] != null)
                    return (Pilot)Session["CurrentPilot"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPilot"] = value;
            }
        }
        #endregion 

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchPilots();
                uiPanelALL.Visible = true;
                uiPanelEdit.Visible = false;
                Master.PageTitle = "Pilot profile";
            }
        }


        protected void uiRadGridPilots_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditPilot")
            {
                Pilot objData = new Pilot();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentPilot= objData;
                FillPilotData();
                uiPanelEdit.Visible = true;
                uiPanelALL.Visible = false;

            }

            else if (e.CommandName == "DeletePilot")
            {
                Crew objData = new Crew();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                if (Membership.GetUser(objData.Username) != null)
                {
                    Membership.DeleteUser(objData.Username);
                }

                objData.MarkAsDeleted();
                objData.Save();

                SearchPilots();
            }
        }


        protected void uiRadGridPilots_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridPilots.CurrentPageIndex = e.NewPageIndex;
            SearchPilots();
        }

        protected void uiRadGridPilots_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            SearchPilots();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelALL.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
            CurrentPilot = null;
        }


        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            if (CurrentPilot != null)
            {
                UpdatePilot();
            }
            else
            {
                AddNewPilot();
            }

            SearchPilots();
            uiPanelALL.Visible = true;
            uiPanelEdit.Visible = false;
        }


        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelALL.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentPilot = null;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            SearchPilots();
        }

        #endregion

        #region Methods
        private void SearchPilots()
        {
            Pilot PilotObj = new Pilot();
            PilotObj.SearchPilot(uiTextBoxSearch.Text);
            uiRadGridPilots.DataSource = PilotObj.DefaultView;
            uiRadGridPilots.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxFN.Text = "";
            uiTextBoxLN.Text = "";
            uiTextBoxSurName.Text = "";
            uiTextBoxLicNo.Text = "";
            uiRadDatePickerLicExp.SelectedDate = null;
            uiTextBoxStaffNo.Text = "";
            uiTextBoxShortName.Text = "";
            uiCheckBoxIsPilot.Checked = false;
            uiTextBoxEmail.Text = "";
            uiTextBoxMobile.Text = "";
            uiTextBoxAddress.Text = "";
            uiTextBoxPassportNo.Text = "";
            uiRaddatepickerPassportExpiry.SelectedDate = null;
            uiTextBoxUsername.Text = "";
            uiTextBoxPassword.Text = "";
            RequiredFieldValidator6.Enabled = true;
            RequiredFieldValidator7.Enabled = true;
        }

        private void AddNewPilot()
        {
            MembershipCreateStatus obj;
            MembershipUser objUser = Membership.CreateUser(uiTextBoxUsername.Text, uiTextBoxPassword.Text, uiTextBoxEmail.Text, null, null, true, out obj);
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
            if (!Roles.IsUserInRole(uiTextBoxUsername.Text, "Pilot") && success)
            {
                Roles.AddUserToRole(uiTextBoxUsername.Text, "Pilot");
            }

            if (success)
            {
                Pilot newpilot = new Pilot();
                newpilot.AddNew();
                newpilot.FirstName = uiTextBoxFN.Text;
                newpilot.SecondName = uiTextBoxLN.Text;
                newpilot.SureName = uiTextBoxSurName.Text;
                newpilot.LicenseNo = uiTextBoxLicNo.Text;
                if (uiRadDatePickerLicExp.SelectedDate != null)
                    newpilot.LicenseRenewDate = uiRadDatePickerLicExp.SelectedDate.Value;
                newpilot.StaffNo = uiTextBoxStaffNo.Text;
                newpilot.ShortName = uiTextBoxShortName.Text;
                newpilot.IsPilot = uiCheckBoxIsPilot.Checked;
                newpilot.Email = uiTextBoxEmail.Text;
                newpilot.Mobile = uiTextBoxMobile.Text;
                newpilot.Address = uiTextBoxAddress.Text;
                newpilot.PassportNo = uiTextBoxPassportNo.Text;
                if (uiRaddatepickerPassportExpiry.SelectedDate != null)
                    newpilot.PassportExpiryDate = uiRaddatepickerPassportExpiry.SelectedDate.Value;
                newpilot.Save();
            }
        }

        private void UpdatePilot()
        {
            CurrentPilot.FirstName = uiTextBoxFN.Text;
            CurrentPilot.SecondName = uiTextBoxLN.Text;
            CurrentPilot.SureName = uiTextBoxSurName.Text;
            CurrentPilot.LicenseNo = uiTextBoxLicNo.Text;
            if (uiRadDatePickerLicExp.SelectedDate  !=null)
                CurrentPilot.LicenseRenewDate = uiRadDatePickerLicExp.SelectedDate.Value;
            CurrentPilot.StaffNo = uiTextBoxStaffNo.Text;
            CurrentPilot.ShortName = uiTextBoxShortName.Text;
            CurrentPilot.IsPilot = uiCheckBoxIsPilot.Checked;
            CurrentPilot.Email = uiTextBoxEmail.Text;
            CurrentPilot.Mobile = uiTextBoxMobile.Text;
            CurrentPilot.Address = uiTextBoxAddress.Text;
            CurrentPilot.PassportNo = uiTextBoxPassportNo.Text;
            if (uiRaddatepickerPassportExpiry.SelectedDate != null)
                CurrentPilot.PassportExpiryDate = uiRaddatepickerPassportExpiry.SelectedDate.Value;
            CurrentPilot.Save();
        }

        private void FillPilotData()
        {
            uiTextBoxFN.Text = CurrentPilot.FirstName;
            uiTextBoxLN.Text = CurrentPilot.SecondName;
            uiTextBoxSurName.Text = CurrentPilot.SureName;
            uiTextBoxLicNo.Text = CurrentPilot.LicenseNo;
            if(!CurrentPilot.IsColumnNull(Pilot.ColumnNames.LicenseRenewDate))
                uiRadDatePickerLicExp.SelectedDate = CurrentPilot.LicenseRenewDate;
            uiTextBoxStaffNo.Text = CurrentPilot.StaffNo;
            uiTextBoxShortName.Text = CurrentPilot.ShortName;
            uiCheckBoxIsPilot.Checked = CurrentPilot.IsPilot;
            uiTextBoxEmail.Text = CurrentPilot.Email;
            uiTextBoxMobile.Text = CurrentPilot.Mobile;
            uiTextBoxAddress.Text = CurrentPilot.Address;
            uiTextBoxPassportNo.Text = CurrentPilot.PassportNo;
            if (!CurrentPilot.IsColumnNull(Pilot.ColumnNames.PassportExpiryDate))
                uiRaddatepickerPassportExpiry.SelectedDate = CurrentPilot.PassportExpiryDate;
            uiTextBoxPassword.Text = Membership.GetUser(CurrentPilot.UserName).GetPassword();
        }

        #endregion

    }
}