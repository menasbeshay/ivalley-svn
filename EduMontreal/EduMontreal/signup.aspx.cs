using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;
namespace EduMontreal
{
    public partial class signup : System.Web.UI.Page
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindControls();
                Master.PageTitle = "Sign up";
                

            }
        }

        

        protected void uiLinkButtonSignUp_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                if (uiDropDownListCountry.SelectedIndex != 0)
                {
                    uiLabelCountryError.Visible = false;
                    uiLabelUserExist.Visible = false;
                    Student student = new Student();
                    student.GetStudentByEmail(uiTextBoxEmail.Text);
                    if (student.RowCount > 0)
                    {
                        uiLabelUserExist.Visible = true;
                        return;
                    }
                    student.AddNew();
                    student.FamilyName = uiTextBoxFamilyName.Text;
                    student.FirstName = uiTextBoxFirstName.Text;
                    student.MiddleName = uiTextBoxMiddleName.Text;
                    student.DateOfBirth = DateTime.ParseExact(uiTextBoxDOB.Text, "dd/MM/yyyy", null);
                    student.CityofBirth = uiTextBoxPOB.Text;
                    student.CitizenShipID = Convert.ToInt32(uiDropDownListCountry.SelectedValue);
                    student.CellPhoneNumber = uiTextBoxMobile.Text;
                    student.Email = uiTextBoxEmail.Text;
                    student.UserPassword = uiTextBoxPassword.Text;
                    student.ActivationCode = Guid.NewGuid();
                    student.IsActive = false;
                    student.Save();

                    EmailTemplates template = new EmailTemplates();
                    template.GetTemplateByStatusID(1); // activation required
                    try
                    {
                        MailMessage msg = new MailMessage();
                        string mail = ConfigurationManager.AppSettings["ActivationEMail"];
                        string mailto = student.Email;
                        msg.To.Add(mailto);
                        msg.From = new MailAddress(mail);
                        msg.Subject = template.Subject;
                        msg.IsBodyHtml = true;
                        msg.BodyEncoding = System.Text.Encoding.Unicode;

                        msg.Body = string.Format(Server.HtmlDecode(template.Body), ConfigurationManager.AppSettings["ActivationURL"] + student.ActivationCode.ToString());

                        SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);

                        client.UseDefaultCredentials = false;

                        client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["ActivationMailpass"]);
                        client.Send(msg);
                        Response.Redirect("activate");
                    }
                    catch (Exception)
                    {

                    }

                }
                else
                {
                    uiLabelCountryError.Visible = true;
                }

            }
            else
            {
                uiLabelCaptcha.Visible = true;
            }
        }
        #endregion


        #region Methods
        private void BindControls()
        {
            Country countries = new Country ();
            countries.LoadAll();
            uiDropDownListCountry.DataSource = countries.DefaultView;
            uiDropDownListCountry.DataTextField = Country.ColumnNames.CountryName;
            uiDropDownListCountry.DataValueField = Country.ColumnNames.CountryID;
            uiDropDownListCountry.DataBind();
            uiDropDownListCountry.Items.Insert(0, new ListItem("Select country", "0"));

            Gender gender = new Gender ();
            gender.LoadAll();
            uiRadioButtonListGender.DataSource = gender.DefaultView;
            uiRadioButtonListGender.DataTextField = Gender.ColumnNames.GenderType;
            uiRadioButtonListGender.DataValueField = Gender.ColumnNames.GenderID;
            uiRadioButtonListGender.DataBind();
            uiRadioButtonListGender.SelectedIndex = 0;

        }
        #endregion
    }
}