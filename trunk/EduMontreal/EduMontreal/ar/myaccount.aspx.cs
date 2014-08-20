using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal.ar
{
    public partial class myaccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("userlogin");
                }
                BindControls();
                BindAccountInfo();
                Master.PageTitle = "حسابى";
            }
        }

        private void BindAccountInfo()
        {
            Student student = (Student)Session["CurrentUser"];
            uiTextBoxFamilyName.Text = student.FamilyName;
            uiTextBoxFirstName.Text = student.FirstName;
            uiTextBoxMiddleName.Text = student.MiddleName;
            uiTextBoxDOB.Text = student.DateOfBirth.ToString("dd/MM/yyyy");
            uiTextBoxPOB.Text = student.CityofBirth;
            uiDropDownListCountry.SelectedValue = student.CitizenShipID.ToString();
            uiTextBoxMobile.Text = student.CellPhoneNumber;
            uiTextBoxEmail.Text = student.Email;
            uiTextBoxEmail.ReadOnly = true;
            uiTextBoxPassword.Attributes.Add("value", student.UserPassword);
        }
          protected void uiLinkButtonSignUp_Click(object sender, EventArgs e)
        {
            if (uiDropDownListCountry.SelectedIndex != 0)
            {
                uiLabelCountryError.Visible = false;
                //uiLabelUserExist.Visible = false;
                Student student = (Student)Session["CurrentUser"];
                
                student.FamilyName = uiTextBoxFamilyName.Text;
                student.FirstName = uiTextBoxFirstName.Text;
                student.MiddleName = uiTextBoxMiddleName.Text;
                student.DateOfBirth = DateTime.ParseExact(uiTextBoxDOB.Text, "dd/MM/yyyy", null);
                student.CityofBirth = uiTextBoxPOB.Text;
                student.CitizenShipID = Convert.ToInt32(uiDropDownListCountry.SelectedValue);
                student.CellPhoneNumber = uiTextBoxMobile.Text;
                student.Email = uiTextBoxEmail.Text;
                student.UserPassword = uiTextBoxPassword.Text;               
                student.Save();
                    

            }
            else
            {
                uiLabelCountryError.Visible = true;
            }
            
        }        

        #region Methods
        private void BindControls()
        {
            Country countries = new Country();
            countries.LoadAll();
            uiDropDownListCountry.DataSource = countries.DefaultView;
            uiDropDownListCountry.DataTextField = Country.ColumnNames.ArCountryName;
            uiDropDownListCountry.DataValueField = Country.ColumnNames.CountryID;
            uiDropDownListCountry.DataBind();
            uiDropDownListCountry.Items.Insert(0, new ListItem("إختر البلد", "0"));

            Gender gender = new Gender();
            gender.LoadAll();
            uiRadioButtonListGender.DataSource = gender.DefaultView;
            uiRadioButtonListGender.DataTextField = Gender.ColumnNames.ArGenderTypr;
            uiRadioButtonListGender.DataValueField = Gender.ColumnNames.GenderID;
            uiRadioButtonListGender.DataBind();
            uiRadioButtonListGender.SelectedIndex = 0;

        }
        #endregion
    }
}