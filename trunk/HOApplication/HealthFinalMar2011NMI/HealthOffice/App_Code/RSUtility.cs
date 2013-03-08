using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Collections;
using System.IO;
/// <summary>
/// Summary description for RSUtility
/// </summary>
[Serializable]
public class RSUtility
{
    #region Properties
    /// <summary>
    /// Gets or sets sql parameters hashtable
    /// </summary>
    /// 
    
    public static Hashtable SqlParametersTbl
    {
        get
        {
            if(HttpContext.Current.Session["SqlParametersTbl"]!=null)
            {
                return (Hashtable)HttpContext.Current.Session["SqlParametersTbl"];
            }
            else
            {
                return new Hashtable();
            }
            
        }
        set
        {
            HttpContext.Current.Session["SqlParametersTbl"] = value;
        }
    }
    /// <summary>
    /// Gets or sets sql parameters hashtable for SubReport
    /// </summary>
    public static Hashtable SqlParametersTblSubReport
    {
        get
        {
            if (HttpContext.Current.Session["SqlParametersTblSubReport"] != null)
            {
                return (Hashtable)HttpContext.Current.Session["SqlParametersTblSubReport"];
            }
            else
            {
                return new Hashtable();
            }

        }
        set
        {
            HttpContext.Current.Session["SqlParametersTblSubReport"] = value;
        }
    }
    /// <summary>
    /// Gets or sets default data source
    /// </summary>
    public static string DefaultDataSource
    {
        get
        {
            if (HttpContext.Current.Session["DefaultDataSource"] != null)
            {
                return HttpContext.Current.Session["DefaultDataSource"].ToString();
            }
            else
            {
                return string.Empty;
            }

        }
        set
        {
            HttpContext.Current.Session["DefaultDataSource"] = value;
        }
    }
    #endregion

    #region Private Static Members



    #endregion

    #region Public Static Methods

    public static string GenerateURL(string sReportPath, Hashtable htParameters)
    {
        htParameters.Add("rqpage", HttpContext.Current.Request.Url.ToString().ToLower().Substring(HttpContext.Current.Request.Url.ToString().ToLower().IndexOf("healthreports") + 11).Trim());

        htParameters.Add("RptRDL", sReportPath.Trim());
        string sRetVal = getViewerName();
        object oParameterValue;
        
        foreach (string sParameterName in htParameters.Keys)
        {
            oParameterValue = htParameters[sParameterName];

            if (oParameterValue == null)
                sRetVal += sParameterName + ":isnull=true" + "&";
            else
            {
                if (oParameterValue is bool)
                {
                    sRetVal += sParameterName + "=" + ((bool)oParameterValue ? "true" : "false") + "&";
                }
                else if (oParameterValue is DateTime)
                {

                    sRetVal += sParameterName + "=" + ((DateTime)oParameterValue).ToString("MM/dd/yyyy") + "&";
                }
                else
                {
                    sRetVal += sParameterName + "=" + HttpUtility.UrlEncode(oParameterValue.ToString()) + "&";
                }
            }
        }
       

        
        return sRetVal.Substring(0, sRetVal.Length - 1);
        
    }

    //public static string GenerateURL(string sReportPath, Hashtable htParameters, string SpName)
    //{
    //    htParameters.Add("rqpage", HttpContext.Current.Request.Url.ToString().ToLower().Substring(HttpContext.Current.Request.Url.ToString().ToLower().IndexOf("umisreports") + 11));
    //    string Logo = AppSecurity.GetFacultyLogo();

    //    //if (Logo == "" || !File.Exists( ConfigurationSettings.AppSettings["ImagesURL"] + Logo.Substring(1)))
    //    //    Logo = "DefaultImages/NoPictureFound.gif";
    //    if (Logo == "")
    //    htParameters.Add("FacLgo", ConfigurationSettings.AppSettings["ImagesURL"] + "/NoPictureFound.gif"); 
    //    else
    //    htParameters.Add("FacLgo", ConfigurationSettings.AppSettings["ImagesURL"] + Logo.Substring(1));

    //    //Univeristy Logo Path
    //    Logo = AppSecurity.GetUniversityLogo();

