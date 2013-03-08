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
using System.Security.Principal;
using System.Net;
using System.Runtime.InteropServices;

/// <summary>
/// Summary description for CustomReportCredentials
/// </summary>
[Serializable()]
public class CustomReportCredentials : Microsoft.Reporting.WebForms.IReportServerCredentials
{
    [DllImport("advapi32.dll", SetLastError = true)]
    public extern static bool LogonUser(String lpszUsername, String lpszDomain, String lpszPassword, int dwLogonType, int dwLogonProvider, ref IntPtr phToken);

    [DllImport("kernel32.dll", CharSet = CharSet.Auto)]
    public extern static bool CloseHandle(IntPtr handle);

    [DllImport("advapi32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    public extern static bool DuplicateToken(IntPtr ExistingTokenHandle,
        int SECURITY_IMPERSONATION_LEVEL, ref IntPtr DuplicateTokenHandle);
        


	public CustomReportCredentials()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    // local variable for network credential.
    private string _UserName;
    private string _PassWord;
    private string _DomainName;
    public CustomReportCredentials(string UserName, string PassWord, string DomainName)
    {
        _UserName = UserName;
        _PassWord = PassWord;
        _DomainName = DomainName;
    }
    public WindowsIdentity ImpersonationUser
    {
        get
        {            
           // return null;  // not use ImpersonationUser
            string[] args = new string[3] { this._DomainName.ToString(), this._UserName.ToString(), this._PassWord.ToString() }; 
            IntPtr tokenHandle = new IntPtr(0);
            IntPtr dupeTokenHandle = new IntPtr(0);

            const int LOGON32_PROVIDER_DEFAULT = 0;
            //This parameter causes LogonUser to create a primary token.
            const int LOGON32_LOGON_INTERACTIVE = 2;
            const int SecurityImpersonation = 2;

            tokenHandle = IntPtr.Zero;
            dupeTokenHandle = IntPtr.Zero;
        try
        {
            // Call LogonUser to obtain an handle to an access token.
            bool returnValue = LogonUser(args[1], args[0], args[2],LOGON32_LOGON_INTERACTIVE, LOGON32_PROVIDER_DEFAULT, ref tokenHandle);

            if (false == returnValue)
            {
                Console.WriteLine("LogonUser failed with error code : {0}",
                Marshal.GetLastWin32Error());
                return null;
            }

            // Check the identity.
            System.Diagnostics.Trace.WriteLine("Before impersonation: " + WindowsIdentity.GetCurrent().Name);


            bool retVal = DuplicateToken(tokenHandle, SecurityImpersonation, ref dupeTokenHandle);
            if (false == retVal)
            {
                CloseHandle(tokenHandle);
                Console.WriteLine("Exception in token duplication.");
                return null;
            }


            // The token that is passed to the following constructor must 
            // be a primary token to impersonate.
            WindowsIdentity newId = new WindowsIdentity(dupeTokenHandle);
            WindowsImpersonationContext impersonatedUser = newId.Impersonate();


            // Free the tokens.
            if (tokenHandle != IntPtr.Zero)
                CloseHandle(tokenHandle);
            if (dupeTokenHandle != IntPtr.Zero)
                CloseHandle(dupeTokenHandle);

            // Check the identity.
            System.Diagnostics.Trace.WriteLine("After impersonation: " + WindowsIdentity.GetCurrent().Name);

            return newId;

        }
        catch (Exception ex)
        {
            Console.WriteLine("Exception occurred. " + ex.Message);
        }
                
                return null;
            }
    }           
    public ICredentials NetworkCredentials
    {
        get
        {

            // use NetworkCredentials
            return new NetworkCredential(_UserName, _PassWord, _DomainName);
        }
    }
    
    public bool GetFormsCredentials(out Cookie authCookie, out string user, out string password, out string authority)
    {

        // not use FormsCredentials unless you have implements a custom autentication.
        authCookie = null;
        user = password = authority = null;
        return false;
    }




}
