using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MHO.BLL;
using Microsoft.Reporting.WebForms;

public partial class Admin_Reports : System.Web.UI.Page
{
    #region properties

    public string pageRole
    {
        get
        {
            if (string.IsNullOrEmpty(Request.QueryString["pageRole"]))
            {
                return "";
            }
            else
            {
                return Request.QueryString["pageRole"].ToString();
            }
        }
    }

    #endregion

    #region Events

    protected void Page_PreInit(Object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (User.IsInRole("SuperAdmin"))
            {
                this.MasterPageFile = "~/MasterPages/Admin.master";
            }
            else if (User.IsInRole("Admin"))
            {
                this.MasterPageFile = "~/MasterPages/AdminGov.master";
            }
            else if (User.IsInRole("SubAdmin"))
            {
                this.MasterPageFile = "~/MasterPages/SubAdmin.master";
            }
            else
            {
                this.MasterPageFile = "~/MasterPages/MasterPage.master";
            }

            //if (pageRole != "" && pageRole == "HealthOffice")
            //{
            //    this.MasterPageFile = "~/MasterPages/MasterPage.master";
            //}
            //else if (pageRole == "SuperVisor")
            //{
            //    this.MasterPageFile = "~/MasterPages/SubAdmin.master";
            //}
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(pageRole) || pageRole == "SuperVisor")
        {
            if (!Page.IsPostBack)
            {
                // if the user was admin or supervisor
                LoadGoves();
                GetLogicValidation();
            }
        }
        lblYear.BackColor = System.Drawing.Color.FromName("#efefef");
        lblHealthOffice.BackColor = System.Drawing.Color.FromName("#efefef");
        lblGoves.BackColor = System.Drawing.Color.FromName("#efefef");
        lblCivilOffice.BackColor = System.Drawing.Color.FromName("#efefef");
        lblFrom.BackColor = System.Drawing.Color.FromName("#efefef");
        lblTo.BackColor = System.Drawing.Color.FromName("#efefef");
        lblError.Text = "";

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (pageRole != "")
        {
            drpReports.Items.Remove(drpReports.Items.FindByValue("18"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("19"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("20"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("21"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("22"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("23"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("24"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("25"));
        }
        if ( pageRole == "HealthOffice")
        {
            // if the user was from health office
            LoadGoves();
            GetLogicValidation();
            drpReports.Items.Remove(drpReports.Items.FindByValue("11"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("12"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("15"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("16"));
            drpReports.Items.Remove(drpReports.Items.FindByValue("9"));

            
        }
       
      
        
    }
    protected void drpGov_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DropDownList dropGov = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("drpGov");
        LoadCivilByGov();
        LoadHealthOfficeByCivil();
    }
    protected void drpCivil_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DropDownList drpCivil = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("drpCivil");
        LoadHealthOfficeByCivil();
    }
    protected void btnReportShow_Click(object sender, EventArgs e)
    {
        if (txtReportYear.Text != "")
        {
            if (int.Parse(txtReportYear.Text) > int.Parse(DateTime.Now.Year.ToString()))
            {
                lblError.Text = "عام التقرير يجب ان لا يكون اكبر من العام الحالى";
                return;
            }
        }
        if (LogicValidation())
        {
            Hashtable htParameters = new Hashtable();

            int reportFlage = int.Parse(drpReports.SelectedValue);

            int govId = -1;
            if (drpGov.SelectedValue != "-1")
                govId = int.Parse(drpGov.SelectedValue);

            int civilId = -1;
            if (drpCivil.SelectedValue != "-1")
                civilId = int.Parse(drpCivil.SelectedValue);

            int healthOfficeID = -1;
            if (drpHealthOffice.SelectedValue != "-1")
                healthOfficeID = int.Parse(drpHealthOffice.SelectedValue);

            DateTime startDate = DateTime.Now;
            if (txtStartDate.Text != "")
                startDate = DateTime.Parse(txtStartDate.Text.Trim());

            DateTime endDate = DateTime.Now;
            if (txtEndDate.Text != "")
                endDate = DateTime.Parse(txtEndDate.Text.Trim());

            int reportYear = DateTime.Now.Year;
            if (txtReportYear.Text != "")
                reportYear = int.Parse(txtReportYear.Text.Trim());

            switch (reportFlage)
            {
                case 1://تقرير المواليد موزعة حسب شهور السنة                 
                    if (txtReportYear.Text != string.Empty)
                    {
                        htParameters.Add("BirthDate", reportYear);
                        if (govId != -1 && civilId == -1)
                        {
                            htParameters.Add("GovId", govId);
                            htParameters.Add("GovDescrAr", drpGov.SelectedItem.Text);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_BornStat", htParameters));
                        }
                        else if (civilId != -1 && healthOfficeID == -1)
                        {
                            htParameters.Add("CivilId", civilId);
                            htParameters.Add("GovDescrAr", drpGov.SelectedItem.Text);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);

                            Response.Redirect(RSUtility.GenerateURL("Rpt_BornStatOffice", htParameters));
                        }
                        else if (civilId != -1 && healthOfficeID != -1)
                        {
                            htParameters.Add("CivilId", civilId);
                            htParameters.Add("GovDescrAr", drpGov.SelectedItem.Text);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);

                            htParameters.Add("HealthID", healthOfficeID);
                            htParameters.Add("HealthDescrAr", drpHealthOffice.SelectedItem.Text);

                            Response.Redirect(RSUtility.GenerateURL("Rpt_BornStatOffice_Health", htParameters));
                        }
                        else if (govId == -1 && civilId == -1)
                        {
                            Response.Redirect(RSUtility.GenerateURL("Rpt_BornStatGovs", htParameters));
                        }
                        lblError.Text = string.Empty;
                        
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtReportYear.Text == string.Empty)
                        {
                            lblYear.BackColor = System.Drawing.Color.Red;
                            message += "التاريخ / العام";
                        }
                        lblError.Text = message;
                    }

                    break;

                case 2://تقرير الوفيات موزعة حسب شهور السنة
                    if (txtReportYear.Text != string.Empty)
                    {
                        htParameters.Add("DieDate", reportYear);
                        if (govId != -1 && civilId == -1)
                        {
                            htParameters.Add("GovId", govId);
                            htParameters.Add("GovDescrAr", drpGov.SelectedItem.Text);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadStat", htParameters));
                        }
                        else if (civilId != -1)
                        {
                            htParameters.Add("CivilID", civilId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);

                            htParameters.Add("OfficeID", healthOfficeID);

                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadStatOffices", htParameters));
                        }
                        else if (govId == -1 && civilId == -1)
                        {
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadStatGovs", htParameters));
                        }
                        lblError.Text = string.Empty;

                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtReportYear.Text == string.Empty)
                        {
                            lblYear.BackColor = System.Drawing.Color.Red;
                            message += "التاريخ / العام";
                        }
                        lblError.Text = message;
                    }

                    break;

                case 3://تقرير الوفيات حسب السن والنوع خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);

                        if (govId != -1 && civilId == -1)
                        {
                            htParameters.Add("GovId", govId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadStatRange", htParameters));
                        }
                        else if (civilId != -1)
                        {
                            htParameters.Add("CivilId", civilId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);

                            htParameters.Add("OfficeID", healthOfficeID);

                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadStatRangeOffices", htParameters));
                        }
                        else if (govId == -1 && civilId == -1)
                        {
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadStatRangeGovs", htParameters));
                        }
                        lblError.Text = string.Empty;

                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }

                    break;

                case 4://تقرير الوفيات حسب السن والنوع طبقا للأورام خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);

                        if (govId != -1 && civilId == -1)
                        {
                            htParameters.Add("GovId", govId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseHumer", htParameters));
                        }
                        else if (civilId != -1 && healthOfficeID == -1)
                        {
                            htParameters.Add("CivilID", civilId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseHumerOffices", htParameters));
                        }
                        else if (civilId != -1 && healthOfficeID != -1)
                        {
                            htParameters.Add("CivilID", civilId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);
                            htParameters.Add("HealthID", healthOfficeID);

                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseHumerOffices_Hlth", htParameters));
                        }
                        else if (govId == -1 & civilId == -1)
                        {
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseHumerGovs", htParameters));
                        }
                        lblError.Text = string.Empty;

                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }

                    break;

                case 5://تقرير الوفيات حسب السن والنوع طبقا للتدخين خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                        if (govId != -1 & civilId == -1)
                        {
                            htParameters.Add("GovId", govId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseSmoker", htParameters));
                        }
                        else if (civilId != -1)
                        {
                            htParameters.Add("CivilID", civilId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);
                            htParameters.Add("HealthID", healthOfficeID);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseSmokerOffices", htParameters));
                                                                     
                        }
                        else if (govId == -1 & civilId == -1)
                        {
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseSmokerGovs", htParameters));
                        }
                        lblError.Text = string.Empty;

                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }

                    break;
                case 6://تقرير الوفيات حسب السن والنوع طبقا للحوادث خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);

                        if (govId != -1 & civilId == -1)
                        {
                            htParameters.Add("GovId", govId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseAccedent", htParameters));
                        }
                        else if (civilId != -1)
                        {
                            htParameters.Add("CivilID", civilId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);
                            htParameters.Add("HealthID", healthOfficeID);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseAccedentOffices", htParameters));
                        }
                        else if (govId == -1 & civilId == -1)
                        {
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadCaseAccedentGovs", htParameters));
                        }
                        lblError.Text = string.Empty;

                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;

                case 7://تقرير بعدد المواليد لأب مصري وغير مصري خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Year + "-" + startDate.Month.ToString().PadLeft(2, '0') + "-" + startDate.Day.ToString().PadLeft(2, '0') );
                        htParameters.Add("EndDate", endDate.Year + "-" + endDate.Month.ToString().PadLeft(2, '0') + "-" + endDate.Day.ToString().PadLeft(2, '0') );

                        if (govId != -1 && civilId == -1)
                        {
                            htParameters.Add("GovId", govId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_BornFatherNationality", htParameters));
                        }
                        else if (govId != -1 && civilId != -1)
                        {
                            htParameters.Add("CivilId", civilId);
                            htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);
                            htParameters.Add("HealthID", healthOfficeID);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_BornFatherNationalityOffices", htParameters));
                        }
                        else if (govId == -1 && civilId == -1)
                        {
                            Response.Redirect(RSUtility.GenerateURL("Rpt_BornFatherNationalityGov", htParameters));
                        }
                        lblError.Text = string.Empty;

                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }

                    break;
                case 8://تقرير بعدد المواليد ذكور و إناث خلال فترة

                    if (/*(govId != -1 || civilId != -1 || healthOfficeID != -1) &&*/ txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        if (govId != -1)
                        {
                            htParameters.Add("GovId", govId);
                        }
                        if (civilId != -1)
                        {
                            htParameters.Add("CivilId", civilId);
                        }
                        if (healthOfficeID != -1)
                        {
                            htParameters.Add("HealthId", healthOfficeID);
                            //htParameters.Add("HealthDesc", drpHealthOffice.SelectedItem.Text);
                        }
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);

                        lblError.Text = string.Empty;
                        Response.Redirect(RSUtility.GenerateURL("Rpt_BornDecisionNo", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                       /* if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (civilId == -1)
                        {
                            lblCivilOffice.BackColor = System.Drawing.Color.Red;
                            message += "الادارة الصحية" + "<br>";
                        }
                        if (healthOfficeID == -1)
                        {
                            lblHealthOffice.BackColor = System.Drawing.Color.Red;
                            message += "مكتب الصحة" + "<br>";
                        }*/
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }

                    break;

                case 9://تقرير المواليد من داخل وخارج دائرة مكتب الصحة خلال فترة

                    if (govId != -1 && civilId != -1 && healthOfficeID != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        if (govId != -1)
                        {
                            htParameters.Add("GovId", govId);
                        }
                        if (healthOfficeID != -1)
                        {
                            htParameters.Add("HealthId", healthOfficeID);
                            htParameters.Add("HealthDesc", drpHealthOffice.SelectedItem.Text);

                        }
                        if (civilId != -1)
                        {
                            htParameters.Add("CivilId", civilId);
                        }


                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);

                        lblError.Text = string.Empty;
                        Response.Redirect(RSUtility.GenerateURL("Rpt_BornGovernorate", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (civilId == -1)
                        {
                            lblCivilOffice.BackColor = System.Drawing.Color.Red;
                            message += "الادارة الصحية" + "<br>";
                        }
                        if (healthOfficeID == -1)
                        {
                            lblHealthOffice.BackColor = System.Drawing.Color.Red;
                            message += "مكتب الصحة" + "<br>";
                        }
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }

                    break;

                case 10://وفيات أقل من 7 أيام وحديثي الولادة والأطفال
                    if (txtReportYear.Text != string.Empty)
                    {
                        htParameters.Add("BirthDate", reportYear);
                        if (govId != -1 && civilId == -1)
                        {
                            htParameters.Add("GovId", govId);
                            htParameters.Add("GovDescrAr", drpGov.SelectedItem.Text);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadLessThan7Dayes", htParameters));
                        }
                        else if (govId != -1 && civilId != -1)
                        {
                            htParameters.Add("CivilId", civilId);
                            htParameters.Add("GovId", govId);
                            htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);
                            htParameters.Add("HealthID", healthOfficeID);
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadLessThan7DayesOffices", htParameters));
                        }
                        else if (govId == -1 & civilId == -1)
                        {
                            Response.Redirect(RSUtility.GenerateURL("Rpt_DeadLessThan7DayesGovs", htParameters));
                        }
                        lblError.Text = string.Empty;

                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtReportYear.Text == string.Empty)
                        {
                            lblYear.BackColor = System.Drawing.Color.Red;
                            message += "التاريخ / العام";
                        }
                        lblError.Text = message;
                    }

                    break;

                case 11://احصائية ادخال المواليد بمديرية خلال فترة
                    if (govId != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("GovId", govId);
                        htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                        Response.Redirect(RSUtility.GenerateURL("Rpt_BornApprovedNotApprovedGov", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;
                case 12://احصائية ادخال المواليد بادارة صحية خلال فترة
                    if (govId != -1 && civilId != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                        htParameters.Add("CivilId", civilId.ToString());
                        htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                        Response.Redirect(RSUtility.GenerateURL("Rpt_BornAppCIVIL", htParameters));
                    }
                    //if (govId != -1 && civilId != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    //{
                    //    htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                    //    htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                    //    htParameters.Add("CivilId", civilId.ToString());
                    //    htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                    //    if (healthOfficeID == -1)
                    //    {
                    //        Response.Redirect(RSUtility.GenerateURL("Rpt_BornAppCIVIL", htParameters));
                    //    }
                    //    else
                    //    {
                    //        htParameters.Add("HealthId", healthOfficeID);
                    //        Response.Redirect(RSUtility.GenerateURL("Rpt_BornAppCIVIL_hlth", htParameters));
                    //    }
                        
                    //}
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (civilId == -1)
                        {
                            lblCivilOffice.BackColor = System.Drawing.Color.Red;
                            message += "الادارة الصحية" + "<br>";
                        }
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;
                case 13://احصائية ادخال المواليد بمكتب صحة خلال فترة (الاسبوعية)
                    if (govId != -1 && civilId != -1 && healthOfficeID != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                        htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                        htParameters.Add("HealthDescr", drpHealthOffice.SelectedItem.Text);
                        htParameters.Add("HealthOfficeID", healthOfficeID.ToString());
                        htParameters.Add("CivilDescr", drpCivil.SelectedItem.Text);
                        Response.Redirect(RSUtility.GenerateURL("Rpt_BornAppOffices", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (civilId == -1)
                        {
                            lblCivilOffice.BackColor = System.Drawing.Color.Red;
                            message += "الادارة الصحية" + "<br>";
                        }
                        if (healthOfficeID == -1)
                        {
                            lblHealthOffice.BackColor = System.Drawing.Color.Red;
                            message += "مكتب الصحة" + "<br>";
                        }
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;
                case 14://توزيع الوفيات حسب سبب الوفاة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        if (govId != -1)
                            htParameters.Add("GovId", govId);
                        if (civilId != -1)
                            htParameters.Add("CivilID", civilId);
                        if (healthOfficeID != -1)
                            htParameters.Add("HealthOfficeID", healthOfficeID);

                        htParameters.Add("GoveName", drpGov.SelectedItem.Text.Trim());
                        htParameters.Add("CivilName", drpCivil.SelectedItem.Text.Trim());
                        htParameters.Add("OfficeName", drpHealthOffice.SelectedItem.Text.Trim());

                        htParameters.Add("DeadGender", drpDeadType.SelectedValue);
                        htParameters.Add("causeOfDeathNo", radioLstDeathCause.SelectedValue);
                        htParameters.Add("DeadType", drpDeadType.SelectedItem.Text.Trim());

                        htParameters.Add("CauseOfDeathValue", radioLstDeathCause.SelectedItem.Text.Trim());
                        htParameters.Add("fromDate",startDate.Year + "/" +  startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') );
                        htParameters.Add("ToDate", endDate.Year + "/" + endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0'));

                        Response.Redirect(RSUtility.GenerateURL("Rpt_DeadDeathCause", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;
                case 15://احصائية ادخال الوفيات بمديرية خلال فترة
                    if (govId != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("GovId", govId);
                        htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                        Response.Redirect(RSUtility.GenerateURL("Rpt_DeadApprovedNotApprovedGov", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;
                case 16://احصائية ادخال الوفيات بادارة صحية خلال فترة
                    if (govId != -1 && civilId != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                        htParameters.Add("CivilId", civilId.ToString());
                        htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                        Response.Redirect(RSUtility.GenerateURL("Rpt_DeadAppCIVIL", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (civilId == -1)
                        {
                            lblCivilOffice.BackColor = System.Drawing.Color.Red;
                            message += "الادارة الصحية" + "<br>";
                        }
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;
                case 17://احصائية ادخال الوفيات بمكتب صحة خلال فترة (الاسبوعية)
                    if (govId != -1 && civilId != -1 && healthOfficeID != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                        htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                        htParameters.Add("HealthDescr", drpHealthOffice.SelectedItem.Text);
                        htParameters.Add("HealthOfficeID", healthOfficeID.ToString());
                        htParameters.Add("CivilDescr", drpHealthOffice.SelectedItem.Text);
                        Response.Redirect(RSUtility.GenerateURL("Rpt_DeadAppOffices", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (civilId == -1)
                        {
                            lblCivilOffice.BackColor = System.Drawing.Color.Red;
                            message += "الادارة الصحية" + "<br>";
                        }
                        if (healthOfficeID == -1)
                        {
                            lblHealthOffice.BackColor = System.Drawing.Color.Red;
                            message += "مكتب الصحة" + "<br>";
                        }
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;
                case 18://إحصائية إدخال المواليد بجميع المديريات خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {

                        Response.Redirect("~/HealthReports/Rpt_ListBornAprrovedCount.aspx?startdate=" + startDate.ToShortDateString() + "&enddate=" + endDate.ToShortDateString());
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;

                    }
                    break;
                case 19://بيانات الوفيات خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {

                        Response.Redirect("~/HealthReports/Rpt_ListDeadAprrovedCount.aspx?startdate=" + startDate.ToShortDateString() + "&enddate=" + endDate.ToShortDateString() + "&GovID=" + govId.ToString() + "&CivilID=" + civilId.ToString() + "&HealthOfficeID="  + healthOfficeID.ToString());
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;

                    }
                    break;
                case 20://بيان بعدد المواليد ذكور و إناث بجميع المديريات خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {

                        Response.Redirect("~/HealthReports/Rpt_ListBornMailFemaleLostCount.aspx?startdate=" + startDate.ToShortDateString() + "&enddate=" + endDate.ToShortDateString());
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;

                    }
                    break;
                case 21://بيان بعدد المواليد الموزعة حضر و ريف بجميع المديريات خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {

                        Response.Redirect("~/HealthReports/Rpt_ListBornCityVillage.aspx?startdate=" + startDate.ToShortDateString() + "&enddate=" + endDate.ToShortDateString());
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;

                    }
                    break;
                case 22://بيان بعدد المواليد موتى بجميع المديريات خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {

                        Response.Redirect("~/HealthReports/Rpt_ListBornDead.aspx?startdate=" + startDate.ToShortDateString() + "&enddate=" + endDate.ToShortDateString());
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;

                    }
                    break;
                case 23://توزيع الوفيات حسب السن والنوع  خلال فترة
                    if (txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {

                        Response.Redirect("~/HealthReports/Rpt_ListDeadStatistcs.aspx?startdate=" + startDate.ToShortDateString() + "&enddate=" + endDate.ToShortDateString());
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;

                    }
                    break;
                case 24://سجلات اخطار المواليد
                    if (govId != -1 && civilId != -1 && healthOfficeID != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                        htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                        htParameters.Add("HealthDescr", drpHealthOffice.SelectedItem.Text);
                        htParameters.Add("HealthOfficeID", healthOfficeID.ToString());
                        htParameters.Add("CivilDescr", drpHealthOffice.SelectedItem.Text);
                        Response.Redirect(RSUtility.GenerateURL("Rpt_AliveBorns", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (civilId == -1)
                        {
                            lblCivilOffice.BackColor = System.Drawing.Color.Red;
                            message += "الادارة الصحية" + "<br>";
                        }
                        if (healthOfficeID == -1)
                        {
                            lblHealthOffice.BackColor = System.Drawing.Color.Red;
                            message += "مكتب الصحة" + "<br>";
                        }
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;
                case 25://سجلات اخطار الوفيات
                    if (govId != -1 && civilId != -1 && healthOfficeID != -1 && txtStartDate.Text != string.Empty && txtEndDate.Text != string.Empty)
                    {
                        htParameters.Add("StartDate", startDate.Month.ToString().PadLeft(2, '0') + "/" + startDate.Day.ToString().PadLeft(2, '0') + "/" + startDate.Year);
                        htParameters.Add("EndDate", endDate.Month.ToString().PadLeft(2, '0') + "/" + endDate.Day.ToString().PadLeft(2, '0') + "/" + endDate.Year);
                        htParameters.Add("GovDescr", drpGov.SelectedItem.Text);
                        htParameters.Add("HealthDescr", drpHealthOffice.SelectedItem.Text);
                        htParameters.Add("HealthOfficeID", healthOfficeID.ToString());
                        htParameters.Add("CivilDescr", drpHealthOffice.SelectedItem.Text);
                        Response.Redirect(RSUtility.GenerateURL("Rpt_ListOfDead", htParameters));
                    }
                    else
                    {
                        string message = "يجب ادخال " + "<br>";
                        if (govId == -1)
                        {
                            lblGoves.BackColor = System.Drawing.Color.Red;
                            message += "المديرية الصحية" + "<br>";
                        }
                        if (civilId == -1)
                        {
                            lblCivilOffice.BackColor = System.Drawing.Color.Red;
                            message += "الادارة الصحية" + "<br>";
                        }
                        if (healthOfficeID == -1)
                        {
                            lblHealthOffice.BackColor = System.Drawing.Color.Red;
                            message += "مكتب الصحة" + "<br>";
                        }
                        if (txtStartDate.Text == string.Empty)
                        {
                            lblFrom.BackColor = System.Drawing.Color.Red;
                            message += "الفترة من" + "<br>";
                        }
                        if (txtEndDate.Text == string.Empty)
                        {
                            lblTo.BackColor = System.Drawing.Color.Red;
                            message += "الفترة الى" + "<br>";
                        }
                        lblError.Text = message;
                    }
                    break;
            }

        }
    }
    protected void drpReports_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpReports.SelectedValue == "1" || drpReports.SelectedValue == "2" ||
            drpReports.SelectedValue == "10" )
        {
            guiYearArea.Attributes.Add("style", "display:block");
            guiFromArea.Attributes.Add("style", "display:none");
            guiToArea.Attributes.Add("style", "display:none");
        }
        else
        {
            guiYearArea.Attributes.Add("style", "display:none");
            guiFromArea.Attributes.Add("style", "display:block");
            guiToArea.Attributes.Add("style", "display:block");

            if ((drpReports.SelectedValue == "17" || drpReports.SelectedValue == "13"))
            {
                txtEndDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
                txtStartDate.Text = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
            }
            else
            {
                txtEndDate.Text = "";
                txtStartDate.Text = "";
            }
        }

        if (drpReports.SelectedValue == "14")
        {
            tblCauseOfDeathArea.Attributes.Add("style", "display:block");
        }
        else
        {
            tblCauseOfDeathArea.Attributes.Add("style", "display:none");
        }
    }

    #endregion

    #region Methods

    private void LoadGoves()
    {

        GOVERNORATE gov = new GOVERNORATE();
        gov.LoadAll();
        drpGov.DataSource = gov.DefaultView;
        drpGov.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        drpGov.DataValueField = GOVERNORATE.ColumnNames.CD;
        drpGov.DataSource = gov.DefaultView;
        drpGov.DataBind();
        drpGov.Items.Insert(0, new ListItem("جميع مديرية", "-1"));
        drpGov.SelectedIndex = 0;
    }
    private void LoadCivilByGov()
    {

        CIVIL_OFFICE civil = new CIVIL_OFFICE();
        civil.Where.FK_GOVCD.Value = drpGov.SelectedValue;
        civil.Query.Load();
        drpCivil.DataTextField = CIVIL_OFFICE.ColumnNames.DESCR;
        drpCivil.DataValueField = CIVIL_OFFICE.ColumnNames.CD;
        drpCivil.DataSource = civil.DefaultView;
        drpCivil.DataBind();
        drpCivil.Items.Insert(0, new ListItem("جميع الادارات", "-1"));
    }
    private bool LogicValidation()
    {
        if (!string.IsNullOrEmpty(txtStartDate.Text) && !string.IsNullOrEmpty(txtEndDate.Text))
        {
            DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime endDate = Convert.ToDateTime(txtEndDate.Text);
            if (DateTime.Compare(endDate, startDate) < 0)
            {
                MHOCommon.ShowMessage("الفترة من يجب ان تكون اقل من او تساوى الفترة الى", this.Page);
                return false;
            }
        }
        return true;
    }
    private void LoadHealthOfficeByCivil()
    {

        health_office healthOffice = new health_office();
        healthOffice.Where.CIVILCD.Value = drpCivil.SelectedValue;
        healthOffice.Query.Load();
        drpHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
        drpHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
        drpHealthOffice.DataSource = healthOffice.DefaultView;
        drpHealthOffice.DataBind();
        drpHealthOffice.Items.Insert(0, new ListItem("جميع المكاتب", "-1"));
    }
    private void GetLogicValidation()
    {
        health_office hoObject = new health_office();
        DataTable dtHodetails = hoObject.GetDefaultHealthOfficeData(MHOCommon.CurrentOrgIP);
        if (dtHodetails.Rows.Count > 0)
        {
            
            
            if (dtHodetails.Rows[0]["LocationTypeID"].ToString() == "4")
            {
                drpGov.SelectedIndex = drpGov.Items.IndexOf(drpGov.Items.FindByText(dtHodetails.Rows[0]["GoveName"].ToString()));
                drpGov_SelectedIndexChanged(null,null);
                drpCivil.SelectedIndex = drpCivil.Items.IndexOf( drpCivil.Items.FindByText(dtHodetails.Rows[0]["CivilName"].ToString()));
                drpCivil_SelectedIndexChanged(null,null);
                drpHealthOffice.SelectedIndex = drpHealthOffice.Items.IndexOf(drpHealthOffice.Items.FindByText(dtHodetails.Rows[0]["HEALTHDESCR"].ToString()));
                drpGov.Enabled = false;
                drpCivil.Enabled = false;
                drpHealthOffice.Enabled = false;
            }
            else if (dtHodetails.Rows[0]["LocationTypeID"].ToString() == "3")
            {
                drpGov.SelectedIndex = drpGov.Items.IndexOf(drpGov.Items.FindByText(dtHodetails.Rows[0]["GoveName"].ToString()));
                drpGov_SelectedIndexChanged(null,null);
                drpCivil.SelectedIndex = drpCivil.Items.IndexOf( drpCivil.Items.FindByText(dtHodetails.Rows[0]["CivilName"].ToString()));
                drpCivil_SelectedIndexChanged(null,null);
                drpGov.Enabled = false;
                drpCivil.Enabled = false;
                
            }
            else if (dtHodetails.Rows[0]["LocationTypeID"].ToString() == "2")
            {
                drpGov.SelectedIndex = drpGov.Items.IndexOf(drpGov.Items.FindByText(dtHodetails.Rows[0]["GoveName"].ToString()));
                drpGov_SelectedIndexChanged(null,null);
                drpCivil.SelectedIndex = drpCivil.Items.IndexOf( drpCivil.Items.FindByText(dtHodetails.Rows[0]["CivilName"].ToString()));
                drpCivil_SelectedIndexChanged(null,null);
                drpGov.Enabled = false;
               
               
            }
            else if (dtHodetails.Rows[0]["LocationTypeID"].ToString() == "1")
            {
             // TO DO
            }
            
        }
        
    }
    private void loadGoveAndCivil()
    {
        LoadCivilByGov();
        LoadHealthOfficeByCivil();
    }
    
    #endregion

}
