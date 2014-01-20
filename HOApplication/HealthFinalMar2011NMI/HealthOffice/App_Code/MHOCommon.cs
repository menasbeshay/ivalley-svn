using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;
using System.Security.Cryptography.X509Certificates;
using MHO.BLL;
using Policy;

using NMIWebServiceRef;
using Microsoft.Web.Services3;
using Microsoft.Web.Services3.Design;
using Microsoft.Web.Services3.Security.Tokens;
using System.ServiceModel;
using Gma.QrCodeNet.Encoding.Windows.Render;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using Gma.QrCodeNet.Encoding;
using System.Text;
using System.Data.SqlClient;



/// <summary>
/// Summary description for MHOCommon
/// </summary>
[Serializable]
public class MHOCommon
{
    #region Properties

    /// <summary>
    /// store the current logged in User.
    /// </summary>
    public static Guid CurrentLoggedUserID
    {
        get
        {
            return new Guid(Membership.GetUser(HttpContext.Current.User.Identity.Name).ProviderUserKey.ToString());
        }
    }

    /// <summary>
    /// store the current logged in Organization.
    /// </summary>
    public static string CurrentOrgIP
    {
        get
        {
            return HttpContext.Current.Request.UserHostAddress;
        }
     
    }

    /// <summary>
    /// store the current logged in Organization.
    /// </summary>
    public static string UnitDisplayTitle
    {
        get
        {
            if (HttpContext.Current.Session["UnitDisplayTitle"] == null)
            {
                return "";
            }
            else
            {
                return HttpContext.Current.Session["UnitDisplayTitle"].ToString();
            }
        }
        set
        {
            HttpContext.Current.Session["UnitDisplayTitle"] = value;
        }
    }

    /// <summary>
    /// store the current logged in Organization.
    /// </summary>
    public static int? CurrentOrgID
    {
        get
        {
            if (HttpContext.Current.Session["CurrentOrgID"] == null)
            {
               return null;
            }
            else
            {
                return Convert.ToInt32(HttpContext.Current.Session["CurrentOrgID"].ToString());
            }
        }
        set
        {
            HttpContext.Current.Session["CurrentOrgID"] = value;
        }
    }

    /// <summary>
    /// store the current logged in Organization.
    /// </summary>
    public static string CurrentOrgName
    {
        get
        {
            if (HttpContext.Current.Session["CurrentOrgName"] == null)
            {
                 return "";
            }
            else
            {
                return HttpContext.Current.Session["CurrentOrgName"].ToString();
            }
        }
        set
        {
            HttpContext.Current.Session["CurrentOrgName"] = value;
        }
    }

    /// <summary>
    /// Database connection string
    /// </summary>
    public static string ConnString
    {
        get
        {
            return ConfigurationManager.AppSettings["dbConnection"].ToString();
        }
    }

    /// <summary>
    /// Current Organization Governate
    /// </summary>
    public static short CurrentOrgGovID
    {
        get
        {
            if (HttpContext.Current.Session["CurrentOrgGovID"] == null)
            {
                return 0;
            }
            else
            {
                return short.Parse(HttpContext.Current.Session["CurrentOrgGovID"].ToString()) ;
            }
        }
        set
        {
            HttpContext.Current.Session["CurrentOrgGovID"] = value;
        }
    }

    public static string CurrentOrgGovName
    {
        get
        {
            if (HttpContext.Current.Session["CurrentOrgGovName"] == null)
            {
                return "";
            }
            else
            {
                return HttpContext.Current.Session["CurrentOrgGovName"].ToString();
            }
        }
        set
        {
            HttpContext.Current.Session["CurrentOrgGovName"] = value;
        }
    }

    /// <summary>
    /// Current Organization POLICE_STATION
    /// </summary>
    public static int CurrentOrgPoliceStationID
    {
        get
        {
            if (HttpContext.Current.Session["CurrentOrgPoliceStationID"] == null)
            {
                return 0;
            }
            else
            {
                return int.Parse(HttpContext.Current.Session["CurrentOrgPoliceStationID"].ToString());
            }
        }
        set
        {
            HttpContext.Current.Session["CurrentOrgPoliceStationID"] = value;
        }
    }