    //    //if (Logo == "" || !File.Exists(ConfigurationSettings.AppSettings["ImagesURL"] + Logo.Substring(1)))
    //    //    Logo = "DefaultImages/NoPictureFound.gif";
    //    if (Logo == "")
    //        htParameters.Add("UniLgo", ConfigurationSettings.AppSettings["ImagesURL"] + "/NoPictureFound.gif");
    //    else
    //        htParameters.Add("UniLgo", ConfigurationSettings.AppSettings["ImagesURL"] + Logo.Substring(1));
    //    if (HttpContext.Current.Session["FacultyName"] != null)
    //        htParameters.Add("FacNam", HttpContext.Current.Session["FacultyName"]);
    //    else
    //        htParameters.Add("FacNam", "");
    //    //FacultyName
    //    if (HttpContext.Current.Session["UniveristyName"] != null)
    //        htParameters.Add("UniNam", HttpContext.Current.Session["UniveristyName"]);
    //    //Module Name
    //    htParameters.Add("ModNam", getModuleName());
    //    htParameters.Add("RptRDL", sReportPath);
    //    // Handling sub report stored procedure 
    //    if (SpName.Contains(","))
    //    {
    //        string[] args = SpName.Split(',');
    //        htParameters.Add("SPName", args[0]);
    //        htParameters.Add("SubSPName", args[1]);
    //    }
    //    else
    //    {
    //        htParameters.Add("SPName", SpName);
    //    }
    //    string sRetVal = "~/UMISReports/viewers/LocalReportViewer.aspx?";
        
    //    object oParameterValue;
    //    //   if (sRetVal == string.Empty) return sRetVal;        
    //    // System.Collections.Generic.List<DictionaryEntry> rptList =new System.Collections.Generic.List<DictionaryEntry>();
    //    foreach (string sParameterName in htParameters.Keys)
    //    {
    //        oParameterValue = htParameters[sParameterName];

    //        if (oParameterValue == null)
    //            sRetVal += sParameterName + ":isnull=true" + "&";
    //        else
    //        {
    //            if (oParameterValue is bool)
    //            {
    //                sRetVal += sParameterName + "=" + ((bool)oParameterValue ? "true" : "false") + "&";
    //            }
    //            else if (oParameterValue is DateTime)
    //            {

    //                sRetVal += sParameterName + "=" + ((DateTime)oParameterValue).ToString("MM/dd/yyy") + "&";
    //            }
    //            else
    //            {
    //                sRetVal += sParameterName + "=" + HttpUtility.UrlEncode(oParameterValue.ToString()) + "&";
    //            }
    //        }
    //    }


    //    //foreach (string key in htParameters.Keys)
    //    //{
    //    //    if (htParameters[key] != null)
    //    //    rptList.Add(new DictionaryEntry(key, htParameters[key].ToString()));
    //    //    else
    //    //    rptList.Add(new DictionaryEntry(key, htParameters[key]));
    //    //}
    //    return sRetVal.Substring(0, sRetVal.Length - 1);
    //    // return GenerateURL(sReportPath, htParameters, defShowToolbar, defShowParameters);
    //}

    //public static string GenerateURLFromUI(string sReportPath, Hashtable htParameters)
    //{
    //    htParameters.Add("rqpage", HttpContext.Current.Request.Url.ToString().ToLower().Substring(HttpContext.Current.Request.Url.ToString().ToLower().IndexOf("/ui/")));
    //    // string url = HttpContext.Current.Request.Url.ToString();
    //    //Faculty Logo Path
    //    string Logo = AppSecurity.GetFacultyLogo();

    //    //if (Logo == "" || !File.Exists( ConfigurationSettings.AppSettings["ImagesURL"] + Logo))
    //    //    Logo = "DefaultImages/NoPictureFound.gif";
        
    //    //Edit by shady 26-01-2010
    //    //to handle the disappearance of Faclogo and UniLgo
    //    if (Logo == "")
    //        htParameters.Add("FacLgo", ConfigurationSettings.AppSettings["ImagesURL"] + "/NoPictureFound.gif");
    //    else
    //        htParameters.Add("FacLgo", ConfigurationSettings.AppSettings["ImagesURL"] + Logo.Substring(1));

    //    //Univeristy Logo Path
    //    Logo = AppSecurity.GetUniversityLogo();

    //    //if (Logo == "" || !File.Exists(ConfigurationSettings.AppSettings["ImagesURL"] + Logo))
    //    //    Logo = "DefaultImages/NoPictureFound.gif";

