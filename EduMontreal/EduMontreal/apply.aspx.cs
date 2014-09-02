using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;
namespace EduMontreal
{
    public partial class apply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("userlogin");
                }
                else
                {
                    Student student = (Student)Session["CurrentUser"];
                    if (!student.IsActive)
                    {
                        Response.Redirect("activate");
                    }
                    LoadDDls();
                }
                Master.PageTitle = "Fill an Application";
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
                if(errortab == -1 || errortab > 2) 
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

            Student student = (Student)Session["CurrentUser"];

            ApplicationData application = new ApplicationData();
            application.AddNew();

            application.FamilyName = uiTextBoxFamilyName.Text;
            application.FirstName = uiTextBoxFirstName.Text;
            application.MiddleName = uiTextBoxMiddleName.Text;
            application.DateOfBirth = DateTime.ParseExact(uiTextBoxDOB.Text, "dd/MM/yyyy", null);
            application.CountryOfBirthID = Convert.ToInt32(uiDropDownListPOB.SelectedValue);
            application.Hieght = double.Parse(uiTextBoxHeight.Text);
            application.Weight = double.Parse(uiTextBoxWeight.Text);
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
            application.FatherBusinessPhone= uiTextBoxFaBusPhone.Text;
            application.FatherCellPhone= uiTextBoxFaMobile.Text;
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
            DateTime.TryParseExact(uiTextBoxMDDate.Text, "dd/MM/yyyy",null,System.Globalization.DateTimeStyles.None, out mdDate);
            if(mdDate != DateTime.MinValue)
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
            application.Save();


            if (Session["CurrentUploadedFiles"] != null)
            {
                Hashtable Files;
                Files = (Hashtable)Session["CurrentUploadedFiles"];

                if (Files.Count > 0)
                {
                    ApplicationAttachment attachments = new ApplicationAttachment();
                    foreach (DictionaryEntry item in Files)
                    {
                        attachments.AddNew();
                        attachments.ApplicationDataID = application.ApplicationDataID;
                        attachments.ApplicationStatusID = 3;  // Payment of International Student Filing Fees
                        attachments.FilePath = item.Value.ToString();
                    }
                    attachments.Save();
                    Session["CurrentUploadedFiles"] = null;
                }

            }

            ApplicationStatusHistory history = new ApplicationStatusHistory();
            history.AddNew();
            history.StudentID = student.StudentID;
            history.ApplicationDataID = application.ApplicationDataID;
            history.StatusDate = DateTime.Now;

            // Payment of International Student Filing Fees
            history.ApplicationStatusID = 3; 
            history.Save();

            Response.Redirect("apppayment");

            
        }

        protected void uiDropDownListLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {            

            Course courses = new Course();
            courses.GetCourseByLanguageID(Convert.ToInt32(uiDropDownListLanguage.SelectedValue));
            if(courses.RowCount > 0)
                uiDropDownListCourses.DataSource = courses.DefaultView;
            else
                uiDropDownListCourses.DataSource = null;
            uiDropDownListCourses.DataTextField = "DisplayName";
            uiDropDownListCourses.DataValueField = Course.ColumnNames.CourseID;
            uiDropDownListCourses.DataBind();
        }
    }
}