    public static string CurrentOrgPoliceStationName
    {
        get
        {
            if (HttpContext.Current.Session["CurrentOrgPoliceStationName"] == null)
            {
                return "";
            }
            else
            {
                return HttpContext.Current.Session["CurrentOrgPoliceStationName"].ToString();
            }
        }
        set
        {
            HttpContext.Current.Session["CurrentOrgPoliceStationName"] = value;
        }
    }

    /// <summary>
    /// Current Organization POLICE_STATION
    /// </summary>
    public static int CurrentOrgAreaID
    {
        get
        {
            if (HttpContext.Current.Session["CurrentOrgAreaID"] == null)
            {
                return 0;
            }
            else
            {
                return int.Parse(HttpContext.Current.Session["CurrentOrgAreaID"].ToString());
            }
        }
        set
        {
            HttpContext.Current.Session["CurrentOrgAreaID"] = value;
        }
    }

    public static string CurrentOrgAreaName
    {
        get
        {
            if (HttpContext.Current.Session["CurrentOrgAreaName"] == null)
            {
                return "";
            }
            else
            {
                return HttpContext.Current.Session["CurrentOrgAreaName"].ToString();
            }
        }
        set
        {
            HttpContext.Current.Session["CurrentOrgAreaName"] = value;
        }
    }

    /// <summary>
    /// store the current logged in Organization.
    /// </summary>
    public static string NIDValidationMessage
    {
        get
        {
            if (HttpContext.Current.Session["NIDValidationMessage"] == null)
            {
                return "";
            }
            else
            {
                return HttpContext.Current.Session["NIDValidationMessage"].ToString();
            }
        }
        set
        {
            HttpContext.Current.Session["NIDValidationMessage"] = value;
        }
    }

    /// <summary>
    /// Store copy from Governate table in Cashe object
    /// in order to use it while showing lookups.
    /// </summary>
    public static DataTable tblGovernate
    {
        get
        {
            //if (HttpContext.Current.Application["tblGovernate"] == null)
            //{
                GOVERNORATE gov = new GOVERNORATE();
                gov.LoadAll();
            //    HttpContext.Current.Application["tblGovernate"] = gov.DefaultView.Table;
            //}
            //return (DataTable)HttpContext.Current.Application["tblGovernate"];
                return gov.DefaultView.Table;
        }
    }

    /// <summary>
    /// Store copy from PoliceStation table in Cashe object
    /// in order to use it while showing lookups.
    /// </summary>
    public static DataTable tblPoliceStation
    {
        get
        {
            //if (HttpContext.Current.Application["tblPoliceStation"] == null)
            //{
                POLICE_STATION pol = new POLICE_STATION();
                pol.LoadAll();
                //HttpContext.Current.Application["tblPoliceStation"] = pol.DefaultView.Table;
            //}
          //  return (DataTable)HttpContext.Current.Application["tblPoliceStation"];
                return pol.DefaultView.Table;
        }
    }

    /// <summary>
    /// Store copy from Areas table in Cashe object
    /// in order to use it while showing lookups.
    /// </summary>
    public static DataTable tblAreas
    {
        get
        {
            //if (HttpContext.Current.Application["tblAreas"] == null)
            //{
                AREA ar = new AREA();
                ar.LoadAll();
            //    HttpContext.Current.Application["tblAreas"] = ar.DefaultView.Table;
            //}
            //return (DataTable)HttpContext.Current.Application["tblAreas"];
                return ar.DefaultView.Table;
        }
    }

