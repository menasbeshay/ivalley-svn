using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal.Admin
{
    public partial class appdata : System.Web.UI.Page
    {
        public int StudentID
        {
            get
            {
                if (Request.QueryString["sid"] != null)
                {
                    int d = 0;
                    int.TryParse(Request.QueryString["sid"].ToString(), out d);
                    return d;
                }
                return 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (StudentID != 0)
                {
                    LoadDDls();
                    BindFields();
                }
                else
                    Response.Redirect("applications");

            }
        }

        private void LoadDDls()
        {
            Country countries = new Country();
            countries.LoadAll();
            uiDropDownListAddressCountry.DataSource = countries.DefaultView;
            uiDropDownListAddressCountry.DataTextField = Country.ColumnNames.CountryName;
            uiDropDownListAddressCountry.DataValueField = Country.ColumnNames.CountryID;
            uiDropDownListAddressCountry.DataBind();
            uiDropDownListAddressCountry.Items.Insert(0, new ListItem("Select ....", "0"));

            uiDropDownListCOI.DataSource = countries.DefaultView;
            uiDropDownListCOI.DataTextField = Country.ColumnNames.CountryName;
            uiDropDownListCOI.DataValueField = Country.ColumnNames.CountryID;
            uiDropDownListCOI.DataBind();
            uiDropDownListCOI.Items.Insert(0, new ListItem("Select ....", "0"));

            uiDropDownListCountry.DataSource = countries.DefaultView;
            uiDropDownListCountry.DataTextField = Country.ColumnNames.CountryName;
            uiDropDownListCountry.DataValueField = Country.ColumnNames.CountryID;
            uiDropDownListCountry.DataBind();
            uiDropDownListCountry.Items.Insert(0, new ListItem("Select ....", "0"));

            uiDropDownListPOB.DataSource = countries.DefaultView;
            uiDropDownListPOB.DataTextField = Country.ColumnNames.CountryName;
            uiDropDownListPOB.DataValueField = Country.ColumnNames.CountryID;
            uiDropDownListPOB.DataBind();
            uiDropDownListPOB.Items.Insert(0, new ListItem("Select ....", "0"));

            CourseLangauge langs = new CourseLangauge();
            langs.LoadAll();
            uiDropDownListLanguage.DataSource = langs.DefaultView;
            uiDropDownListLanguage.DataTextField = CourseLangauge.ColumnNames.Langauge;
            uiDropDownListLanguage.DataValueField = CourseLangauge.ColumnNames.CourseLangaugeID;
            uiDropDownListLanguage.DataBind();
            uiDropDownListLanguage.Items.Insert(0, new ListItem("Select ....", "0"));

            Gender genders = new Gender();
            genders.LoadAll();
            uiRadioButtonListGender.DataSource = genders.DefaultView;
            uiRadioButtonListGender.DataTextField = Gender.ColumnNames.GenderType;
            uiRadioButtonListGender.DataValueField = Gender.ColumnNames.GenderID;
            uiRadioButtonListGender.DataBind();
            uiRadioButtonListGender.SelectedIndex = 0;
        }

        protected void uiDropDownListLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {

            Course courses = new Course();
            courses.GetCourseByLanguageID(Convert.ToInt32(uiDropDownListLanguage.SelectedValue));
            if (courses.RowCount > 0)
                uiDropDownListCourses.DataSource = courses.DefaultView;
            else
                uiDropDownListCourses.DataSource = null;
            uiDropDownListCourses.DataTextField = "DisplayName";
            uiDropDownListCourses.DataValueField = Course.ColumnNames.CourseID;
            uiDropDownListCourses.DataBind();
        }


        private void BindFields()
        {
            Student student = new Student ();
            student.LoadByPrimaryKey(StudentID);
            ApplicationData app = new ApplicationData();
            app.GetApplicationByStudentID(student.StudentID);
            if (app.RowCount > 0 )
            {
                uiTextBoxFamilyName.Text = app.FamilyName;
                uiTextBoxFirstName.Text = app.FirstName;
                uiTextBoxMiddleName.Text = app.MiddleName;
                if (!(app.IsColumnNull("DateOfBirth")))
                    uiTextBoxDOB.Text = app.DateOfBirth.ToString("dd/MM/yyyy");
                if (!app.IsColumnNull("CountryOfBirthID"))
                    uiDropDownListPOB.SelectedValue = app.CountryOfBirthID.ToString();

                uiTextBoxHeight.Text = app.Hieght.ToString();
                uiTextBoxWeight.Text = app.Weight.ToString();

                uiRadioButtonListGender.SelectedValue = app.GenderID.ToString();
                if (!(app.IsColumnNull("CitizenShipID")))
                    uiDropDownListCountry.SelectedValue = app.CitizenShipID.ToString();
                uiTextBoxPassNo.Text = app.PassportNo;
                if (!app.IsColumnNull("PassportExpiryDate"))
                    uiTextBoxPassExp.Text = app.PassportExpiryDate.ToString("dd/MM/yyyy");
                if (!app.IsColumnNull("CountryOfIssueID"))
                    uiDropDownListCOI.SelectedValue = app.CountryOfIssueID.ToString();

                uiTextBoxFaFamilyName.Text = app.FatherFamilyName;
                uiTextBoxFaFirstName.Text = app.FatherFirstName;
                uiTextBoxFaOccupation.Text = app.FatherOccupation;
                uiTextBoxFaHomePhone.Text = app.FatherHomePhone;
                uiTextBoxFaBusPhone.Text = app.FatherBusinessPhone;
                uiTextBoxFaMobile.Text = app.FatherCellPhone;
                uiTextBoxMoFamilyName.Text = app.MotherFamilyName;
                uiTextBoxMoFirstName.Text = app.MotherFirstName;
                uiTextBoxMoOccupation.Text = app.MotherOccupation;

                uiTextBoxStreetAddress.Text = app.StreetAddress;
                if (!app.IsColumnNull("CountryID"))
                    uiDropDownListAddressCountry.SelectedValue = app.CountryID.ToString();
                uiTextBoxCity.Text = app.City;
                uiTextBoxAddTele.Text = app.TelephoneNumber;
                uiTextBoxAddFax.Text = app.FaxNumber;
                uiTextBoxEmail.Text = app.Email;
                uiTextBoxCellphone.Text = app.CellPhone;

                uiTextBoxResAddress.Text = app.ResidentAddress;

                uiTextBoxMDS.Text = app.MasterDegree;
                uiTextBoxMDUniversity.Text = app.University;
                if (!app.IsColumnNull("DateOfGraduation"))
                    uiTextBoxMDDate.Text = app.DateOfGraduation.ToString("dd/MM/yyyy");

                uiTextBoxBach.Text = app.BachelorDegree;
                uiTextBoxBachUni.Text = app.BachelorUniversity;
                if (!app.IsColumnNull("BachelorGraduationDate"))
                    uiTextBoxBachDate.Text = app.BachelorGraduationDate.ToString("dd/MM/yyyy");

                uiTextBoxHighSchool.Text = app.HighScool;
                uiTextBoxHighCollege.Text = app.HighSchoolCollege;
                if (!app.IsColumnNull("HighSchoolGradDate"))
                    uiTextBoxHighDate.Text = app.HighSchoolGradDate.ToString("dd/MM/yyyy");

                uiTextBoxDS.Text = app.DegreeSpecialization;
                uiTextBoxKOD.Text = app.KindOfDegree;
                uiTextBoxCS.Text = app.College;
                if (!app.IsColumnNull("DegreeDateOfGraduation"))
                    uiTextBoxDDOG.Text = app.DegreeDateOfGraduation.ToString("dd/MM/yyyy");

                if (!app.IsColumnNull("SelectedCourseID"))
                {
                    Course course = new Course();
                    course.LoadByPrimaryKey(app.SelectedCourseID);

                    uiDropDownListLanguage.SelectedValue = course.CourseLangaugeID.ToString();

                    Course courses = new Course();
                    courses.GetCourseByLanguageID(Convert.ToInt32(uiDropDownListLanguage.SelectedValue));
                    if (courses.RowCount > 0)
                        uiDropDownListCourses.DataSource = courses.DefaultView;
                    else
                        uiDropDownListCourses.DataSource = null;
                    uiDropDownListCourses.DataTextField = "DisplayName";
                    uiDropDownListCourses.DataValueField = Course.ColumnNames.CourseID;
                    uiDropDownListCourses.DataBind();

                    uiDropDownListCourses.SelectedValue = app.SelectedCourseID.ToString();
                }

            }
        }

        protected void uiLinkButtonFinish_Click(object sender, EventArgs e)
        {
            uiLabelError.Visible = false;
            int errortab = -1;
            if (uiDropDownListCOI.SelectedIndex == 0)
            {
                uiLabelError.Text += "<br />Country of issue is required.";
                errortab = 0;
            }
            if (uiDropDownListCountry.SelectedIndex == 0)
            {
                uiLabelError.Text += "<br />Citizenship is required.";
                errortab = 0;
            }
            if (uiDropDownListPOB.SelectedIndex == 0)
            {
                uiLabelError.Text += "<br />Place of birth is required.";
                errortab = 0;
            }
            if (uiDropDownListAddressCountry.SelectedIndex == 0)
            {
                uiLabelError.Text += "<br />Country for mailing address is required.";
                if (errortab == -1 || errortab > 2)
                    errortab = 2;
            }

            if (uiDropDownListCourses.SelectedIndex == -1)
            {
                uiLabelError.Text += "<br />Course is required.";
                if (errortab == -1 || errortab > 5)
                    errortab = 5;
            }

            if (errortab > -1)
            {
                ScriptManager.RegisterStartupScript(uiLinkButtonFinish, this.GetType(), "Error", "$(document).ready(function (){ $('#rootwizard').bootstrapWizard('show'," + errortab.ToString() + "); });", true);
                uiLabelError.Visible = true;
                return;
            }

            Student student = new Student();
            student.LoadByPrimaryKey(StudentID);

            ApplicationData application = new ApplicationData();
            application.GetApplicationByStudentID(student.StudentID);
            if (application.RowCount == 0)
                application.AddNew();

            application.FamilyName = uiTextBoxFamilyName.Text;
            application.FirstName = uiTextBoxFirstName.Text;
            application.MiddleName = uiTextBoxMiddleName.Text;
            application.DateOfBirth = DateTime.ParseExact(uiTextBoxDOB.Text, "dd/MM/yyyy", null);
            application.CountryOfBirthID = Convert.ToInt32(uiDropDownListPOB.SelectedValue);
            double height, weight = 0;
            double.TryParse(uiTextBoxHeight.Text, out height);
            double.TryParse(uiTextBoxWeight.Text, out weight);
            application.Hieght = height;
            application.Weight = weight;
            application.GenderID = Convert.ToInt32(uiRadioButtonListGender.SelectedValue);
            application.CitizenShipID = Convert.ToInt32(uiDropDownListCountry.SelectedValue);
            application.PassportNo = uiTextBoxPassNo.Text;
            application.PassportExpiryDate = DateTime.ParseExact(uiTextBoxPassExp.Text, "dd/MM/yyyy", null);
            application.CountryOfIssueID = Convert.ToInt32(uiDropDownListCOI.SelectedValue);

            if (uiFileUploadRecentPhoto.HasFile)
            {
                string path = "/files/" + DateTime.Now.ToString("ddMMyyyyhhmmss_") + uiFileUploadRecentPhoto.FileName;
                uiFileUploadRecentPhoto.SaveAs(Server.MapPath("~" + path));
                application.RecentPhotoPath = path;
            }

            application.FatherFamilyName = uiTextBoxFaFamilyName.Text;
            application.FatherFirstName = uiTextBoxFaFirstName.Text;
            application.FatherOccupation = uiTextBoxFaOccupation.Text;
            application.FatherHomePhone = uiTextBoxFaHomePhone.Text;
            application.FatherBusinessPhone = uiTextBoxFaBusPhone.Text;
            application.FatherCellPhone = uiTextBoxFaMobile.Text;
            application.MotherFamilyName = uiTextBoxMoFamilyName.Text;
            application.MotherFirstName = uiTextBoxMoFirstName.Text;
            application.MotherOccupation = uiTextBoxMoOccupation.Text;

            application.StreetAddress = uiTextBoxStreetAddress.Text;
            application.CountryID = Convert.ToInt32(uiDropDownListAddressCountry.SelectedValue);
            application.City = uiTextBoxCity.Text;
            application.TelephoneNumber = uiTextBoxAddTele.Text;
            application.FaxNumber = uiTextBoxAddFax.Text;
            application.Email = uiTextBoxEmail.Text;
            application.CellPhone = uiTextBoxCellphone.Text;

            application.ResidentAddress = uiTextBoxResAddress.Text;

            application.MasterDegree = uiTextBoxMDS.Text;
            application.University = uiTextBoxMDUniversity.Text;
            DateTime mdDate;
            DateTime.TryParseExact(uiTextBoxMDDate.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out mdDate);
            if (mdDate != DateTime.MinValue)
                application.DateOfGraduation = mdDate;


            application.BachelorDegree = uiTextBoxBach.Text;
            application.BachelorUniversity = uiTextBoxBachUni.Text;
            DateTime baDate;
            DateTime.TryParseExact(uiTextBoxBachDate.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out baDate);
            if (baDate != DateTime.MinValue)
                application.BachelorGraduationDate = baDate;

            application.HighScool = uiTextBoxHighSchool.Text;
            application.HighSchoolCollege = uiTextBoxHighCollege.Text;
            DateTime hDate;
            DateTime.TryParseExact(uiTextBoxHighDate.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out hDate);
            if (hDate != DateTime.MinValue)
                application.HighSchoolGradDate = hDate;


            application.DegreeSpecialization = uiTextBoxDS.Text;
            application.KindOfDegree = uiTextBoxKOD.Text;
            application.College = uiTextBoxCS.Text;
            DateTime dsDate;
            DateTime.TryParseExact(uiTextBoxDDOG.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out dsDate);
            if (dsDate != DateTime.MinValue)
                application.DegreeDateOfGraduation = dsDate;

            application.EnglishSpeak = Convert.ToInt16(uiHiddenFieldEnglishSpoken.Value);
            application.EnglishWritten = Convert.ToInt16(uiHiddenFieldEnglishWritten.Value);
            application.FrenchSpeak = Convert.ToInt16(uiHiddenFieldFrenchSpoken.Value);
            application.EnglishSpeak = Convert.ToInt16(uiHiddenFieldFrenchWritten.Value);
            application.StudentID = student.StudentID;
            application.SelectedCourseID = Convert.ToInt32(uiDropDownListCourses.SelectedValue);
            application.IsSubmit = true;
            application.Save();


           
        }
    }
}