    //    if (Logo == "")
    //        htParameters.Add("UniLgo", ConfigurationSettings.AppSettings["ImagesURL"] + "/NoPictureFound.gif");
    //    else
    //        htParameters.Add("UniLgo", ConfigurationSettings.AppSettings["ImagesURL"] + Logo.Substring(1));
    //    if(HttpContext.Current.Session["FacultyName"]!=null)
    //         htParameters.Add("FacNam", HttpContext.Current.Session["FacultyName"]);
    //    //FacultyName
    //    htParameters.Add("UniNam", HttpContext.Current.Session["UniveristyName"]);
    //    //Module Name
    //    htParameters.Add("ModNam", getModuleName());
    //    htParameters.Add("RptRDL", sReportPath);
    //    string sRetVal = getViewerNameFromUI();
    //    object oParameterValue;
    //    //   if (sRetVal == string.Empty) return sRetVal;        
    //    // System.Collections.Generic.List<DictionaryEntry> rptList =new System.Collections.Generic.List<DictionaryEntry>();
    //    foreach (string sParameterName in htParameters.Keys)
    //    {
    //        oParameterValue = htParameters[sParameterName];

    //        if (oParameterValue == null)
    //            sRetVal += sParameterName + ":isnull=true" + "&";
    //        else
    //        {
    //            if (oParameterValue is bool)
    //            {
    //                sRetVal += sParameterName + "=" + ((bool)oParameterValue ? "true" : "false") + "&";
    //            }
    //            else if (oParameterValue is DateTime)
    //            {

    //                sRetVal += sParameterName + "=" + ((DateTime)oParameterValue).ToString("MM/dd/yyy") + "&";
    //            }
    //            else
    //            {
    //                sRetVal += sParameterName + "=" + HttpUtility.UrlEncode(oParameterValue.ToString()) + "&";
    //            }
    //        }
    //    }


    //    //foreach (string key in htParameters.Keys)
    //    //{
    //    //    if (htParameters[key] != null)
    //    //    rptList.Add(new DictionaryEntry(key, htParameters[key].ToString()));
    //    //    else
    //    //    rptList.Add(new DictionaryEntry(key, htParameters[key]));
    //    //}
    //    return sRetVal.Substring(0, sRetVal.Length - 1);
    //    // return GenerateURL(sReportPath, htParameters, defShowToolbar, defShowParameters);
    //}
    //public static string GenerateURL(string sReportPath, Hashtable htParameters, bool bShowToolbar, bool bShowParameters)
    //{

    //    return "";
    //    // Building URL

    //    //sRetVal += ConfigurationSettings.AppSettings["ReportServer"];
    //    //sRetVal += sReportPath;
    //    //sRetVal += "&rs:Command=Render";
    //    //sRetVal += "&rc:toolbar=" + bShowToolbar.ToString();
    //    //sRetVal += "&rc:parameters=" + bShowParameters.ToString();
    //    //sRetVal += ParametersQueryString(htParameters);
    //    //     sRetVal += "&TOS=" + RepAccessControl.ReportAccessController.EncodeDateTime(DateTime.UtcNow);

    //    //  return sRetVal;
    //}

    #endregion

    #region Private Static Methods

    private static string ParametersQueryString(Hashtable htParameters)
    {
        if (htParameters == null) return "";

        string sQS = "";
        object oParameterValue;

        foreach (string sParameterName in htParameters.Keys)
        {
            oParameterValue = htParameters[sParameterName];

            if (oParameterValue == null)
                sQS += "&" + sParameterName + ":isnull=true";
            else
            {
                if (oParameterValue is bool)
                {
                    sQS += "&" + sParameterName + "=" + ((bool)oParameterValue ? "true" : "false");
                }
                else if (oParameterValue is DateTime)
                {

                    sQS += "&" + sParameterName + "=" + ((DateTime)oParameterValue).ToString("MM/dd/yyy");
                }
                else
                {
                    sQS += "&" + sParameterName + "=" + HttpUtility.UrlEncode(oParameterValue.ToString());
                }
            }
        }

        return sQS;
    }
    

    private static string getViewerName()
    {

        return "~/HealthReports/Viewer/SecurityViewer.aspx?";

        
       
    }
  
    #endregion
}

public class ReportCredentials : Microsoft.Reporting.WebForms.IReportServerCredentials
{

    string _userName, _password, _domain;

    public ReportCredentials(string userName, string password, string domain)
    {

        _userName = userName;

        _password = password;

        _domain = domain;

    }

    public System.Security.Principal.WindowsIdentity ImpersonationUser
    {

        get
        {

            return null;

        }

    }



    public System.Net.ICredentials NetworkCredentials
    {

        get
        {

            return new System.Net.NetworkCredential(_userName, _password, _domain);

        }

    }



    public bool GetFormsCredentials(out System.Net.Cookie authCoki, out string userName, out string password, out string authority)
    {

        userName = _userName;

        password = _password;

        authority = _domain;

        authCoki = new System.Net.Cookie(".ASPXAUTH", ".ASPXAUTH", "/", "Domain");

        return true;

    }

}