    public static int EnableSmartLogin
    {
        get
        {
            return Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["SmartLogin"].ToString());
        }
    }

    #endregion

    #region Events

    public MHOCommon()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    [Serializable]
    public struct NationalIdData
    {
        public  string FirstName ;
        public  string FatherName;
        public  string FamilyName;
        public string SureName;
        public string NationalIden;
        public string _oldRegDate;
    }

    #endregion
   
    #region Methods

    /// <summary>
    /// Load current organization data through current org ID
    /// </summary>
    /// <param name="ip"></param>
    public static bool LoadCurrentOrgData(string ip)
    {

        health_office objHealth = new health_office();
        DataTable dtHealth = objHealth.GetDefaultHealthOfficeData(ip);
        if (dtHealth.Rows.Count > 0)
        {
            if (int.Parse(dtHealth.Rows[0]["LocationTypeId"].ToString()) == 1)
            {
                // return Ministry of health as title.
                UnitDisplayTitle = dtHealth.Rows[0]["descr"].ToString();
                return true;
            }
            if (int.Parse(dtHealth.Rows[0]["LocationTypeId"].ToString()) == 2)
            {
                // return Ministry of health as title.
                UnitDisplayTitle = dtHealth.Rows[0]["descr"].ToString() + " " + dtHealth.Rows[0]["GoveName"].ToString();
                CurrentOrgGovID = short.Parse(dtHealth.Rows[0]["GovId"].ToString());
                return true;
            }
            if (int.Parse(dtHealth.Rows[0]["LocationTypeId"].ToString()) == 3)
            {
                // return Ministry of health as title.
                UnitDisplayTitle = dtHealth.Rows[0]["descr"].ToString() + " " + dtHealth.Rows[0]["CivilName"].ToString();
                return true;
            }
            if (int.Parse(dtHealth.Rows[0]["LocationTypeId"].ToString()) == 4)
            {
                CurrentOrgID = int.Parse(dtHealth.Rows[0]["HealthOfficeId"].ToString());
                CurrentOrgName = dtHealth.Rows[0]["HEALTHDESCR"].ToString();
                CurrentOrgGovID = short.Parse(dtHealth.Rows[0]["GovId"].ToString());
                CurrentOrgGovName = dtHealth.Rows[0]["GoveName"].ToString();
                if (!string.IsNullOrEmpty(dtHealth.Rows[0]["PoliceID"].ToString()))
                {
                    CurrentOrgPoliceStationID = int.Parse(dtHealth.Rows[0]["PoliceID"].ToString());
                    CurrentOrgPoliceStationName = dtHealth.Rows[0]["PoliceName"].ToString();
                }
                if (!string.IsNullOrEmpty(dtHealth.Rows[0]["AreaID"].ToString()))
                {
                    CurrentOrgAreaID = int.Parse(dtHealth.Rows[0]["AreaID"].ToString());
                    CurrentOrgAreaName = dtHealth.Rows[0]["AreaName"].ToString();
                }
                UnitDisplayTitle = UnitDisplayTitle = dtHealth.Rows[0]["descr"].ToString() + " " + dtHealth.Rows[0]["HEALTHDESCR"].ToString();
            }
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// Show Alert message
    /// </summary>
    /// <param name="MessageText">string to show</param>
    /// <param name="MyPage"> refrence for the current page</param>
    public static void ShowMessage(string MessageText, Page MyPage)
    {
        ScriptManager.RegisterStartupScript(MyPage, MyPage.GetType(), "info_msg", "alert('" + MessageText + "');", true);
    }

    public static void ScrollPageUp(Page MyPage)
    {
        ScriptManager.RegisterStartupScript(MyPage, MyPage.GetType(), "info_msg", "window.scrollTo(0,0);", true);
    }

    /// <summary>
    /// Validate the National ID number on 
    /// Length = 14 digit and validate it's date part
    /// </summary>
    /// <param name="IDvalue">refrence for actual National ID value </param>
    /// <returns>boolean with check result</returns>
    public static bool ValidateNationalIDInput(string IDvalue, bool? isFemal)
    {
        if (IDvalue == "11111111111111" || IDvalue == "28409012601094")
            return true;

        string nid = IDvalue;

        if (nid.Length == 14)
        {
            if (nid.Substring(0, 1) == "0" ||
                nid.Substring(1, 2) == "00" ||
                nid.Substring(3, 2) == "00" ||
                nid.Substring(5, 2) == "00")
            {
                NIDValidationMessage = "خطا فى بيانات التاريخ";
                return false;
            }

            if (Convert.ToInt32(nid.Substring(0, 1)) > 3 || Convert.ToInt32(nid.Substring(0, 1)) < 2)
            {
                NIDValidationMessage = "خطا فى حساب الافية";
                return false;
            }

            int MaleFemaleIndec = int.Parse(nid.Substring(12, 1));
            if (isFemal != null)
            {
                if (isFemal.Value)
                {
                    if (MaleFemaleIndec % 2 != 0)
                    {
                        NIDValidationMessage = "الرقم القومى يشير الى مذكر";
                        return false;
                    }
                }
                else
                {
                    if (MaleFemaleIndec % 2 == 0)
                    {
                        NIDValidationMessage = "الرقم القومى يشير الى مؤنث";
                        return false;
                    }
                }
            }
            int year = Convert.ToInt32(nid.Substring(1, 2));
            int month = Convert.ToInt32(nid.Substring(3, 2));
            int day = Convert.ToInt32(nid.Substring(5, 2));
            if (month > 12 || day > 31)
            {
                NIDValidationMessage = "شهر الميلاد او يوم الميلاد خطأ";
                return false;
            }
            else if (month == 2 && day > 29)
            {
                NIDValidationMessage = "لقد حاولت ادخال يوم اكبر من 29 لشهر فبراير";
                return false;
            }
            else
            {
                NIDValidationMessage = "";
                return true;
            }
        }
        else
        {
            NIDValidationMessage = "الرقم القومى يجب ان لا يقل عن 14 خانة";
            return false;
        }
    }

    /// <summary>
    /// Request the get National ID data from the live webservice.
    /// </summary>
    /// <param name="validNID">refrence for National ID number</param>
    /// <returns></returns>
    public static NationalIdData? RequestNationalIDData(string validNID)
    {

        if (validNID == "11111111111111" || validNID == "28409012601094")
        {
            NationalIdData nidStruct1 = new NationalIdData();
            nidStruct1.FirstName = "Steven";
            nidStruct1.FatherName = "-----";
            nidStruct1.FamilyName = "Yousef";
            nidStruct1.SureName = "Sawires";
            return nidStruct1;
        }

        try
        {
            G2GHeader header = new G2GHeader();
            header.Agency = "Agency";
            header.Application = "Application";
            header.Citizen = "Citizen";
            header.Employee = "Employee";
            header.Entity = "Entity";
            header.Office = "Office";

            PersonProfileId personProfileId = new PersonProfileId();
            personProfileId.idNum = validNID;
            personProfileId.organizationID = "MOHP";
            personProfileId.orgIpAddres = "163.121.135.51";
            personProfileId.prkey = "mohp";
            personProfileId.stype = "s";

            PersonalProfileServiceImpl objService = new PersonalProfileServiceImpl();
            string UserTokenWCF = System.Configuration.ConfigurationManager.AppSettings["UserTokenWCF"].ToString();
            string PassTokenWCF = System.Configuration.ConfigurationManager.AppSettings["PassTokenWCF"].ToString();
            UsernameToken token = new UsernameToken(UserTokenWCF, PassTokenWCF, PasswordOption.SendPlainText);
            objService.SetClientCredential(token);
            objService.SetPolicy("ClientPolicy");
            objService.G2GHeaderValue = header;

            PersonProfile Aperson = objService.getPersonProfileById(personProfileId);

            NationalIdData nidStruct = new NationalIdData();
            nidStruct.FirstName = Aperson.firstName;

            string[] names = Aperson.lastNames.Split(' ');
            if (names.Length < 2)
                nidStruct.FatherName = names[0];
            else if (names.Length < 3)
            {
                nidStruct.FatherName = names[0];
                nidStruct.FamilyName = names[1];
            }
            else if (names.Length >= 3)
            {
                nidStruct.FatherName = names[0];
                nidStruct.FamilyName = names[1];
                nidStruct.SureName = names[2];
            }


            
            //System.Net.ServicePointManager.CertificatePolicy = new TrsutAll();
            //CsoCheckPrsService.Export1_CsoCheckPrsHttpService objService = new CsoCheckPrsService.Export1_CsoCheckPrsHttpService();
            //CsoCheckPrsService.CSOOutput objOutput = new CsoCheckPrsService.CSOOutput();
            
            //objOutput = objService.csogetPersonDetByIdnum(validNID, "MOHP", "163.121.135.51", "mohp", "S");
            
            //string fname = objOutput.firstName;
            //string[] lastNames = objOutput.lastNames.Split(' ');
            //string mName = lastNames[0].ToString();
            //string Lname = lastNames[1].ToString();
            //string Sname = "" ;
            //if (lastNames.Length > 2)
            //Sname = lastNames[2].ToString();
            
            //NationalIdData nidStruct = new NationalIdData();
            //nidStruct.FirstName = fname;
            //nidStruct.FatherName = mName;
            //nidStruct.FamilyName = Lname;
            //nidStruct.SureName = Sname;

            return nidStruct;
             
        }
        catch (FaultException ex)
        {

            NationalIdData nidStruct2 = new NationalIdData();
            nidStruct2.FirstName = ex.Action+ex.Code+ ex.Message + ex.Source ;

            return nidStruct2;
            //return null;
        }
        catch(Exception ex)
        {

            NationalIdData nidStruct2 = new NationalIdData();
            nidStruct2.FirstName = "Message: " + ex.Message + " --- Source: " + ex.Source + " --- Data: " + ex.Data.ToString() + " --- StackTrace: " + ex.StackTrace;
            
            return nidStruct2;
            //return null;
        }
    }

    public static void DisablePageControls(Control pnl,bool status)
    {
        foreach (Control ctrl in pnl.Controls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Enabled = status;
            else if (ctrl is Button)
                ((Button)ctrl).Enabled = status;
            else if (ctrl is RadioButton)
                ((RadioButton)ctrl).Enabled = status;
            else if (ctrl is ImageButton)
                ((ImageButton)ctrl).Enabled = status;
            else if (ctrl is CheckBox)
                ((CheckBox)ctrl).Enabled = status;
            else if (ctrl is DropDownList)
                ((DropDownList)ctrl).Enabled = status;
            else if (ctrl is HyperLink)
                ((HyperLink)ctrl).Enabled = status;
            else if (ctrl is RadioButtonList)
                ((RadioButtonList)ctrl).Enabled = status;

            DisablePageControls(ctrl, status);
        }

    }

    public static DataTable LoadPoliceStationsForGovID(short govID)
    {
        string filterExpr = POLICE_STATION.ColumnNames.FK_GOVCD + "=" + govID.ToString();
      //  string sortExpr = POLICE_STATION.ColumnNames.DESCR + " ASC";
        DataRow[] drr = tblPoliceStation.Select(filterExpr);
        DataTable dtRes = new DataTable();
        dtRes.Columns.Add(POLICE_STATION.ColumnNames.CD);
        dtRes.Columns.Add(POLICE_STATION.ColumnNames.DESCR);
        dtRes.Columns.Add(POLICE_STATION.ColumnNames.FK_GOVCD);
        
        foreach (DataRow dr in drr)
        {
            DataRow drNew = dtRes.NewRow();
            drNew.ItemArray = dr.ItemArray;
            dtRes.Rows.Add(drNew);
        }
        //dtRes.Rows.Add(drr);
        return dtRes;
    }

    public static DataTable LoadAreasForPoliceID(int polID)
    {
        string filterExpr = AREA.ColumnNames.FK_POLICECD + "=" + polID.ToString();
        //string sortExpr = AREA.ColumnNames.DESCR + " ASC";
        DataRow[] drr = tblAreas.Select(filterExpr);
        DataTable dtRes = new DataTable();
        dtRes.Columns.Add(AREA.ColumnNames.CD);
        dtRes.Columns.Add(AREA.ColumnNames.DESCR);
        dtRes.Columns.Add(AREA.ColumnNames.FK_POLICECD);

        foreach (DataRow dr in drr)
        {
            DataRow drNew = dtRes.NewRow();
            drNew.ItemArray = dr.ItemArray;
            dtRes.Rows.Add(drNew);
        }
        //dtRes.Rows.Add(drr);
        return dtRes;
    }

    /// <summary>
    /// get date of birth from the givin National ID
    /// </summary>
    /// <param name="NID">Reference for NationalID</param>
    /// <returns>Date Of Birth</returns>
    public static DateTime? GetDateFromNID(string nid)
    {
        int century = Convert.ToInt32(nid.Substring(0, 1));
        int year = Convert.ToInt32(nid.Substring(1, 2));
        int month = Convert.ToInt32(nid.Substring(3, 2));
        int day = Convert.ToInt32(nid.Substring(5, 2));

        string yearValue = "";
        if (century == 2)
            yearValue = "19" + year.ToString();
        else if(century == 3)
            yearValue = "20" + year.ToString();

        try
        {
            return DateTime.Parse(yearValue + "-" + month.ToString() + "-" + day.ToString());
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public static void ClearCurrentSession()
    {
        HttpContext.Current.Session["UnitDisplayTitle"] = null;
        HttpContext.Current.Session["CurrentOrgID"] = null;
        HttpContext.Current.Session["CurrentOrgName"] = null;
        HttpContext.Current.Session["CurrentOrgGovID"] = null;
        HttpContext.Current.Session["CurrentOrgGovName"] = null;
        HttpContext.Current.Session["CurrentOrgPoliceStationID"] = null;
        HttpContext.Current.Session["CurrentOrgPoliceStationName"] = null;
        HttpContext.Current.Session["CurrentOrgAreaID"] = null;

    }


    public static void WriteQrsDead(Guid DeadEventID)
    {
        Dead deadCase = new Dead();
        deadCase.LoadByPrimaryKey(DeadEventID);
        MHO.BLL.AREA area = new AREA();
        area.LoadByPrimaryKey(deadCase.DeadArea);
        MHO.BLL.POLICE_STATION ps = new POLICE_STATION();
        ps.LoadByPrimaryKey(deadCase.DeadSection);
        MHO.BLL.health_office ho = new health_office();
        ho.LoadByPrimaryKey(deadCase.OrgID);

        NATIONALITY MotherNath = new NATIONALITY();
        MotherNath.LoadByPrimaryKey(deadCase.DeadMotherNationality);
        string gender = (deadCase.DeadGender == 1) ? "ذكر " : "أنثى";
        string deadMartialStatus = "اعزب", deadReligion = "مسلم", motherReligion = "مسلم", InformRelation = "الأب";

        switch (deadCase.DeadMartialStatus)
        {
            case 1:
                deadMartialStatus = "اعزب";
                break;
            case 2:
                deadMartialStatus = "متزوج";
                break;
            case 3:
                deadMartialStatus = "مطلق";
                break;
            case 4:
                deadMartialStatus = "أرمل";
                break;
        }
        switch (deadCase.DeadMotherReligion)
        {
            case 1:
                motherReligion = "مسلم";
                break;
            case 2:
                motherReligion = "مسيحى";
                break;
            case 3:
                motherReligion = "يهودى";
                break;
        }

        switch (deadCase.DeadReligion)
        {
            case 1:
                deadReligion = "مسلم";
                break;
            case 2:
                deadReligion = "مسيحى";
                break;
            case 3:
                deadReligion = "يهودى";
                break;
        }

        switch (deadCase.InformerRelation)
        {
            case 1:
                InformRelation = "الاب";
                break;
            case 2:
                InformRelation = "الام";
                break;
            case 3:
                InformRelation = "الاخ";
                break;
            case 4:
                InformRelation = "الاخت";
                break;
            case 5:
                InformRelation = "العم";
                break;
            case 6:
                InformRelation = "الخال";
                break;
            case 7:
                InformRelation = "الجد";
                break;
            case 8:
                InformRelation = "اخري";
                break;
            case 9:
                InformRelation = "الابن";
                break;
            case 10:
                InformRelation = "الابنة";
                break;
        }
        if (deadCase.RowCount > 0)
        {
            QrEncoder encoder = new QrEncoder(ErrorCorrectionLevel.M);
            QrCode qrCode;
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(deadCase.DeadNID);
            builder.AppendLine("," + deadCase.DeadFirstName + " " + deadCase.DeadFatherName + " " + deadCase.DeadGrandName + " " + deadCase.DeadFamilyName);
            builder.AppendLine("," + deadCase.DeadBirthDate.ToShortDateString());
            builder.AppendLine("," + deadReligion);
            builder.AppendLine("," + deadMartialStatus);
            builder.AppendLine("," + gender);
            builder.AppendLine("," + deadCase.AddressNo + "," + deadCase.AddressStreet + "," + deadCase.AddressFeatured);
            builder.AppendLine("," + ps.DESCR);
            builder.AppendLine("," + area.DESCR);
            builder.AppendLine("," + deadCase.DeadDieDate.ToShortDateString() + " - " + deadCase.DeadDieHour + ":" + deadCase.DeadDieMin);
            builder.AppendLine("," + deadCase.DiePlace + "," + deadCase.DiePlaceDescription);
            builder.AppendLine("," + deadCase.DeadMotherFirstName + " " + deadCase.DeadMotherSecondName + " " + deadCase.DeadMotherFamilyName + " " + deadCase.DaadMotherSureName);
            builder.AppendLine("," + MotherNath.DESCR);
            builder.AppendLine("," + motherReligion);
            builder.AppendLine("," + deadCase.DeadMotherJob);
            builder.AppendLine("," + deadCase.DeadMotherNID);
            builder.AppendLine("," + deadCase.InformerFirstName + " " + deadCase.InformerSecondName);
            builder.AppendLine("," + InformRelation);
            builder.AppendLine("," + deadCase.InformerNID);
            builder.AppendLine("," + deadCase.InformerPhone);
            encoder.TryEncode(builder.ToString(), out qrCode);

            GraphicsRenderer gRenderer = new GraphicsRenderer(
            new FixedModuleSize(2, QuietZoneModules.Zero),
            Brushes.Black, Brushes.White);

            MemoryStream ms = new MemoryStream();
            gRenderer.WriteToStream(qrCode.Matrix, ImageFormat.Bmp, ms);

            try
            {

                SqlCommand cmd = new SqlCommand();
                SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["dbConnection"].ToString());
                cmd.CommandText = "insert into QRSDead (ID,QrCode) values  (@ID,@Picture)";
                cmd.Parameters.Add("@ID", System.Data.SqlDbType.UniqueIdentifier);
                cmd.Parameters.Add("@Picture", System.Data.SqlDbType.VarBinary);
                cmd.Connection = conn;
                cmd.Parameters["@ID"].Value = DeadEventID;
                cmd.Parameters["@Picture"].Value = ms.ToArray();

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                
            }
        }
    }

    public static void WriteQrsBorn(Guid BornEventID)
    {
        Born bornCase = new Born();
        bornCase.LoadByPrimaryKey(BornEventID);
        MHO.BLL.AREA area = new AREA();
        area.LoadByPrimaryKey(bornCase.BornArea);
        MHO.BLL.POLICE_STATION ps = new POLICE_STATION();
        ps.LoadByPrimaryKey(bornCase.BornSection);
        MHO.BLL.health_office ho = new health_office();
        ho.LoadByPrimaryKey(bornCase.OrgID);
        NATIONALITY FatherNath = new NATIONALITY();
        FatherNath.LoadByPrimaryKey(bornCase.FatherNationality);
        NATIONALITY MotherNath = new NATIONALITY();
        MotherNath.LoadByPrimaryKey(bornCase.MotherNationality);
        string gender = (bornCase.BornGender == 1) ? "ذكر " : "أنثى";
        string fatherReligion = "مسلم", motherReligion = "مسلم", InformRelation = "الأب";
        switch (bornCase.FatherReligion)
        {
            case 1:
                fatherReligion = "مسلم";
                break;
            case 2:
                fatherReligion = "مسيحى";
                break;
            case 3:
                fatherReligion = "يهودى";
                break;

        }

        switch (bornCase.MotherReligion)
        {
            case 1:
                motherReligion = "مسلم";
                break;
            case 2:
                motherReligion = "مسيحى";
                break;
            case 3:
                motherReligion = "يهودى";
                break;
        }

        switch (bornCase.InformerRelation)
        {
            case 1:
                InformRelation = "الاب";
                break;
            case 2:
                InformRelation = "الام";
                break;
            case 3:
                InformRelation = "الاخ";
                break;
            case 4:
                InformRelation = "الاخت";
                break;
            case 5:
                InformRelation = "العم";
                break;
            case 6:
                InformRelation = "الخال";
                break;
            case 7:
                InformRelation = "الجد";
                break;
            case 8:
                InformRelation = "اخري";
                break;
            case 9:
                InformRelation = "الابن";
                break;
            case 10:
                InformRelation = "الابنة";
                break;
        }
        if (bornCase.RowCount > 0)
        {
            QrEncoder encoder = new QrEncoder(ErrorCorrectionLevel.M);
            QrCode qrCode;
            StringBuilder builder = new StringBuilder();

            builder.AppendLine(bornCase.BornName + " " + bornCase.FirstFatherName + " " + bornCase.SecondFatherName + " " + bornCase.FatherSureName);
            builder.AppendLine("," + ps.DESCR);
            builder.AppendLine("," + area.DESCR);
            builder.AppendLine("," + gender);
            builder.AppendLine("," + bornCase.BirthDate.ToShortDateString() + " " + bornCase.BirthDate.Minute.ToString() + ":" + bornCase.BirthDate.Hour.ToString());
            builder.AppendLine("," + bornCase.FirstFatherName + " " + bornCase.SecondFatherName + " " + bornCase.FamilyFatherName + " " + bornCase.FatherSureName);
            builder.AppendLine("," + FatherNath.DESCR);
            builder.AppendLine("," + fatherReligion);
            builder.AppendLine(",");
            builder.AppendLine("," + bornCase.FatherJob);
            builder.AppendLine("," + bornCase.FatherNID);
            builder.AppendLine("," + bornCase.FirstMotherName + " " + bornCase.SecondMotherName + " " + bornCase.FamilyMotherName + " " + bornCase.MotherSureName);
            builder.AppendLine("," + MotherNath.DESCR);
            builder.AppendLine("," + motherReligion);
            builder.AppendLine(",");
            builder.AppendLine("," + bornCase.MotherJob);
            builder.AppendLine("," + bornCase.MotherNID);
            builder.AppendLine("," + bornCase.InformerFirstName + " " + bornCase.InformerSecondName);
            builder.AppendLine("," + InformRelation);
            builder.AppendLine("," + bornCase.InformerNID);
            builder.AppendLine("," + bornCase.InformerPhone);
            encoder.TryEncode(builder.ToString(), out qrCode);

            GraphicsRenderer gRenderer = new GraphicsRenderer(
             new FixedModuleSize(2, QuietZoneModules.Zero),
             Brushes.Black, Brushes.White);

            MemoryStream ms = new MemoryStream();
            gRenderer.WriteToStream(qrCode.Matrix, ImageFormat.Bmp, ms);



            try
            {
                SqlCommand cmd = new SqlCommand();
                SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["dbConnection"].ToString());
                cmd.CommandText = "insert into QRSBorn (ID,QrCode) values  (@ID,@Picture)";
                cmd.Parameters.Add("@ID", System.Data.SqlDbType.UniqueIdentifier);
                cmd.Parameters.Add("@Picture", System.Data.SqlDbType.VarBinary);
                cmd.Connection = conn;
                cmd.Parameters["@ID"].Value = BornEventID;
                cmd.Parameters["@Picture"].Value = ms.ToArray();

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
              
            }

        }
    }

    #endregion
}
